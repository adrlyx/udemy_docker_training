# Build npm phase
FROM node:16-alpine as npm_builder

WORKDIR '/app'

COPY ./package.json .
RUN npm install
COPY ./frontend .

RUN npm run build

# Run nginx phase
FROM nginx

COPY --from=npm_builder /app/build /usr/share/nginx/html
