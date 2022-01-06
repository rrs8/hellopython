FROM ubuntu:20.04

RUN apt -y update && apt -y upgrade && apt install -y python3
#RUN apt remove -y libsqlite3-0

EXPOSE 22
 
WORKDIR /app

COPY app.py /app

CMD ["/app/app.py"]
