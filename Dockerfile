FROM ubuntu:20.04

RUN apt update && apt upgrade && apt install -y python3

WORKDIR /app

COPY app.py /app

CMD ["/app/app.py"]
