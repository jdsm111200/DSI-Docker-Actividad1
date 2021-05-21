FROM debian:stable-slim
LABEL NOMBRE="JOSE DANIEL SANDOVAL MEJIA"
LABEL CARNET="SM18003"
RUN apt update && apt upgrade -y && \
    apt install -y curl && \
    curl -sL https://deb.nodesource.com/setup_14.x |  bash &&\
    apt-get install -y nodejs  &&\
    npm install -g @quasar/cli && \
    apt install -y nginx && \
    apt install -y git && \
    git clone -b v1.0  https://github.com/diseno2021/expedientemedico.git /home/dsi2021 && \
    cd /home/dsi2021/ && \
    npm install && \
    quasar build && \
    cp -r /home/dsi2021/dist/spa/* /var/www/html
EXPOSE 80
CMD [ "nginx","-g","daemon off;"]