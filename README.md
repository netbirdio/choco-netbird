# NetBird Chocolatey package

## Description
This is a definition for the NetBird Chocolatey package.
The package can be found in Chocolatey package registry: https://community.chocolatey.org/packages/netbird

## Deployment Method: Individual Install, Upgrade, & Uninstall

### Install
To install NetBird, run the following command from the command line or PowerShell:
```
choco install netbird
```

### Upgrade
To upgrade NetBird package to the latest available package version, run the following command from the command line or PowerShell:
```
choco upgrade netbird
```

### Uninstall
To uninstall NetBird, run the following command from the command line or PowerShell:
```
choco uninstall netbird
```

## Winget Package

This repository also includes automated workflows to publish NetBird to the Windows Package Manager (Winget) repository.

### Setup Requirements

To enable automatic Winget package publishing, you need to configure the following:

1. **GitHub Personal Access Token (PAT)**: Create a PAT with the `repo` scope to authenticate submissions to the Winget repository
2. **Repository Secret**: Add the PAT as a repository secret named `WINGET_PAT`

### Workflow Triggers

The Winget publishing workflow (`publish-winget.yml`) is triggered by:
- **Automatic**: When a new release is published in the NetBird repository
- **Manual**: Via workflow dispatch with a specific version input

### How it Works

1. The workflow detects new NetBird releases
2. Downloads the latest `wingetcreate` tool
3. Extracts version information and MSI installer URL
4. Uses `wingetcreate` to update the Winget manifest
5. Automatically submits a pull request to the Windows Package Manager Community Repository

### Manual Publishing

You can manually trigger the Winget publishing workflow by:
1. Going to the "Actions" tab in GitHub
2. Selecting "Publish Netbird to Winget" workflow
3. Clicking "Run workflow"
4. Entering the desired NetBird version (e.g., `0.59.7`)

### Installation via Winget

Once published, users can install NetBird using:
```
winget install netbirdio.netbird
```
