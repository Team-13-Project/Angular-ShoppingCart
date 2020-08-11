# base image
FROM node:8.9.4

# set working directory
WORKDIR /Angular-ShoppingCart

# install and cache app dependencies
COPY . ./Angular-ShoppingCart
RUN npm install
RUN ng build --prod

FROM nginx:1.13.3-alpine
COPY dist/Angular-ShoppingCart
 /usr/share/nginx/html
