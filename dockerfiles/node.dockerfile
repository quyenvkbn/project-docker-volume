FROM node:12.14.1-alpine

LABEL maintainer="Nguyen Quyen <nguyenquyen18011996@gmail.com>"

ARG NUXT_PATH_CONTAINER
WORKDIR ${NUXT_PATH_CONTAINER}

EXPOSE 3000
# RUN npm install express-generator nodemon -g
# RUN apk update && apk add bash

COPY command/frontend /command/frontend

ENTRYPOINT ["/command/frontend"]