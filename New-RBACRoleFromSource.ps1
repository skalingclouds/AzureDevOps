param(
    [string]$ImportCsv
)

$AllUsers = Import-Csv $ImportCsv
$AllUsers | ForEach-Object {

New-AzRoleAssignment -SignInName $_.Username -RoleDefinitionName $_.RoleDefinitionName -ResourceGroupName $_.ResourceGroupName
} -Verbose