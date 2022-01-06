FROM registry.access.redhat.com/ubi8/python-38
USER 0
EXPOSE 22
ADD app.py /tmp/src
RUN /usr/bin/fix-permissions /tmp/src
USER 1001
RUN /usr/libexec/s2i/assemble
CMD /usr/libexec/s2i/run
