@ECHO OFF

@REM set cmd font color
for /F %%a in ('echo prompt $E ^| cmd') do set "ESC=%%a"


@REM get a script URL
echo %ESC%[32mPlease specify a github script to moyu: %ESC%[0m

set scripturl=https://raw.githubusercontent.com/chenh19/BRStudio/master/BRStudio.R
curl %scripturl% -o %HOMEPATH%\.moyu.txt


@REM get running time

echo %ESC%[32mTest%ESC%[0m
echo %ESC%[33mTest%ESC%[0m


@REM run



@REM cleanup and exit
del /f %HOMEPATH%\.moyu.txt
echo %ESC%[32mFinalizing and exporting results... %ESC%[0m
echo %ESC%[33mAll done! %ESC%[0m
