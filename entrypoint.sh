#!/bin/bash

# Esperar a que PostgreSQL esté listo usando pg_isready
echo "Waiting for PostgreSQL to be ready..."
while ! pg_isready -h db -p 5432 -U postgres; do
  sleep 1
done
echo "PostgreSQL is ready!"

# Cambiar al directorio correcto de la aplicación Django
echo "Changing to app directory..."
cd /app/app

# Generar migraciones para la app user si es necesario
echo "Making migrations for user app..."
python manage.py makemigrations user

# Ejecutar migraciones con manejo inteligente de errores
echo "Running migrations..."
python manage.py migrate --fake-initial --noinput || {
    echo "Fake-initial failed, trying regular migrate..."
    python manage.py migrate --noinput
}

echo "Migrations completed successfully!"

# Ejecutar el comando principal
exec "$@"