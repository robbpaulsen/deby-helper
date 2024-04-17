# Un Poryeto sencillo

Deby helper es un proyecto que parte de una accion sencilla para actualizar un sistema Debian, solo ejecuta:

```bash

$ sudo apt-get --assume-yes update
```

Seguido por un:

```bash

$ sudo apt-get --assume-yes full-upgrade
```

# Motivacion

Tomar algo sencillo y subirlo poco a poco a en dificultad de logica y/o presentacion en scripting, esta primera parte solo ejecutara esos comandos preguntandole al usuario que quiere hacer.

# Siguientes pasos

- Detectar usuario ejecutando el script
- Actualizar y borrar archivos temporales para eliminarlos y/o otras optimizaciones
- Generar un registro de las acciones ejecutadas con fecha o algun tipo de reporte final
- TUI friendlier, mejorar la apariencia y fluidez entre cada ejecucion
- Agregar en algun punto una opcion para respaldar una seleccion de directorios y/o archivos
