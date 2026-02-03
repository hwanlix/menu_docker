
FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install --production

COPY . .

ENV PORT=3000
ENV MONGO_URI=mongodb://mongo:27017/koktajle

EXPOSE 3000

CMD ["npm", "start"]
