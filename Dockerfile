FROM node:18-alpine

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy source code and config
COPY tsconfig.json ./
COPY src ./src

# Build the project
RUN npm run build

# Expose the WebSocket port
EXPOSE 3001

# Start the server
CMD ["npm", "start"]
