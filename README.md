# powershell-scripts

A collection of helpful Powershell scripts I've come across and had to use at one time or another.

## Getting Started

Follow the below steps to install and use these modules.

### Allow scripts to run

```powershell
PS> Set-ExecutionPolicy RemoteSigned
```
If that doesn't work, you may have to set the permission for the current user specifically.

```powershell
PS> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Creating Modules

Create a new folder, then copy the template into the folder.  Once it is
created, you can run the below to create module manifests.

```powershell
PS> ./CreateModuleManifests
```

## Installing or Updating Modules

If installing a module for the first time, or if you've made changes you want to apply, run the below.

```powershell
PS> . ./InstallModules
```
