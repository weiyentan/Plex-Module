https://forums.plex.tv/discussion/155279/powershell-4-0-using-plex-rest-apis

#'Get Credentials, convert to Base64 for basic HTML Authentication
#' 
[string]$command = "Get-credential"
Try
{
    $cred           = Get-Credential
    $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $cred.GetNetworkCredential().UserName,$cred.GetNetworkCredential().Password)))
}
catch
{
    break;
}

#' 
#'Invoke REST API
#' 
[string]$command = "Invoke-RestMethod -Uri ""https://plex.tv/users/sign_in.xml""-Method POST -headers   @{'Authorization'=(""Basic {0}"" -f $base64AuthInfo);'X-Plex-Client-Identifier'=""TestApp"";'X-Plex-Product'=""TestScript"";'X-Plex-Version'=""V1.00"";'X-Plex-Username'=$cred.GetNetworkCredential().UserName;}" 


Try
{
    [array]$data =  Invoke-RestMethod `
                    -Uri "https://plex.tv/users/sign_in.xml"` 
                    -Method POST `
                    -headers   @{
                                    'Authorization'=("Basic {0}" -f $base64AuthInfo);
                                    'X-Plex-Client-Identifier'="PowerShell-Test";
                                    'X-Plex-Product'='PowerShell-Test';
                                    'X-Plex-Version'="V0.01";
                                    'X-Plex-Username'=$cred.GetNetworkCredential().UserName
                                }
    $authToken   = $data.user.authenticationToken
    "Executed: $command"
}
catch
{
    "Executing: $command"
    break;
}


[array]$data =Invoke-RestMethod -uri "https://plex.tv/users/sign_in.xml" -Method Post -Headers  @{'Authorization'=("Basic {0}" -f $base64AuthInfo);'X-Plex-Client-Identifier'="PowerShell-Test";'X-Plex-Product'='PowerShell-Test';'X-Plex-Version'="V0.01";'X-Plex-Username'=$cred.GetNetworkCredential().UserName}

[string]$localPlexAddr    = "Plex-Server"
[string]$plexRESTAddr   = "library/sections"
#' 
#'Invoke REST API
#' 
[string]$command = "Invoke-RestMethod -Uri ""http://$localPlexAddr`:32400/$plexRESTAddr"" -Method POST -headers   @{'Authorization'=(""Basic {0}"" -f $base64AuthInfo);'X-Plex-Client-Identifier'=""TestApp"";'X-Plex-Product'=""TestScript"";'X-Plex-Version'=""V1.00"";'X-Plex-Username'=$cred.GetNetworkCredential().UserName;'X-Plex-Token'=$authToken}"

    [array]$data =  Invoke-restmethod `
                    -Uri "http://$localPlexAddr`:32400/$plexRESTAddr" `
                    -Method GET `
                    -Headers   @{
                                'Authorization'=("Basic {0}" -f $base64AuthInfo);
                                'Accept'= 'application/json'
                                'X-Plex-Client-Identifier'="PowerShell-Test";
                                'X-Plex-Product'='PowerShell-Test';
                                'X-Plex-Version'="V0.01";
                                'X-Plex-Username'=$cred.GetNetworkCredential().UserName;
                                'X-Plex-Token'=$authToken
                                }

                                [xml]$apiContent         = $data.Content
                                
                                
                                
                                
   __________________________________
   Steps tyo reconstruct
   
      $cred           = Get-Credential
    $base64AuthInfo = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $cred.GetNetworkCredential().UserName,$cred.GetNetworkCredential().Password)))
    
        [array]$data =  Invoke-RestMethod `
                    -Uri "https://plex.tv/users/sign_in.xml"` 
                    -Method POST `
                    -headers   @{
                                    'Authorization'=("Basic {0}" -f $base64AuthInfo);
                                    'X-Plex-Client-Identifier'="PowerShell-Test";
                                    'X-Plex-Product'='PowerShell-Test';
                                    'X-Plex-Version'="V0.01";
                                    'X-Plex-Username'=$cred.GetNetworkCredential().UserName
                                }
    
    $authToken   = $data.user.authenticationToken
    
    [string]$localPlexAddr    = "server01"
    [string]$plexRESTAddr   = "library/sections"
    
        [array]$data =  Invoke-restmethod `
                    -Uri "http://$localPlexAddr`:32400/$plexRESTAddr" `
                    -Method GET `
                    -Headers   @{
                                'Authorization'=("Basic {0}" -f $base64AuthInfo);
                                'Accept'= 'application/json'
                                'X-Plex-Client-Identifier'="PowerShell-Test";
                                'X-Plex-Product'='PowerShell-Test';
                                'X-Plex-Version'="V0.01";
                                'X-Plex-Username'=$cred.GetNetworkCredential().UserName;
                                'X-Plex-Token'=$authToken
                                }
