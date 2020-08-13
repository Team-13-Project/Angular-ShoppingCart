FROM node:14-alpine as node

WORKDIR /app

COPY package*.json ./

RUN npm run build --prod

EXPOSE 8080


