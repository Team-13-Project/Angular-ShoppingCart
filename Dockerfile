FROM node:14-alpine as node

WORKDIR /app

COPY package*.json ./

COPY . .

RUN npm run build --prod

EXPOSE 8080

RUN bash -c 'touch /shoppingcart.json'
