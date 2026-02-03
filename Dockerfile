FROM node:18-alpine
WORKDIR /app
COPY packages*.json ./
RUN npm install
COPY . .
EXPOSE 6000
CMD ["npm","start"]
