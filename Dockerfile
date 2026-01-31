FROM node:alpine3.20

WORKDIR .npm

COPY . .

EXPOSE 3000/tcp

RUN apk update && apk upgrade &&\
    apk add --no-cache openssl curl gcompat iproute2 coreutils &&\
    apk add --no-cache bash &&\
    chmod +x index.js &&\
    npm install
# 复制配置
COPY nginx.conf /etc/nginx/nginx.conf

CMD ["node", "index.js"]
