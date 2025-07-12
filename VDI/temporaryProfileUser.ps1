#cuando un perfil de VDI se carga como temporal y no permite ver los archivos que tiene el perfil de usuario, puede deberse a que el disco de userProfile haya quedado enganchado en una VM
#para ello lo primero que tenemos que saber es el SID del usuario que quiere iniciar sesion

$objUser = New-Object System.Security.Principal.NTAccount("DOMINIO\NOMBRE_USUARIO")
$strSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier])
$strSID.Value

#una vez obtenido el SID, buscar en donde pudo haber quedado enganchado el disco
$HVs = @("HYPERV-1", "HYPERV-2", "HYPERV-N") 

Foreach ($HV in $HVs) {Get-VMHardDiskDrive -computername $HV -vmname * -ControllerType SCSI |Where {$_.Path -like "*-0000*"} |select VMName,Path |Format-List} 

#en donde -like "*-0000*" indican los ultimos digitos del SID

#una vez encontrado el disco desmontar de la VM en la que este y reintentar el inicio de la sesion 
