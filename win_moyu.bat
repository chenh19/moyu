@ECHO OFF

@REM pause function
echo ms = WScript.Arguments(0) >> %HOMEPATH%\SLEEP.VBS
echo WScript.Sleep ms >> %HOMEPATH%\SLEEP.VBS

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
echo %ESC%[33mProceeding to the next step... %ESC%[0m
echo.

for /f "tokens=*" %%s in (%HOMEPATH%\.moyu.txt) do (
  echo %%s
  CSCRIPT %HOMEPATH%\SLEEP.VBS 10 //Nologo
)

echo.
echo %ESC%[32mFinished! %ESC%[0m
echo.


@REM cleanup and exit
echo %ESC%[33mFinalizing and exporting results... %ESC%[0m
CSCRIPT %HOMEPATH%\SLEEP.VBS 15000 //Nologo
echo.
echo %ESC%[32mAll done! %ESC%[0m
CSCRIPT %HOMEPATH%\SLEEP.VBS 300 //Nologo
echo.
del /f %HOMEPATH%\.moyu.txt %HOMEPATH%\SLEEP.VBS
