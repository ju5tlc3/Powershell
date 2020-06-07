$filelist = Get-ChildItem -recurse C:\Windows\System32\ -ErrorAction SilentlyContinue
try
{
    foreach ($file in $filelist)
    {
        if($file -is [System.IO.DirectoryInfo])
        {
            $acl = (Get-Acl -path $file  -ErrorAction SilentlyContinue ).Access[0].IdentityReference
            Write-Output $file, $acl
        }
    }
}
catch
{
    Write-Verbose "Error retrieving ACL for: $file"
} 
