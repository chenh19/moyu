@ECHO OFF

@ wait function
:waitFor
setlocal enabledelayedexpansion
  set "sleepFor=%~1"
 
  call :currentTime startTime
  :: Note, dont use a for loop, the cmd prompt would try to expand each iteration, and that is a big problem
  :loopStart
    call :currentTime curTime
    call :getTimeDiff result !startTime! !curTime!
 
   set /A timeDiffMs=!result!*10
   if !timeDiffMs! GTR !sleepFor! ( goto :return )
 
   set /A timeRemaining=!sleepFor!-!timeDiffMs!
   if !timeRemaining! GTR 1200 ( timeout /nobreak /t 1 >nul 2>&1 )
  goto :loopStart
 
  :return
endlocal
goto :eof
 
:currentTime
setlocal
  set "curTime=%TIME%"
  :: For some stupid reason if the hour < 10, it uses a blank space instead of a leading zero
  if [^%curTime:~0,1%]==[^ ] set "curTime=0%curTime:~1%"
endlocal & set %~1=%curTime%
goto :eof
 
:getTimeDiff
setlocal
  set "startTime=%~2"
  set "endTime=%~3"
 
  set /A startTime=(1%startTime:~0,2%-100)*360000 + (1%startTime:~3,2%-100)*6000 + (1%startTime:~6,2%-100)*100 + (1%startTime:~9,2%-100)
  set /A endTime=(1%endTime:~0,2%-100)*360000 + (1%endTime:~3,2%-100)*6000 + (1%endTime:~6,2%-100)*100 + (1%endTime:~9,2%-100)
  set /A duration=%endTime%-%startTime%
  if %endTime% LSS %startTime% set set /A duration=%startTime%-%endTime%
endlocal & set "%~1=%duration%"
goto :eof


@REM set cmd font color
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"
echo.

@REM get a script URL
echo %ESC%[33mPlease specify a github script to moyu: %ESC%[0m
echo.

set scripturl=https://raw.githubusercontent.com/chenh19/BRStudio/master/BRStudio.R
curl %scripturl% -o %HOMEPATH%\.moyu.txt
echo.


@REM get running time
echo %ESC%[33mPlease specify a time duration to moyu (minutes): %ESC%[0m
echo.


@REM run
echo %ESC%[33mTest%ESC%[0m
echo.

for /f "tokens=*" %%s in (%HOMEPATH%\.moyu.txt) do (
  echo %%s && call :waitfor 300>nul
)

echo %ESC%[32mTest%ESC%[0m
echo.


@REM cleanup and exit
@del /f %HOMEPATH%\.moyu.txt
echo %ESC%[33mFinalizing and exporting results... %ESC%[0m
timeout /t 15 > nul
echo.
echo %ESC%[32mAll done! %ESC%[0m
timeout /t 1 > nul
echo.
