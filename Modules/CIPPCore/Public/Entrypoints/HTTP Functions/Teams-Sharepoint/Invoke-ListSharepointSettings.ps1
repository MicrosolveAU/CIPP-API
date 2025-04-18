using namespace System.Net

Function Invoke-ListSharepointSettings {
    <#
    .FUNCTIONALITY
        Entrypoint
    .ROLE
        Sharepoint.Admin.Read
    #>
    [CmdletBinding()]
    param($Request, $TriggerMetadata)

    $APIName = $Request.Params.CIPPEndpoint
    $Headers = $Request.Headers
    Write-LogMessage -headers $Headers -API $APIName -message 'Accessed this API' -Sev 'Debug'




    # Interact with query parameters or the body of the request.
    $tenant = $Request.Query.TenantFilter
    $User = $Request.query.user
    $USERToGet = $Request.query.usertoGet
    $body = '{"isResharingByExternalUsersEnabled": "False"}'
    $Request = New-GraphPostRequest -tenantid $tenant -Uri 'https://graph.microsoft.com/beta/admin/sharepoint/settings' -Type patch -Body $body -ContentType 'application/json'

    Write-LogMessage -API 'Standards' -tenant $tenantFilter -message 'Disabled Password Expiration' -sev Info
    # Associate values to output bindings by calling 'Push-OutputBinding'.
    Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
            StatusCode = [HttpStatusCode]::OK
            Body       = @($GraphRequest)
        })

}
