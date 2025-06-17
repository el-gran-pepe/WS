$toMove='nameVM'
Move-VM -Name $toMove -DestinationHost HVDestino -IncludeStorage -DestinationStoragePath C:\ClusterStorage\SAS\$toMove #este ubicacion podria ser otra
$MovedVM = Get-VM -ComputerName HVName $toMove

Get-VM -ComputerName HVDestino nameVM | Get-VMNetworkAdapter | Connect-VMNetworkAdapter -SwitchName "networkName" #por una cuestion de version el Get-VM no tomaba la variable $toMove y es por eso que volvi a escrivir el nombre de la VM

#podemos agregar la siguiente linea si necesitamos que ademas de seleccionar la RED tenga que utilizar algun tag en la misma
Set-VMNetworkAdapterVlan -ComputerName HVDestino -VMName nameVM -Access -VlanId 500 #el 500 esta a modo de ejemplo, eso dependera del tag q se le haya hecho en el trunk
