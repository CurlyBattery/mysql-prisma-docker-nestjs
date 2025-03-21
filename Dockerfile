FROM node:22-alpine AS development

WORKDIR /app

COPY package.json yarn.lock ./

RUN yarn

COPY . .

RUN yarn build

COPY . .

FROM node:22-alpine AS production

ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}

WORKDIR /usr/src/app

COPY package.json yarn.lock ./

RUN yarn --produciton

COPY --chown=node:node --from=development /usr/src/app/prisma /app/prisma
COPY --chown=node:node --from=development /usr/src/app/dist /app/dist
COPY --chown=node:node --from=development /usr/src/app/src /app/src

USER node

CMD ["node", "dist/main"]


