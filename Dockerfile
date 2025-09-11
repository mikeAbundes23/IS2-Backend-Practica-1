# Stage 1: Build stage
FROM python:3.12-slim-bullseye AS build
WORKDIR /app

# Install build dependencies
RUN apt-get update && apt-get install -y postgresql-client --no-install-recommends \
    build-essential \
    libpq-dev \
    libpq5 \
    libpq-dev \
    gcc \
    default-libmysqlclient-dev \
    libmariadb3 \
    libmariadb-dev \
    pkg-config \
    python3-dev \
    netcat \
    && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt

# Stage 2: runtime stage
FROM python:3.12-slim-bullseye AS runtime

# Install supervisor
RUN apt-get update && apt-get install -y --no-install-recommends \
    supervisor \
    libpq5 \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN groupadd --gid 1000 appuser && \
    useradd --uid 1000 --gid appuser --shell /bin/bash --create-home appuser

WORKDIR /app

# Copy installed Python packages from the build stage
COPY --from=build /root/.local /root/.local

# PRIMERO: Copiar configuración de supervisor (CORREGIDO)
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# LUEGO: Copiar código de la aplicación
COPY . .

RUN chmod +x /app/entrypoint.sh
ENTRYPOINT ["/app/entrypoint.sh"]

# Create gunicorn config
COPY gunicorn.conf.py ./


RUN chown -R appuser:appuser /app

# Create logs directory
RUN mkdir -p /var/log/supervisor && \
    chown -R appuser:appuser /var/log/supervisor

# Add user's local bin to PATH
ENV PATH="/home/appuser/.local/bin:$PATH"

# Expose port
EXPOSE 8000

# Use supervisor to manage processes (CON -n)
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf", "-n"]