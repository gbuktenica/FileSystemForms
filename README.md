# FileSystemForms

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Copyright Glen Buktenica](https://img.shields.io/badge/Copyright-Glen_Buktenica-blue.svg)](https://github.com/gbuktenica)

Launch a Windows form to allow user selection of files and folders on local or network files systems.

## Usage

```PowerShell
Install-Module -Name FileSystemForms
Import-Module  -Name FileSystemForms

# Select the path and file name for a file to be written to.
$FileSavePath    = Select-FileSystemForm -Start ([Environment]::GetFolderPath('MyDocuments')) -Description "Save File" -Ext "csv" -File -Save

# Read the contents of a number of text files in to a variable.
$TextFileContent = Select-FileSystemForm -File -Ext txt -Start $PSScriptRoot | ForEach-Object {Get-Content $_}

# Read the path and file name for a file.
$FileOpenPath    = Select-FileSystemForm -File -ErrorAction Stop -Verbose

# Read the path of a folder / directory.
$FolderOpenPath  = Select-FileSystemForm 
```

![Animation](/images/Animation.gif)

## Installation

### On-line with PowerShell > 5.0

```PowerShell
Install-Module -Name FileSystemForms
```

### Offline

Copy FileSystemForms.psd1 and Select-FileSystemForm.ps1 to one of the locations contained in:

```powershell
$Env:PSModulePath
```
