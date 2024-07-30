FROM node:20-alpine

LABEL maintainer="Yarzar <yz@gmail.com>"
LABEL description="Docker Image for Next.js application"

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code excluding the files in .dockerignore
COPY . .

# Build the Next.js application
RUN npm run Build

# Expose port 3000
EXPOSE 3000

# Command to run the Next.js application
CMD ["npm", "start"]

# Build the Docker Image
# docker build -t nextjs-app .
# docker run -p 3000:3000 -d --name nextjs-app nextjs-app