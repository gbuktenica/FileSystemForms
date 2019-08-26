# FileSystemForms

Launch a Windows form to allow user selection of files and folders on local or network files systems.

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
C:\Program Files\WindowsPowerShell\Modules\FileSystemForms\1.0.0.0
```

C:\Windows\system32\WindowsPowerShell\v1.0\Modules\FileSystemForms\<version>  
e.g.

```text
C:\Windows\system32\WindowsPowerShell\v1.0\Modules\FileSystemForms\1.0.0.0
```

C:\Users\<ProfilePath>\Documents\WindowsPowerShell\Modules\FileSystemForms\<version>  
e.g.

```text
C:\Users\Glen\Documents\WindowsPowerShell\Modules\FileSystemForms\1.0.0.0
```

## Usage

```PowerShell
Import-Module FileSystemForms -Force

$FileSavePath = Select-FileSystemForm -Start ([Environment]::GetFolderPath('MyDocuments')) -Description "Save File" -Ext "csv" -File -Save

$TextFileContent = Select-FileSystemForm -File -Ext txt -Start c:\scripts | ForEach {Get-Content $_}

$FileOpenPath = Select-FileSystemForm -File -ErrorAction Stop
```
