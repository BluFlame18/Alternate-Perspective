@echo off
setlocal

:: Check Spriggit CLI path
if not defined SPRIGGIT_PATH (
  echo [ERROR] SPRIGGIT_PATH is not set.
  goto :fail
)

if not exist "%SPRIGGIT_PATH%\Spriggit.CLI.exe" (
  echo [ERROR] Spriggit.CLI.exe not found in SPRIGGIT_PATH: %SPRIGGIT_PATH%
  goto :fail
)

:: Setup Hooks & Plugins
echo [1/2] Configuring git hooks...
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0Tools\setup-hooks.ps1"
if errorlevel 1 (
  echo [ERROR] Hook setup failed.
  goto :fail
)

echo.
echo [2/2] Building AlternatePerspective.esp from serialized data...
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0Tools\run-spriggit.ps1" -Mode deserialize
if errorlevel 1 (
  echo [ERROR] Spriggit deserialize failed.
  goto :fail
)

echo.
echo Bootstrap complete.
goto :end

:fail
echo.
echo Bootstrap did not complete successfully. See errors above.
exit /b 1

:success
echo.
echo Bootstrap complete.
goto :end

:end
endlocal
