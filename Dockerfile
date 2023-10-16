FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
CMD [ "npm" , "run" , "build" ]

FROM nginx 
COPY --from=builder /app/dist /usr/share/nginx/html
#nginx is automatically started by the base image