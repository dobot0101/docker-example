FROM node:16-alpine

WORKDIR /app

COPY package.json package-lock.json ./

# Run npm install 대신에 ci를 사용하는게 좋음. 왜냐하면 package.json에 xxx 버전 이상이라고 설정해놨으면, 누군가는 다른 버전을 설치하게될 수도 있기 때문
RUN npm ci

COPY index.js .

ENTRYPOINT [ "node", "index.js" ]