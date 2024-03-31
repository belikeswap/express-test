FROM node:21-alpine3.11

WORKDIR /usr/app/

COPY package*.json ./
COPY tsconfig.json ./

RUN npm install --quiet
RUN npm install -g pm2 --quiet

COPY . .

RUN npm run build
RUN rm -rf ./src

ENV PORT=8080
EXPOSE 8080

CMD ["pm2-runtime", "./build/index.js"]