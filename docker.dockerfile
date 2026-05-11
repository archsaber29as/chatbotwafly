FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt
RUN pip install gunicorn

COPY . .
RUN chmod +x start.sh

EXPOSE 5000

ENTRYPOINT ["bash", "start.sh"]