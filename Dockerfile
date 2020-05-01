FROM python:3.6.8-alpine3.9

RUN apk update && apk add libaio libnsl build-base libc6-compat

COPY instantclient_12_2.zip ./
RUN unzip instantclient_12_2.zip && \
    mv instantclient_12_2/ /usr/lib/ && \
    rm instantclient_12_2.zip && \
    ln /usr/lib/instantclient_12_2/libclntsh.so.12.1 /usr/lib/libclntsh.so && \
    ln /usr/lib/instantclient_12_2/libocci.so.12.1 /usr/lib/libocci.so && \
    ln /usr/lib/instantclient_12_2/libociei.so /usr/lib/libociei.so && \
    ln /usr/lib/instantclient_12_2/libnnz12.so /usr/lib/libnnz12.so && \
    ln /lib64/ld-linux-x86-64.so.2 /usr/lib/ld-linux-x86-64.so.2 && \
    ln /usr/lib/libnsl.so.2 /usr/lib/libnsl.so.1 && \
    ln /lib/libc.so.6 /usr/lib/libresolv.so.2

ENV ORACLE_BASE /usr/lib/instantclient_12_2
ENV LD_LIBRARY_PATH /usr/lib/instantclient_12_2
ENV TNS_ADMIN /usr/lib/instantclient_12_2
ENV ORACLE_HOME /usr/lib/instantclient_12_2