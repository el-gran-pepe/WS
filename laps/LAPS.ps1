#extendemos el Schema. Por unica vez en el DC
Update-AdmPwdADSchema
#----------------------#
#otorgamos permisos de escritura en el AD a la OU que contiene los equipos que necesitamos alcanzar con la GPO
#en este caso, y solo para la prueba se creo una OU llamada testLAPS
Set-AdmPwdComputerSelfPermission -OrgUnit testLaps

#otorgamos permiso de lectura de pass a los usuarios sobre la OU correspondiente.
Set-AdmPwdReadPasswordPermission -OrgUnit testLaps -AllowedPrincipals Laps-RO

#otorgamos permiso de reseteo de pass
Set-AdmPwdResetPasswordPermission -OrgUnit testLaps -AllowedPrincipals Laps-RW

#los permisos anteriores trabajan de forma individual, es decir, que le demos permisos de reseteo a un usuario 
#no significa que puedan ver la pass
