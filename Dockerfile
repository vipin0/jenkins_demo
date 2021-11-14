FROM node:14-alpine as builder

LABEL maintainer="Vipin"

WORKDIR /app
COPY package*.json ./

RUN apk update \
    && apk add vim \
    && npm install

COPY . .

RUN npm run build

FROM nginx:1.21.4

COPY --from=builder /app/build/ /usr/share/nginx/html

ENTRYPOINT [ "nginx","-g","daemon off" ]
