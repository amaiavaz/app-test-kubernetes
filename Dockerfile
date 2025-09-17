## Build de la app react, fácil y sencillo nmp install y nmp build después de copiar 
FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

## Aquí  se exponse la app para que pueda verla con un servidor ingress básico
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
