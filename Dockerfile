FROM node:20-alpine3.20

WORKDIR /app

RUN apk update && apk add --no-cache \
    bash \
    openssl \
    curl \
    wget \
    unzip \
    nginx \
    ca-certificates

# nginx 配置
COPY nginx.conf /etc/nginx/nginx.conf

# 代码
COPY . .

EXPOSE 8080
EXPOSE 3000

CMD sh -c "nginx -g 'daemon off;' & node index.js"
