$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version = '0.65.0'
$url64 = "https://github.com/netbirdio/netbird/releases/download/v${version}/netbird_installer_${version}_windows_amd64.msi"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType = 'msi'
  url64bit = $url64

  softwareName = 'NetBird*'

  checksum64 = '4b948d73c8a69368472a8a3c436e89349e7bb5199a00e8eea10c8d4aeddb1fee'
  checksumType64 = 'sha256'

  silentArgs = "/qn"
  validExitCodes = @(0)
}

if (-not ([System.Environment]::Is64BitOperatingSystem)) {
  throw "This package requires a 64-bit version of Windows."
}

Install-ChocolateyPackage @packageArgs
