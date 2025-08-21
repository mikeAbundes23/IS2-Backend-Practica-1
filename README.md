# IS2-Backend-Practica-1

# Backend para la practica 1
___

### Instalación y ejecución del backend.

Este repositorio contiene el backend de la aplicación, que se encarga de gestionar las solicitudes y respuestas del sistema.

- Requisitos previos:

    
    Asegúrate de tener instalado Python 3.8 o superior y pip en tu sistema.
- Clonación del repositorio:
    ```bash
    git clone git@github.com:mikeAbundes23/IS2-Backend-Practica-1.git
    ```

- Navegación al directorio del proyecto:
    ```bash
    cd IS2-Backend-Practica-1
    ```

- Creación de un entorno virtual (opcional pero recomendado):
    ```bash
    python -m venv venv
    ```
- Activación del entorno virtual:
    - En Windows:
    ```bash
    .\venv\Scripts\activate
    ```
    - En macOS/Linux:
    ```bash
    source venv/bin/activate
    ```

- Instalación de dependencias:

    ```bash
    pip install -r requirements.txt
    ```

## Configuración de la base de datos MySQL

1. Crea una base de datos y usuario en MySQL:

   ```sql
   CREATE DATABASE app;
   ```

2. Copia el archivo `.env.example` a `.env` y edita los valores según tu configuración local:

    ```properties
    SECRET_KEY='tu_clave_secreta'
    DEBUG='True'
    ALLOWED_HOSTS='localhost,127.0.0.1'
    DATABASE_URL='mysql://usuario:contraseña@localhost:3306/nombre_db'
    ```
 3. Entra al directorio de la aplicación:

    ```bash
    cd app
    ```
    
4. Aplica las migraciones para crear las tablas:

   ```bash
   python manage.py migrate
   ```

## Ejecución

```bash
python manage.py runserver
```
