FROM ubuntu:focal

ENV TZ="Europe/Dublin"
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update --allow-insecure-repositories \
    && apt install ca-certificates -y --no-install-recommends 
RUN update-ca-certificates
RUN echo "deb [trusted=yes] https://apt.fury.io/lefterisgar/ * *" > /etc/apt/sources.list.d/caprine.list
RUN apt-get update -y
RUN apt-get install -y caprine

#CMD ["caprine"]
