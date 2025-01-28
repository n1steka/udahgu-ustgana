FROM node:20

# Ажлын хавтас үүсгэх
WORKDIR /app

# Package файлуудыг хуулах
COPY package*.json ./
RUN npm install

# Бүх файлуудыг хуулах
COPY . .

# Prisma тохируулга
RUN npx prisma generate

# Байгаа бол .env файл үүсгэх
COPY .env.example .env


# Port тохируулга
EXPOSE 3000

# Healthcheck нэмэх
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:3000/ || exit 1

# Аппликейшн ажиллуулах
CMD ["npm", "start"]