param(
    [string]$ImportCsv
)
$AllUsers = Import-Csv $ImportCsv
$AllUsers | ForEach-Object {
    Write-Host $_.Username
    New-AzRoleAssignment -SignInName $_.Username -RoleDefinitionName $_.RoleDefinitionName -ResourceGroupName $_.ResourceGroupName
}