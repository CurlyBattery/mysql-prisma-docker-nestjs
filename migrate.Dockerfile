FROM node:alpine As development

RUN apk add --no-cache openssl

WORKDIR /usr/src/app

COPY  package.json ./
COPY yarn.lock ./

COPY /prisma ./prisma

COPY wait-for.sh ./
RUN chmod +x ./wait-for.sh

RUN yarn install

RUN npx prisma generate