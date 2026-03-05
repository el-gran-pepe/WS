#Eliminar grupo AD
Remove-ADGroup -Identity "NombreDelGrupo" -Confirm:$false

#cambiar hostname para luego instalar Rol AD
Rename-Computer -NewName SRV-VP-DC02 -Restart

#instalar rol AD
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools