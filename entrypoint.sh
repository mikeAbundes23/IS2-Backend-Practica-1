#!/bin/bash

# Esperar a que PostgreSQL esté listo usando pg_isready
echo "Waiting for PostgreSQL to be ready..."
while ! pg_isready -h db -p 5432 -U postgres; do
  sleep 1
done
echo "PostgreSQL is ready!"

# Ejecutar migraciones
echo "Running migrations..."
cd /app/IS2-Backend-Practica-1/app
python manage.py migrate --noinput

# Ejecutar el comando principal
exec "$@"