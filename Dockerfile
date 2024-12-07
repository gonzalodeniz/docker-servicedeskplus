# Utilizar una imagen base de Ubuntu
FROM ubuntu:22.04

# Actualizar el sistema e instalar dependencias necesarias
RUN apt-get update && apt-get install -y \
    wget \
    bash \
    unzip \
    libc6 \
    libstdc++6 \
    locales \
    expect \
    && rm -rf /var/lib/apt/lists/*

# Configuración de localización
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# Crear el grupo y el usuario
RUN groupadd servicedesk && \
    useradd -d /home/servicedesk -s /bin/bash -m -g servicedesk servicedesk    

# Crear el directorio para la aplicación
RUN mkdir -p /home/servicedesk/ManageEngine/ServiceDesk

# Descargar e instalar ServiceDesk
WORKDIR /home/servicedesk
COPY ManageEngine_ServiceDesk_Plus_64bit.bin .
RUN chmod +x ManageEngine_ServiceDesk_Plus_64bit.bin

COPY install_script.exp .
RUN chmod +x install_script.exp

# Cambiar el propietario del directorio
RUN chown -R servicedesk:servicedesk /home/servicedesk
USER servicedesk

# Dar permisos al script y ejecutarl
RUN /usr/bin/expect install_script.exp 


# Exponer el puerto por defecto de la aplicación (ajústalo si es necesario)
EXPOSE 8080

# Iniciar la aplicación
WORKDIR /home/servicedesk/ManageEngine/ServiceDesk/bin
CMD ["./run.sh"]
# CMD ["/bin/bash"]
