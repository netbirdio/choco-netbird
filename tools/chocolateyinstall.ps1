$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$version = '0.28.8'
$url64 = "https://github.com/netbirdio/netbird/releases/download/v${version}/netbird_installer_${version}_windows_amd64.msi"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType = 'msi'
  url64bit = $url64

  softwareName = 'NetBird*'

  checksum64 = '369b849bfe4b56a4d081ccb796755a2a7fa45ab36876cbbad0f096076ceffc11'
  checksumType64 = 'sha256'

  silentArgs = "/qn"
  validExitCodes = @(0)
}

if (-not ([System.Environment]::Is64BitOperatingSystem)) {
  throw "This package requires a 64-bit version of Windows."
}

Install-ChocolateyPackage @packageArgs
