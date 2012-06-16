@ECHO OFF
CLS
ECHO Presentation Script!
GOTO presentation
GOTO:EOF

:presentation
echo **************Presentations:**************
dir /B/A:D | findstr /v /i ".git template"
echo ******************************************
set /p Input=Presentation Name:
cd %Input%
call showoff serve
pause
GOTO presentation
