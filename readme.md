# preludio

Repositorio del audiojuego/audioensayo preludio desarrollado por Nicolás Müller Bravo.

En la sección "**releases**" del repositorio se puede descargar la versión jugable del audioensayo para Linux y para los sistemas operativos macOS y Windows (En el apartado **“Iniciación del audiojuego”** de este escrito se incluyen instrucciones detalladas para ejecutar el audiojuego).

Una descripción de los controles (teclas y botones) para jugar se incluye al final del este archivo de texto. 

Los activos empleados para el desarrollo del audiojuego están ubicados en la carpeta preludio_v1.00e.

Los códigos de programación pueden abrirse usando el motor de juegos Godot (para más detalles referirse a la sección **“Exploración de código y otros elementos”** de este documento).


## Iniciación del audioensayo

**Importante**: Usar auriculares para una experiencia óptima. preludio no posee interfáz gráfica.

**Descargar** el archivo desde la sección releases del repositorio de acuerdo al sistema operativo del PC en que se ejecutará el audiojuego (preludio_v1.00e_linux.zip / preludio_v1.00e_win.zip / preludio_v1.00e_macOS.zip).

**En Linux:**
Extraer el contenido del archivo comprimido (preludio_v1.00e_linux.zip).
Dar doble clic al ejecutable (preludio_v1.00e_linux.x86_64). 

**En Windows:**
Extraer el contenido del archivo comprimido (preludio_v1.00e_win.zip).
Hacer clic derecho sobre el ejecutable (preludio_v1.00e_win.exe) y elejir la opción "ejecutar como administrador"
Es posible que Windows de un mensaje de alerta respecto a la ejecución del archivo. 
Elejir la opción: Ejecutar de todas formas.
Si la aplicación se congela, cerrar la ventana y volver a intentar los pasos descritos o abrir directamente el ejecutable con doble clic.
Si se tiene antivirus, es posible que se requiera su desactivación o la inclusión del audiojuego dentro de las excepciones del mismo, para ejecutarlo.

**En macOS:**
Extraer el contenido del archivo comprimido (preludio_v1.00e_macOS.zip).
Dar doble clic al ejecutable (preludio_v1.00e) incluido en la carpeta MacOS (ubicada dentro de la carpeta "Contents": preludio_v1.00e.app > Contents > MacOS)
En caso de no ejecutarse el archivo, ir a preferencias del sistema -> seguridad y privacidad -> abrir de todas formas.
Para más información consultar la página oficial de [**_Godot_**](https://docs.godotengine.org/es/4.x/tutorials/export/running_on_macos.html#doc-running-on-macos)


## Exploración del código y otros elementos

Descargar la carpeta preludio_v1.00e del repositorio o desde la sección de releases.
Descargar el motor de juegos Godot desde la página oficial del proyecto.
Abrir el motor e importar la carpeta preludio_v1.00e.
Dar doble clic al proyecto para iniciar el motor.
En la barra superior de opciones (2D/3D/Script/AssetLib) seleccionar “Script” para visualizar el código de programación.
En el modo de visualización de código, un menú lateral, a la izquierda, permite la selección de los scripts disponibles.
La opción 2D de la barra superior de opciones posibilita explorar la disposición de los elementos dentro del audiojuego.


## Controles de juego

**Computadora:**
-Teclas «a» y «d» / teclas direccionales «izquierda» y «derecha»: movimiento del personaje, respectivamente, hacia la izquierda o derecha.
-Teclas «w» y «s» / teclas direccionales «arriba» y «abajo»: incremento o decremento, respectivamente, del volumen del audiojuego (por defecto el juego inicia en el volumen máximo).
-Tecla «esc»: Pausa (durante el juego) / Volver al juego (cuando el juego está pausado) / Cerrar la aplicación (una vez finalizada la partida).
-Tecla «enter»: Cerrar la aplicación (cuando el juego está pausado) / reiniciar el audiojuego (una vez finalizada la partida).
        
**Mando de consola:**
-Botones izquierda y derecha de cruz de navegación / Movimiento horizontal (izquierda a derecha) de palanca de navegación: movimiento del personaje, respectivamente, hacia la izquierda o derecha.
-Botones arriba y abajo de cruz de navegación / Movimiento vertical (arriba a abajo) de palanca de navegación: incremento o decremento, respectivamente, del volumen del audiojuego (por defecto el juego inicia en el volumen máximo).
-Botón «start»: Pausa (durante el juego) / Volver al juego (cuando el juego está pausado) / Cerrar la aplicación (una vez finalizada la partida).
-Botón «select»: Cerrar la aplicación (cuando el juego está pausado) / reiniciar el audiojuego (una vez finalizada la partida).
