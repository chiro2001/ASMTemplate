@echo off

set root_dir=.\build\DISK_C
set asm_file=%2
set asm_name=%asm_file:~0,-4%

if "%asm_file%" == "" (
  set asm_file=main.asm
)

if "%1" == "" (
  echo Commands: make.cmd [clean copy start build vtest] [filename.asm]
  goto end
)

if "%1" == "clean" (
  if exist %root_dir%\asm (
    echo deleting file: %root_dir%\asm
    rd /q /s %root_dir%\asm
  )
  goto end
)

if "%1" == "copy" (
  echo copying .\asm to %root_dir%\asm
  xcopy .\asm %root_dir%\asm /e /Y /d /i
  goto end
)

if "%1" == "start" (
  make clean
  make copy
  start .\build\dosbox\dosbox.exe -conf scripts\start.conf -noconsole -noautoexec ^
    -c "mount C .\build\DISK_C" ^
    -c "path C:\;C:\masm" ^
    -c "C:" ^
    -c "cd asm" ^
    -c "pause" ^
    -c "exit"
  goto end
)

if "%1" == "build" (
  make clean
  make copy
  start .\build\dosbox\dosbox.exe -conf scripts\build.conf -noconsole -noautoexec ^
    -c "mount C .\build\DISK_C" ^
    -c "path C:\;C:\masm" ^
    -c "C:" ^
    -c "cd asm" ^
    -c "masm %asm_file%;" ^
    -c "link %asm_name%;" ^
    -c "%asm_name%.exe" ^
    -c "pause" ^
    -c "exit"
  goto end
)

if "%1" == "debug" (
  make clean
  make copy
  start .\build\dosbox\dosbox.exe -conf scripts\debug.conf -noconsole -noautoexec ^
    -c "mount C .\build\DISK_C" ^
    -c "path C:\;C:\masm" ^
    -c "C:" ^
    -c "cd asm" ^
    -c "masm %asm_file%;" ^
    -c "link %asm_name%;" ^
    -c "debug %asm_name%.exe" ^
    -c "pause" ^
    -c "exit"
  goto end
)

if "%1" == "vtest" (
  make clean
  make copy
  start .\build\dosbox\dosbox.exe -conf scripts\build-vtest.conf -noconsole
  goto end
)

:end