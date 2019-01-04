#Stuff to get ready for the things:
#==========================================
$restartRequired = 'True'
$isDotNetOk = 'False'


#Check if .NET framework 4.5 is installed:
#==========================================

# PowerShell 4 - works on mine, returns "True"
$isDotNetOk = (Get-ItemProperty "HKLM:SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full").Release -gt 378389



#Enable websockets:
#==========================================

$websocketStatus = Enable-WindowsOptionalFeature -FeatureName IIS-WebSockets -Online
$restartRequired = ($websocketStatus.RestartNeeded)




#Check if there's an existing site using ports 80/443:
#==========================================
Import-Module NetSecurity





#Create a firewall rule for the custom ports:
#============================================
new-netfirewallrule -Action Allow -Direction Inbound -Enabled True -Protocol TCP  -LocalPort 8080 -DisplayName "SourceDay IIS port inbound"
new-netfirewallrule -Action Allow -Direction Outbound -Enabled True -Protocol TCP  -LocalPort 8080 -DisplayName "SourceDay IIS port outbound"



#stuff to git the files ready for the website. (downloaded from a public git repo? or maybe from an FTP site)
#==========================================





#Stuff to  add site with appropriate settings to IIS automatically
$site = Get-IISSite -Name gp2010
Echo @site

$apps = Get-IISAppPool
Echo "List of Application Pools:"
foreach ($app in $apps) {
    Echo @app
    }




#Stuff to test connection string to SQL Server

#Script to prime and set up permission and db user

#Eventually auto-launch the integration test suite.