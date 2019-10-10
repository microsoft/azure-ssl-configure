SET LOG_FILE="%TEMP%\StartupLog.txt"
SET EXECUTE_PS1=0

IF "%ComputeEmulatorRunning%" == "" (
	SET EXECUTE_PS1=1
)

IF "%ComputeEmulatorRunning%" == "false" (
	SET EXECUTE_PS1=1
) 

IF %EXECUTE_PS1% EQU 1 (
	echo "Invoking SSLConfigure.ps1 on Azure service at %TIME% on %DATE%" >> %LOG_FILE% 2>&1	
	PowerShell -ExecutionPolicy Unrestricted %~dp0SSLConfigure.ps1 -sco  >> %LOG_FILE% 2>&1
) ELSE (
	echo "Skipping SSLConfigure.ps1 invocation on emulated environment" >> %LOG_FILE% 2>&1	
)    

EXIT /B %ERRORLEVEL%