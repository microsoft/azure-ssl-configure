<<<<<<< HEAD
﻿# azure-ssl-configure
=======
# azure-ssl-configure

This is a sample and template Azure Web Role project containing start up scripts to disable ssl 2.0, ssl3.0 and RC4 cipher suites, configure recommended cipher suite order for your windows azure service or any windows server to be securely service on TLS/SSL channels. This is highly important to protect the data-in-transit for users of Windows/Windows Azure, as nowadays the internet is pretty heavily militarized.

Licensed under [MIT License](https://opensource.org/licenses/MIT)

####Updated to be compatible with Windows XP -- 1/24/2017

### How did it get created? 
#### First, 
Simply open with your own existing Azure Web Role project.
#### Second, add scripts
Add a new folder in your web role/worker role project "Startup", copy [SSLConfigure.cmd](AzureCloudServiceSample/WebRoleSample/Startup/SSLConfigure.cmd ) and [SSLConfigure.ps1](AzureCloudServiceSample/WebRoleSample/Startup/SSLConfigure.ps1) files into this folder, and add these files into your project.

Make these files being copied to output by setting their property "CopyToOutputDirectory“ to ”Copy Always".
#### Third, update service definition file
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
#### Fourth, update the publish profile
If you have an existing Azure Web Role deployed, the recommended AzureDeploymentReplacementMethod in your publish profile is "AutomaticUpgrade", instead of "DeleteAndCreate". If you don't have existing deployment, you can use DeleteAndCreate too.

#### Publish your package and Done!

Then try to deploy it have enjoy!!
