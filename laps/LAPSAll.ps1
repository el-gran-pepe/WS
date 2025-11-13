#extendemos el Schema
Update-AdmPwdADSchema

#si tendríamos algún tipo de error sobre el paquete, lo que deberíamos realizar es la importación pertinente
Import-module AdmPwd.PS

#le damos permisos, a los equipos que queramos impactar con esta implementación, a que 	escriban en el AD en los atributos. 
#Se debe repetir con todas la OU necesarias. Si tengo solo 	una OU con ese nombre basta con ponerlo que será identificada, 
#de lo contrario deberemos 	colocar la ruta completa
Set-AdmPwdComputerSelfPermission -OrgUnit <nombre de la OU a delegar permisos>

#ahora le damos permiso de lectura a los usuarios
Set-AdmPwdReadPasswordPermission -OrgUnit <nombre de la OU a delegar permiso> -AllowedPrincipals <usuario or grupo>


#para darle permiso de reseteo de contraseña
#entendamos que ambos permisos son independientes, es decir, que tenga permiso de reseteo no significa que podrá verla
Set-AdmPwdResetPasswordPermission -OrgUnit <name of the OU to delegate permissions> -AllowedPrincipals <users or groups>

#Consultas
#Consultar quien tiene permisos sobre una OU especifica
(Find-AdmPwdExtendedrights -orgunit <OU name>).ExtendedRightHolders

#atributos para consultar en AD
#ms-Mcs-AdmPwd (Almacena la contraseña)
#ms-Mcs-AdmPwdExpirationTime (Almacena la fecha de expiración de la contraseña)
#Dentro de este ultimo atributo se va a guardar un valor numérico,	que no nos va a aportar ningún dato concreto pero para 
#transformarlo en una fecha y hora legible deberemos utilizar el siguiente comando en una consola 'cmd'
w32tm /ntte <numero a convertir>

#consultar pass y fecha de expiracion via Powershell
Get-AdmPwdPassword -ComputerName <computername>

#tambien podriamos realizar consultas mas complejas
Get-ADComputer -filter {Name -Like “<palabra clave>*”} -Properties ms-Mcs-AdmPwd | 	Select Name, ms-Mcs-AdmPwd

#En este ejemplo la consulta nos traería todos los equipos que coincidan en su nombre	inicialmente con la palabra clave que 
#utilicemos y que terminen de cualquier forma y que nos muestre en una lista el nombre del equipo y su contraseña 
#administrador local.

		







