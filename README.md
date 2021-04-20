# FileSystemForms

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Copyright Glen Buktenica](https://img.shields.io/badge/Copyright-Glen_Buktenica-blue.svg)](https://github.com/gbuktenica)

Launch a Windows form to allow user selection of files and folders on local or network files systems.

## Usage

```PowerShell
Install-Module -Name FileSystemForms
Import-Module  -Name FileSystemForms

$FileSavePath    = Select-FileSystemForm -Start ([Environment]::GetFolderPath('MyDocuments')) -Description "Save File" -Ext "csv" -File -Save

$TextFileContent = Select-FileSystemForm -File -Ext txt -Start $PSScriptRoot | ForEach-Object {Get-Content $_}

$FileOpenPath    = Select-FileSystemForm -File -ErrorAction Stop -Verbose

$FolderOpenPath  = Select-FileSystemForm 
```

## Installation

### On-line with PowerShell > 5.0

```PowerShell
Install-Module -Name FileSystemForms
```

### Offline

Copy all files to one of the following locations:

C:\Program Files\WindowsPowerShell\Modules\FileSystemForms\<version>  
e.g.

```text
C:\Program Files\WindowsPowerShell\Modules\FileSystemForms\2.0.0
```

C:\Windows\system32\WindowsPowerShell\v1.0\Modules\FileSystemForms\<version>  
e.g.

```text
C:\Windows\system32\WindowsPowerShell\v1.0\Modules\FileSystemForms\2.0.0
```

C:\Users\<ProfilePath>\Documents\WindowsPowerShell\Modules\FileSystemForms\<version>  
e.g.

```text
C:\Users\Glen\Documents\WindowsPowerShell\Modules\FileSystemForms\2.0.0
```

