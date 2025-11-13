## laps
Implementacion LAPS en DC

LAPS (Local Administrator Password Solution), es una extension de Microsoft para administrar de forma robusta todas las cuentas admin local de equipos que formen parte de un dominio. Esto ultimo es fundamental hacer hincapie ya que todas las reglas, inclusive la instalacion del cliente LAPS, se parametrizan desde GPO.

### ¿Como funciona?
LAPS genera un password unico por cada equipo de manera aleatorio y el mismo es almacenado en un atributo del equipo en nuestro AD. Este pass tiene una fecha de expiracion, al cumplirse se vuelve a generar un password diferente pero de similares caracteristicas al anterior.
Nos permite tener dos perfiles de usuarios, uno que puedo leer la pass que se le asigno al equipo y otro que puede cambiar ese atributo. No se puede definir exactamente la contraseña a utilizar sino la fecha de expiracion, y eso es parte del permiso que tiene el usuario de AD con permiso para modificarla.

La idea principal de esta implementacion es que todas las pass de admin local en cada equipo sean diferentes, esto permite que ante un eventual ataque y obtension de una contraseña en una cuenta admin local en un equipo, no asegure la posibilidad que, con esa pass, pueda ingresar a otro equipo de nuestra organizacion.

### ¿Que podemos parametrizar?
Si bien esta extension no permite definir exactamente las caracteres a utilizar en nuestra contraseña, si nos permite definir, complejidad, fecha de expiracion y longitud.
Se puede administrar desde su GUI, AD o PowerShell.

Algo importante, LAPS a partir de 2019 se rompe en funcion a heredar esta extension desde un Windows Server 2016 o anterior. Aparentemente Microsoft esta trabajando en ello pero por el momento no se podria migrar en un eventual upgrade a 2019 en adelante, teniendo hoy, que volver a parametrizar LAPS para poder integrarlo.

### Archivos que contiene este proyecto
LAPS.ps1      (Script para implementar LAPS)
LAPSx64.msi   (Instalador LAPS para SO 64 bits)
LAPSx86.msi   (Instalador LAPS para SO 32 bits)
LAPS_InstruccionesDelImplementacion.docx (Instructivo recopilado para implementacion)
LAPSAll.ps1    (Scripting de implementacion y consulta)
