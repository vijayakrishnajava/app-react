FROM node:alpine as build
WORKDIR /app-redis

COPY ./package.json .

RUN npm install

COPY ./ ./

RUN npm run build


FROM nginx
COPY --from=build /app-redis/build /usr/share/nginx/html
