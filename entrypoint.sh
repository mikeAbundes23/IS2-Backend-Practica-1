#!/bin/bash
set -e

# Variables de DB
DB_HOST=${DB_HOST:-db}
DB_PORT=${DB_PORT:-5432}

echo "$DB_HOST"
echo "$DB_PORT"
# Esperar a que PostgreSQL esté listo
echo "Esperando a que PostgreSQL esté disponible..."
until pg_isready -h "$DB_HOST" -p "$DB_PORT" >/dev/null 2>&1; do
  sleep 1
done
echo "PostgreSQL disponible!"

# Ejecutar migraciones
echo "Ejecutando migraciones..."
cd app
python manage.py migrate

# Iniciar servidor Django
echo "Iniciando servidor Django..."
python manage.py runserver 0.0.0.0:8000
