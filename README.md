# Aragon Open Data - Campus Api

Proyecto simple que nos permite crear una Api basada en la parte de campus de AOD

## Instalacion y primera ejecucion
1.Clonamos el repositorio 
```
git clone https://github.com/aragonopendata/Campus-api.git
```

2.Instalamos dart: [Link](https://www.dartlang.org/install)

3.Instalamos Jaguar
```
pub global activate jaguar
```
4.Creamos un archivo llamado settings.yaml en la raiz y lo completamos con los siguientes datos
```yaml
svport: '<Puerto preferido>'

dbuser: '<Usuario de la base de datos>'
dbpass: '<Contraseña de la base de datos>'
dburl: '<Url de la base de datos>'
dbname: '<Nombre de la base de datos>'
```

5.Obtenemos todas las dependencias necesarioas
```
pub get
```

6.Ejecutamos la herramienta de jaguar para que genere los archivos necesarios
```
jaguar build
```

7.Ejecutamos nuestra Api 
```
dart bin/server.dart -s settings.yaml
```

8.Ya podemos acceder a nuestra api desde localhost
```
localhost:<svport>/campus/version
```

##Documentacion
Para documentacion mas detallada puedes dirigirte a la wiki o a la documentacion oficial de [Jaguar](https://jaguar-dart.github.io/)

##Licencia
Licencia

El Gobierno de Aragón a través de Aragón Open Data pone a disposición de usuarios, desarrolladores y comunidad en general la aplicación denominada “Campus Api” bajo la Licencia Pública de la Unión Europea “European Union Public Licence – EUPL”. Esta licencia, desarrollada en el seno de la Unión Europea, nació con la intención de ser la licencia bajo la cuál se liberasen los programas y aplicaciones desarrolladas por la Administración Pública y con la característica específica de ser compatible con otras licencias denominadas libres, como la GNU General Public License (GNU/GPL). Estas características dotan, a las aplicaciones así liberadas, de mayor seguridad jurídica y fomentan la interoperabilidad de los servicios de la Administración Electrónica.

Que el código de esta aplicación esté publicado bajo la licencia abierta EUPL 1.1 (European Union Public License 1.1), significa que puedes reutilizarlo, modificarlo y adaptarlo a tus necesidades de forma totalmente libre. Si utilizas el código, a modo de reconocimiento a Aragón Open Data incluye en tu proyecto nuestro logo en el cabecero o en el pie de página, te lo agradeceremos!

##Agradecimientos

Gracias a [Jaguar-dart](https://github.com/Jaguar-dart) por su ayuda y colaboracion para construir una api rapida y eficaz y ofrecernos un soporte excelente.
