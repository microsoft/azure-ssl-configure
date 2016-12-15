# azure-ssl-configure
This is a sample and template Azure Web Role project containing start up scripts to disable ssl 2.0, ssl3.0 and RC4 cipher suites, configure recommended cipher suite order for your windows azure service or any windows server to be securely service on TLS/SSL channels. This is highly important to protect the data-in-transit for users of Windows/Windows Azure, as nowadays the internet is pretty heavily militarized.

Licensed under [MIT License](https://opensource.org/licenses/MIT)

####Updated for latest, -- 11/22/2016
*NOTE: If you are on Windows 10 or above, you need to update the SSLConfigure.ps1 file a little bit on the cipher suite order. Look for comments in SSLConfigure.ps1 file, comment out the pre-windows 10 cipher suite order, and uncomment the Windows 10 cipher suite order string.*

## How did it get created? 
### First, 
create a normal new Azure project with a web role/worker role, or simply start with your own existing project.
### Second, add scripts
Add a new folder in your web role/worker role project "Startup", copy [SSLConfigure.cmd](https://github.com/qinxgit/azure-ssl-configure/blob/master/AzureCloudServiceSample/WebRoleSample/Startup/SSLConfigure.cmd ) and [SSLConfigure.ps1](https://github.com/qinxgit/azure-ssl-configure/blob/master/AzureCloudServiceSample/WebRoleSample/Startup/SSLConfigure.ps1) files into this folder, and add these files into your project.
Make these files being copied to output by setting their property "CopyToOutputDirectory“ to ”Copy Always".
### Third, update service definition file
Add these lines to your ServiceDefinition.csdef file in your Azure project, place it under the corresponding role element of your role project.
```
<WebRole>
...
  <Startup>
    <Task commandLine="Startup\SSLConfigure.cmd" executionContext="elevated" taskType="simple">
	    <Environment>
          <Variable name="ComputeEmulatorRunning">
            <RoleInstanceValue xpath="/RoleEnvironment/Deployment/@emulated" />
          </Variable>
        </Environment>
    </Task>
  </Startup>
</WebRole>
```

###Done!

Then try to deploy it have enjoy!!
