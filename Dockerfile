# Stage 1: Build stage
FROM python:3.12-slim-bullseye AS build
WORKDIR /app

# Install build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    default-libmysqlclient-dev \
    pkg-config \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt gunicorn

# Stage 2: runtime stage
FROM python:3.12-slim-bullseye AS runtime

# Install runtime dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    supervisor \
    libpq5 \
    libmariadb3 \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN groupadd --gid 1000 appuser && \
    useradd --uid 1000 --gid appuser --shell /bin/bash --create-home appuser

WORKDIR /app

# SOLUCIÓN: Reinstalar gunicorn en lugar de copiar binarios
RUN pip install --no-cache-dir gunicorn

# Copiar solo los paquetes de Python (no los binarios)
COPY --from=build /usr/local/lib/python3.12/site-packages /usr/local/lib/python3.12/site-packages

# Verificar instalación
RUN which gunicorn && gunicorn --version

# Copy configurations
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY . .
COPY gunicorn.conf.py ./
COPY entrypoint.sh /entrypoint.sh

# Set ownership - IMPORTANTE: Después de copiar todo
RUN chown -R appuser:appuser /app

# Dar permisos de ejecución específicos
RUN chmod +x /usr/local/bin/gunicorn
RUN chmod +x /entrypoint.sh

# Create logs directory
RUN mkdir -p /var/log/supervisor && \
    chown -R appuser:appuser /var/log/supervisor

EXPOSE 8000

CMD ["/entrypoint.sh"]
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]