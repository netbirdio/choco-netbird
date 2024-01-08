$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version = '0.25.2'
$url64 = "https://github.com/netbirdio/netbird/releases/download/v${version}/netbird_installer_${version}_windows_amd64.msi"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType = 'msi'
  url64bit = $url64

  softwareName = 'netbird client *'

  checksum64 = '69ec7a4c73c8ecb6d0a800a24c339bdde9e6600d71547bf47974ac6b495fa250'
  checksumType64 = 'sha256'

  silentArgs = "/qn"
  validExitCodes = @(0)
}

if (-not ([System.Environment]::Is64BitOperatingSystem)) {
  throw "This package requires a 64-bit version of Windows."
}

Install-ChocolateyPackage @packageArgs
