SET LOG_FILE="%TEMP%\StartupLog.txt"

if "%ComputeEmulatorRunning%" == "false" (
	echo "Invoking SSLConfigure.ps1 on Azure service" >> %LOG_FILE% 2>&1	
	PowerShell -ExecutionPolicy Unrestricted .\Startup\SSLConfigure.ps1 -sco  >> "%TEMP%\StartupLog.txt" 2>&1
) else (
	echo "Skipping SSLConfigure.ps1 invocation on emulated environment" >> %LOG_FILE% 2>&1	
)    

EXIT /B 0 