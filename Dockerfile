FROM python:3.11-slim


WORKDIR /app


COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt


COPY . .


RUN python manage.py collectstatic --noinput --clear


CMD ["gunicorn", "--bind", "0.0.0.0:8001", "config.wsgi:application"]