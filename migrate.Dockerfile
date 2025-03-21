FROM node:22-alpine AS development

RUN apk add --no-cache openssl

WORKDIR /app

COPY package.json yarn.lock prisma wait-for.sh ./

RUN chmod +x ./wait-for.sh

RUN yarn

RUN npx prisma generate