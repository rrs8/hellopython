FROM python:3.8.0-slim

RUN apt update && apt upgrade -y
￼
WORKDIR /app
￼
COPY app.py /app
￼
CMD ["/app/app.py"]
