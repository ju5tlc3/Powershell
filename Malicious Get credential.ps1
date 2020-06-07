$cred = Get-Credential
Write-Output $cred.Username, $cred.GetNetworkCredential().password | out-file -FilePath .\cred.txt 
