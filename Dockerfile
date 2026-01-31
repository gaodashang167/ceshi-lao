FROM node:20-alpine3.20

# 工作目录
WORKDIR /app

# 安装系统依赖 + nginx
RUN apk update && apk add --no-cache \
    nginx \
    bash \
    ca-certificates

# 复制 nginx 配置
COPY nginx.conf /etc/nginx/nginx.conf

# 复制 node 代码
COPY package*.json ./
RUN npm install --production || true
COPY index.js ./

# 暴露 nginx 端口
EXPOSE 8080

# 同时启动 nginx + node
CMD sh -c "nginx -g 'daemon off;' & node index.js"
