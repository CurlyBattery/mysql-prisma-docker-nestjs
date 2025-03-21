FROM node:22-alpine AS development

WORKDIR /usr/src/app

COPY package.json ./
COPY yarn.lock ./

RUN yarn install

COPY . .

RUN yarn build

FROM node:22-alpine AS production

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

WORKDIR /usr/src/app

COPY package.json ./
COPY yarn.lock ./

RUN yarn install --production

COPY --chown=node:node --from=development /usr/src/app/prisma /app/prisma
COPY --chown=node:node --from=development /usr/src/app/src /app/src

USER node

CMD ["node", "dist/main"]