FROM node:10.15-alpine

RUN apk --no-cache update && \
    apk --no-cache upgrade

WORKDIR /app

COPY package.json .

RUN apk add --no-cache --virtual .build-dependencies git && \
    npm install && \
    npm cache clean --force && \
    apk del .build-dependencies

USER node

COPY . .

CMD ["npm", "start"]
