FROM registry.access.redhat.com/ubi8/python-39
USER 0
EXPOSE 22
WORKDIR /app
COPY app.py /app
RUN chown -R 1001:0 /app
USER 1001
CMD ["/app/app.py"]
