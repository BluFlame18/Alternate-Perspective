$ErrorActionPreference = 'Stop'

$repoRoot = (& git rev-parse --show-toplevel).Trim()
if ([string]::IsNullOrWhiteSpace($repoRoot)) {
  throw 'Could not resolve repository root via git rev-parse.'
}

Push-Location $repoRoot
try {
  & git config core.hooksPath .githooks
  if ($LASTEXITCODE -ne 0) {
    throw 'Failed to set core.hooksPath to .githooks'
  }

  Write-Host 'Git hooks configured: core.hooksPath=.githooks'
}
finally {
  Pop-Location
}
