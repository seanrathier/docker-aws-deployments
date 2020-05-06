FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
COPY package-lock.json .
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 80
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html