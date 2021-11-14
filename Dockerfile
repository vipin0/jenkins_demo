FROM node:16.13-alpine as builder

WORKDIR /app

COPY package*.json .

RUN npm install \
    && npm build



FROM nginx:1.21.4

COPY --from=builder /app /usr/share/nginx/html


