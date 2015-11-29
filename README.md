# azure-ssl-configure
This is a template project containing start up scripts to disable ssl 2.0, ssl3.0, configure recommended cipher suite order for your windows azure service, as well as disabling RC4 ciphers.

## How did it get created? 
### First, 
create a normal new Azure project with a web role/worker role, or simply start with your own existing project.
### Second, add scripts
Add a new folder in your web role/worker role project "Startup", copy SSLConfigure.cmd and SSLConfigure.ps1 files into this folder, and add these files into your project.
Make these files being copied to output by setting their property "CopyToOutputDirectory“ to ”Copy Always".
### Third, update service definition file
Add these lines to your ServiceDefinition.csdef file in your Azure project, place it under the corresponding role element of your role project.
```
<WebRole>
...
  <Startup>
    <Task commandLine="Startup\SSLConfigure.cmd" executionContext="elevated" taskType="simple">
    </Task>
  </Startup>
</WebRole>
```

###Done!

Then try to deploy it have enjoy!!
