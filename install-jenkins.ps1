# install-jenkins.ps1
# author:  jeff
# created: 2023-03-12
# updated: 

# *** MUST BE RUN IN ADMIN POWERSHELL WINDOW ***

# script downloads and installs Jenkins on Windows

# Set the Jenkins version
$JenkinsVersion = "2.318"

# Set the Jenkins download URL
$JenkinsUrl = "https://get.jenkins.io/war-stable/$JenkinsVersion/jenkins.war"

# Download the Jenkins WAR file
Invoke-WebRequest -Uri $JenkinsUrl -OutFile "$env:USERPROFILE\Downloads\jenkins.war"

# Install Java if it's not already installed
if (!(Get-Command java -ErrorAction SilentlyContinue)) {
    Write-Output "Java not found, installing..."
    Invoke-WebRequest -Uri "https://javadl.oracle.com/webapps/download/AutoDL?BundleId=244053_61ae65e088624f5aaa0b1d2d801acb16" -OutFile "$env:USERPROFILE\Downloads\jre.exe"
    Start-Process -FilePath "$env:USERPROFILE\Downloads\jre.exe" -ArgumentList "/s" -Wait
    $env:Path += ";C:\Program Files (x86)\Common Files\Oracle\Java\javapath"
    Write-Output "Java installed successfully."
}

# Start Jenkins as a Windows service
java -jar "$env:USERPROFILE\Downloads\jenkins.war" --install
