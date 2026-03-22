param(
  [ValidateSet('serialize', 'deserialize')]
  [string]$Mode = 'serialize',

  [string]$PluginPath = 'AlternatePerspective.esp',
  [string]$SerializedPath = 'esp',
  [switch]$Stage,
  [switch]$SkipIfUnchanged
)

$ErrorActionPreference = 'Stop'

$spriggitExe = Join-Path $env:SPRIGGIT_PATH 'Spriggit.CLI.exe'
if (-not (Test-Path $spriggitExe)) {
  throw "Spriggit.CLI.exe not found at $spriggitExe. Ensure SPRIGGIT_PATH is set correctly."
}

$repoRoot = (& git rev-parse --show-toplevel).Trim()
Push-Location $repoRoot
try {
  if ($Mode -eq 'serialize') {
    $pluginFullPath = Join-Path $repoRoot $PluginPath
    if (-not (Test-Path $pluginFullPath)) {
      Write-Host "Plugin file not found: $PluginPath. Has the plugin not been build? Skipping serialization."
      return
    }

    $stateFile = Join-Path (Join-Path $repoRoot '.git') 'spriggit-esp.sha256'
    if ($SkipIfUnchanged) {
      $currentHash = (Get-FileHash -Path $pluginFullPath -Algorithm SHA256).Hash
      $previousHash = if (Test-Path $stateFile) { (Get-Content $stateFile -Raw).Trim() } else { '' }
      if ($currentHash -eq $previousHash) {
        Write-Host 'ESP unchanged since last serialize; skipping.'
        return
      }
    }

    New-Item -ItemType Directory -Path $SerializedPath -Force | Out-Null

    if (Test-Path (Join-Path $SerializedPath '.spriggit')) {
      & $spriggitExe serialize -i $pluginFullPath -o $SerializedPath
    }
    else {
      & $spriggitExe serialize -i $pluginFullPath -o $SerializedPath -g 'SkyrimSE' -p 'Spriggit.Yaml.Skyrim' -v '0.40'
    }
    if ($LASTEXITCODE -ne 0) { throw 'Spriggit serialize failed.' }

    if ($SkipIfUnchanged) {
      $finalHash = (Get-FileHash -Path $pluginFullPath -Algorithm SHA256).Hash
      Set-Content -Path $stateFile -Value $finalHash
    }

    if ($Stage) {
      & git add -- $SerializedPath
      if ($LASTEXITCODE -ne 0) { throw 'Failed to stage serialized output.' }
    }

    Write-Host "Serialized plugin to $SerializedPath"
  }
  else {
    $serializedFullPath = Join-Path $repoRoot $SerializedPath
    if (-not (Test-Path $serializedFullPath)) {
      throw "Serialized data folder not found: $SerializedPath"
    }

    & $spriggitExe deserialize -i $serializedFullPath -o $PluginPath
    if ($LASTEXITCODE -ne 0) { throw 'Spriggit deserialize failed.' }

    Write-Host "Deserialized plugin to $PluginPath"
  }
}
finally {
  Pop-Location
}
