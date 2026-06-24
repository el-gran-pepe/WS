#Este script permite listar los usuarios que no tengan la expiracion de cuenta habilitada
# Importar el módulo de Active Directory
Import-Module ActiveDirectory

# Obtener todos los usuarios del dominio cuya cuenta no tiene la expiración habilitada
$users = Get-ADUser -Filter {PasswordNeverExpires -eq $true} -Property Name, DistinguishedName, PasswordNeverExpires | 
    Select-Object Name, @{Name="OU";Expression={(($_.DistinguishedName -split ',')[1..($_.DistinguishedName.Length)] -join ',').Substring(3)}}

# Ordenar los usuarios por la OU
$orderedUsers = $users | Sort-Object OU

# Exportar la lista a un archivo CSV
$orderedUsers | Export-Csv -Path "C:\UsuariosSinExpiracion.csv" -NoTypeInformation

# Mostrar la lista en la consola
$orderedUsers | Format-Table -AutoSize