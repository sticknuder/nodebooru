#!/usr/bin/dumb-init /bin/sh
set -e
cd /opt/app

alembic upgrade 58bba7e0c554

echo "Starting szurubooru API on port ${PORT} - Running on ${THREADS} threads"
exec waitress-serve-3 --port ${PORT} --threads ${THREADS} szurubooru.facade:app
