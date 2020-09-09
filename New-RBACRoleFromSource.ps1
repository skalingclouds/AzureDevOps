param(
    [string]$ImportCsv
)
Write-Host "Importing Users..."
$AllUsers = Import-Csv $ImportCsv
$AllUsers | ForEach-Object {
    Write-Host "Assigning RBAC Roles..."
    Write-Host $_.Username
    Get-AzADUser
    New-AzRoleAssignment -SignInName $_.Username -RoleDefinitionName $_.RoleDefinitionName -ResourceGroupName $_.ResourceGroupName -Verbose -Debug
}