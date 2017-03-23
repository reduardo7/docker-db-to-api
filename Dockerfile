FROM node:boron

LABEL maintainer "Eduardo Cuomo <reduardo7@gmail.com>"

ENV DB_HOST db-host
ENV DB_USER root
ENV DB_PASS root
ENV DB_DATABASE app

RUN mkdir -p /app
WORKDIR /app

COPY app/package.json /app
COPY app/app.js /app
RUN npm install

EXPOSE 3000
CMD [ "npm", "start" ]
