FROM python:3.8.0-slim

RUN apt update && apt upgrade && apt install -y python3
RUN apt remove -y libsqlite3-0

WORKDIR /app

COPY app.py /app

CMD ["/app/app.py"]
