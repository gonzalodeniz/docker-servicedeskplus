# ServiceDesk Docker Setup

Este repositorio contiene los archivos necesarios para construir y ejecutar una instancia de ManageEngine ServiceDesk Plus en un contenedor Docker.

## ¿Qué es ServiceDesk?

ManageEngine ServiceDesk Plus es una solución de gestión de servicios de TI (ITSM) que ofrece funcionalidades como gestión de incidentes, problemas, cambios, activos y más. Es una herramienta integral para gestionar y optimizar los servicios de TI en una organización.

## Instalación

Para instalar y construir la imagen Docker de ServiceDesk, sigue estos pasos:

1. Clona este repositorio en tu máquina local:
    ```sh
    git clone <URL_DEL_REPOSITORIO>
    cd servicedesk
    ```
2. Descarga previamente el binario de ServiceDesk en el caso que el repositorio no lo incluya por límite de tamaño:
    ```
    wget https://www.manageengine.com/products/service-desk/91677414/ManageEngine_ServiceDesk_Plus_64bit.bin  
    ```

3. Construye la imagen Docker:
    ```sh
    ./1_build.sh
    ```

## Ejecución

Para ejecutar el contenedor Docker con ServiceDesk, sigue estos pasos:

1. Ejecuta el contenedor:
    ```sh
    ./2_run.sh
    ```

2. Accede a la aplicación a través de tu navegador web en la URL `https://<TU_IP>:8443`.

## Notas adicionales

- Asegúrate de que el puerto `8443` no esté siendo utilizado por otra aplicación en tu máquina.
- Los datos de ServiceDesk se almacenan en un volumen Docker llamado `servicedesk_data` para persistencia.
- Puedes ajustar el puerto expuesto en el archivo `2_run.sh` si es necesario.

Para más información sobre ManageEngine ServiceDesk Plus, visita [la página oficial](https://www.manageengine.com/products/service-desk/).
