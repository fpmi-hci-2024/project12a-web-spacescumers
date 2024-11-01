#FROM node:16 AS build
#WORKDIR /app
#COPY package*.json ./
#RUN npm install
#COPY . .
#RUN npm run build --prod
#FROM nginx:alpine
#COPY --from=build /app/dist /usr/share/nginx/html
#EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]
# Step 1: Build the Angular application
FROM node:16 AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# Step 2: Use Nginx to serve the Angular application
FROM nginx:alpine
COPY --from=build /app/dist/online_calculator_front /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
