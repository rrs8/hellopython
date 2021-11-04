FROM python:3.8.0-slim

WORKDIR /app

COPY app.py /app

CMD ["/app/app.py"]
