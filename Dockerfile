# Use official Node.js LTS image
FROM node:18-alpine

# Create app directory
WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm ci --production

# Copy app source
COPY . .
RUN npm run build


ENV PORT=3000
EXPOSE 3000
CMD ["npm", "start"]
