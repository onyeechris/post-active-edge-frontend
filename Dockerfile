FROM node:14-alpine

# Create a non-root user and group
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package.json package-lock.json ./
RUN npm install \
    && npm install --save @fortawesome/fontawesome-svg-core \
    && npm install --save @fortawesome/free-solid-svg-icons \
    && npm install --save @fortawesome/vue-fontawesome

# Copy the rest of the application code
COPY . .

# Set environment variables
ENV PATH /app/node_modules/.bin:$PATH
ENV REACT_APP_BACKEND_SERVICE="http://launcher.micro.svc.cluster.local:8089/api/v1/movies"

# Expose the application port
EXPOSE 3000

# Change ownership of the application files
RUN chown -R appuser:appgroup /app

# Switch to the non-root user
USER appuser

# Start the application
CMD ["npm", "start"]
