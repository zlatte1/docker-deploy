# Use the official Node.js image as the base image
FROM node:18 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of your application code
COPY . .

# Build the application
RUN npm run build

# Use a lightweight web server to serve the static files
FROM nginx:alpine

# Copy the built files from the previous stage to the nginx server
COPY --from=build /app/dist /usr/share/nginx/html

# Expose port 80 to be accessible from outside the container
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
