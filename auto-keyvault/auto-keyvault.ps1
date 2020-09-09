#Login-AzAccount

New-AzResourceGroup -Name ContosoResourceGroup -Location EastUS

New-AzKeyVault -Name 'Contoso-Vault2' -ResourceGroupName 'ContosoResourceGroup' -Location 'East US'

Set-AzKeyVaultAccessPolicy -VaultName 'Contoso-Vault2' -UserPrincipalName 'user@domain.com' -PermissionsToSecrets get, set, delete

$secretvalue = ConvertTo-SecureString 'hVFkk965BuUv' -AsPlainText -Force
$secret = Set-AzKeyVaultSecret -VaultName 'Contoso-Vault2' -Name 'ExamplePassword' -SecretValue $secretvalue
(Get-AzKeyVaultSecret -VaultName "Contoso-Vault2" -Name "ExamplePassword").SecretValueText