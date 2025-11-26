$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version = '0.60.3'
$url64 = "https://github.com/netbirdio/netbird/releases/download/v${version}/netbird_installer_${version}_windows_amd64.msi"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType = 'msi'
  url64bit = $url64

  softwareName = 'NetBird*'

  checksum64 = 'b3afe95d13f35e5906ae1ad5c0a8a3eaef7fe2c0d379cfdceb1e9c490257bba3'
  checksumType64 = 'sha256'

  silentArgs = "/qn"
  validExitCodes = @(0)
}

if (-not ([System.Environment]::Is64BitOperatingSystem)) {
  throw "This package requires a 64-bit version of Windows."
}

Install-ChocolateyPackage @packageArgs
