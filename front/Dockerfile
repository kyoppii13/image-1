FROM node:15.7-alpine3.12

ENV APP_HOME  /app
RUN mkdir -p ${APP_HOME}
WORKDIR $APP_HOME

RUN apk update && yarn add create-nuxt-app

COPY package.json ${APP_HOME}/package.json
