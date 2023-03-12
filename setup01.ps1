# setup01.ps1
# author:  jeff
# created: 2023-03-12
# updated: 


# Check if curl is installed, if not, install it
if (!(Get-Command curl -ErrorAction SilentlyContinue)) {
    Write-Output "curl not found, installing..."
    Invoke-WebRequest -Uri "https://curl.se/windows/dl-7.79.1_4/curl-7.79.1_4-win64-mingw.zip" -OutFile "$env:USERPROFILE\Downloads\curl.zip"
    Expand-Archive -LiteralPath "$env:USERPROFILE\Downloads\curl.zip" -DestinationPath "$env:USERPROFILE\curl"
    $env:Path += ";$env:USERPROFILE\curl\bin"
    Write-Output "curl installed successfully."
}

# Check if pip is installed, if not, install it
if (!(Get-Command pip -ErrorAction SilentlyContinue)) {
    Write-Output "pip not found, installing..."
    Invoke-WebRequest -Uri "https://bootstrap.pypa.io/get-pip.py" -OutFile "$env:USERPROFILE\Downloads\get-pip.py"
    python "$env:USERPROFILE\Downloads\get-pip.py"
    Write-Output "pip installed successfully."
}

# Check if Python 3 is installed, if not, install it
if (!(Get-Command python -ErrorAction SilentlyContinue)) {
    Write-Output "Python 3 not found, installing..."
    Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.11.0/python-3.11.0-amd64.exe" -OutFile "$env:USERPROFILE\Downloads\python-3.11.0-amd64.exe"
    Start-Process -FilePath "$env:USERPROFILE\Downloads\python-3.11.0-amd64.exe" -ArgumentList "/quiet", "InstallAllUsers=1", "PrependPath=1" -Wait
    Write-Output "Python 3 installed successfully."
}

# Install required Python packages
Write-Output "Installing Django, Django REST Framework, and Django JWT..."
python -m pip install django djangorestframework djangorestframework-jwt
Write-Output "Packages installed successfully."
