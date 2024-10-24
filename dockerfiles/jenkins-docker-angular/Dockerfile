FROM jenkins/jenkins
USER root
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
ARG HOST_UID=${HOST_UID}
ARG HOST_GID=${HOST_GID}
RUN sh -c 'echo "deb [arch=amd64] http://dl-ssl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN apt-get -y update && \
 apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common google-chrome-stable nodejs npm xvfb && \
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
 add-apt-repository \
 "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
 $(lsb_release -cs) \
 stable" && \
 apt-get update && \
 apt-get -y install docker-ce docker-ce-cli containerd.io
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 4.4.7
RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash

# install node and npm
RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

RUN usermod -aG docker jenkins
RUN curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
 chmod +x /usr/local/bin/docker-compose && \
 ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
RUN groupmod -g $HOST_GID docker
RUN usermod -u $HOST_UID jenkins
USER jenkins
