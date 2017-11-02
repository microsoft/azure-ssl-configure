# azure-ssl-configure

**This repo is discontinued. It has been moved to [https://github.com/Microsoft/azure-ssl-configure](https://github.com/Microsoft/azure-ssl-configure)**


This is a sample and template Azure Web Role project containing start up scripts to disable ssl 2.0, ssl3.0 and RC4 cipher suites, configure recommended cipher suite order for your windows azure service or any windows server to be securely service on TLS/SSL channels. This is highly important to protect the data-in-transit for users of Windows/Windows Azure, as nowadays the internet is pretty heavily militarized.

Licensed under [MIT License](https://opensource.org/licenses/MIT)

####Updated to be compatible with Windows XP -- 1/24/2017
*NOTE: If you are on Windows 10 or above, you need to update the SSLConfigure.ps1 file a little bit on the cipher suite order. Look for comments in SSLConfigure.ps1 file, comment out the pre-windows 10 cipher suite order, and uncomment the Windows 10 cipher suite order string. Most of the Azure VMs are not on Window 10. *

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
If you have an existing Azure Web Role deployed, **you have to update the publish profile to DeleteAndCreate**. The "AutomaticUpgrade" value **doesn't execute** the script in previous steps. If you don't have existing deployment, you can ignore this step.

Find your `<filename>.azurePubxml`, and make sure the AzureDeploymentReplacementMethod element is like the following, and also it is your discretion that whether this DeleteAndCreate manner fits into your business needs. 

```
<AzureDeploymentReplacementMethod>DeleteAndCreate</AzureDeploymentReplacementMethod>
```

#### Publish your package and Done!

Then try to deploy it have enjoy!!
