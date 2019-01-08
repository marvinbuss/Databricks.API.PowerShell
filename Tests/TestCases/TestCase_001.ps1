# Set-DatabricksEnvironment is already done by the caller!
Write-Information "TestCase_001"


Write-Information "Testing Secrets API ..."
$scopeName = "MyTestScope"
$secretName = "MySecretPassword"

$x = New-DatabricksSecretScope -ScopeName $scopeName -Verbose
Get-DatabricksSecretScope -Verbose

Add-DatabricksSecret -ScopeName $scopeName -SecretName $secretName -StringValue "Pass@word1234!" -Verbose
$enc = [system.Text.Encoding]::UTF8
$secretText = "This is a secret value" 
$secretBytes = $enc.GetBytes($secretText) 
Add-DatabricksSecret -ScopeName $scopeName -SecretName "MySecret2" -BytesValue $secretBytes -Verbose
Get-DatabricksSecret -ScopeName $scopeName -Verbose

Remove-DatabricksSecret -ScopeName $scopeName -SecretName $secretName
Remove-DatabricksSecretScope -ScopeName $scopeName




