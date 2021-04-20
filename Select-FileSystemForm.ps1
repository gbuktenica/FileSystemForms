Function Select-FileSystemForm {
    <#
    .SYNOPSIS
        Open or save files or open folders using Windows forms.

    .DESCRIPTION
        Launch a Windows form to allow user selection of files and folders on local or network files systems.

    .PARAMETER Start
        [string] The start directory for the form.
        Default value: Last path used

    .PARAMETER Description
        [string] Text that is included on the chrome of the form and written to the console window.
        Default value: Select <Folder/File> to <Open/Save>

    .PARAMETER Ext
        [string] Adds an extension filter to file open or save forms.
        Default value *.*

    .PARAMETER File
        [switch] When present this switch uses file open or save forms. Used with the Save switch.

    .PARAMETER Save
        [switch] When used with the File switch launches a file save form. When not present launches a file open form.

    .EXAMPLE
        Select-FileSystemForm -Start ([Environment]::GetFolderPath('MyDocuments')) -Description "Save File" -Ext "csv" -File -Save
        Windows save file form filtered for *.csv defaulting to the current users my documents folder and the description "Save File"

    .EXAMPLE
        $TextFile = Select-FileSystemForm -File -Ext txt -Start c:\scripts | ForEach {Get-Content $_}
        Windows file open form will open at location c:\scripts if present. Selected text file(s) will then be read into $TextFile.

    .EXAMPLE
        Select-FileSystemForm -ErrorAction Stop
        Windows folder open form will open. if the cancel button is pressed script processing will stop.

    .INPUTS
        User form input.

    .OUTPUTS
        Full path of folder or file

    .NOTES
        License      : MIT License
        Copyright (c): 2021 Glen Buktenica
        Release      : v2.0.0 20210420
    #>
    [CmdletBinding()]
    Param (
        [parameter(Position = 1)][string] $Start,
        [parameter(Position = 2)][string] $Description,
        [string] $Ext,
        [switch] $File,
        [switch] $Save
    )
    # Set Form type and default description based on input switches
    Add-Type -AssemblyName System.Windows.Forms
    if ($File) {
        if ($Save) {
            $OpenForm = New-Object System.Windows.Forms.SaveFileDialog
            if (-not $Description) {
                $Description = "Select file to save"
            }
        } else {
            $OpenForm = New-Object System.Windows.Forms.OpenFileDialog
            if (-not $Description) {
                $Description = "Select file to open"
            }
        }
        # Write-Host not Write-Output so return not polluted.
        # Required in case form opens behind PowerShell console.
        Write-Host $Description
        $OpenForm.InitialDirectory = $Start
        if ($Ext.length -gt 0) {
            $OpenForm.Filter = "$Ext files (*.$Ext)|*.$Ext|All files (*.*)|*.*"
        }
        if ($OpenForm.ShowDialog() -eq "Cancel") {
            Write-Error "Cancel pressed."
        }
        Write-Verbose $OpenForm.FileName -ErrorAction SilentlyContinue
        $OpenForm.FileName
        $OpenForm.Dispose()
    } else {
        #Open Folder
        if (-not $Description) {
            $Description = "Select folder to open"
        }
        # Write-Host not Write-Output so return not polluted.
        # Required in case form opens behind PowerShell console.
        Write-Host $Description
        $OpenForm = New-Object -TypeName System.Windows.Forms.FolderBrowserDialog
        $OpenForm.Description  = $Description
        #$OpenForm.RootFolder   = "MyComputer"
        $OpenForm.SelectedPath = $Start
        if ($OpenForm.ShowDialog() -eq "OK") {
            Write-Verbose $OpenForm.SelectedPath -ErrorAction SilentlyContinue
            $OpenForm.SelectedPath
        } else {
            Write-Error "Cancel pressed."
        }
    }
}
Export-ModuleMember -Function Select-FileSystemForm