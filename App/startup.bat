@ECHO OFF & TITLE ��� clash ��������
>NUL 2>&1 REG.exe query "HKU\S-1-5-19" || (
    ECHO SET UAC = CreateObject^("Shell.Application"^) > "%TEMP%\Getadmin.vbs"
    ECHO UAC.ShellExecute "%~f0", "%1", "", "runas", 1 >> "%TEMP%\Getadmin.vbs"
    "%TEMP%\Getadmin.vbs"
    DEL /f /q "%TEMP%\Getadmin.vbs" 2>NUL
    Exit /b
)

:menu
cls
echo.&echo.
echo -------------------------------------
echo.
echo.
echo ��ѡ��
echo.
echo.  [1] ��������
echo.
echo.  [2] ɾ����������
echo.
echo.  [X] �˳�
echo.
choice /C:12X /N /M  "���������ѡ�"

if errorlevel 3 exit
if errorlevel 2 goto :delete
if errorlevel 1 goto :startup

:startup
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "clash-web" /t REG_SZ /d "\"%~DP0App\start-clash.vbs\"" /f

echo ��ӳɹ���������������˵� &pause >NUL

call Clash.bat

:delete
Reg.exe delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v "clash-web"  /f>NUL 2>NUL

echo ��ӳɹ���������������˵� &pause >NUL

call Clash.bat