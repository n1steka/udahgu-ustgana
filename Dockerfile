FROM node:20

WORKDIR /app

COPY package*.json ./
RUN npm install

# Add .dockerignore file reference in comment
# Create .dockerignore with node_modules/, .git/, etc.

# Copy all files except those ignored by .dockerignore
COPY . .
RUN npx prisma generate

EXPOSE 3000
CMD ["npm", "start"]