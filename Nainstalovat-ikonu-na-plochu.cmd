@echo off
setlocal
powershell -NoProfile -ExecutionPolicy Bypass -Command "$root=[IO.Path]::GetFullPath('%~dp0'); $b64=(Get-Content -Raw -LiteralPath ($root+'A24-OSVC-Radar.ico.b64')).Trim(); $icon=$root+'A24-OSVC-Radar.ico'; [IO.File]::WriteAllBytes($icon,[Convert]::FromBase64String($b64)); $desktop=[Environment]::GetFolderPath('Desktop'); $shell=New-Object -ComObject WScript.Shell; $shortcut=$shell.CreateShortcut((Join-Path $desktop 'A24 OSVC Radar.lnk')); $shortcut.TargetPath=$root+'Spustit-OSVC-Radar.cmd'; $shortcut.WorkingDirectory=$root; $shortcut.IconLocation=$icon+',0'; $shortcut.Description='A24 OSVC Radar'; $shortcut.Save()"
if errorlevel 1 (
  echo Instalace ikony se nepodarila.
  pause
  exit /b 1
)
echo Hotovo. Ikona A24 OSVC Radar byla vytvorena na plose.
pause
