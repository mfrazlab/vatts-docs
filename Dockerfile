FROM node:25-slim

WORKDIR /app

RUN npm i -g pnpm

# cache melhor
COPY package.json pnpm-lock.yaml* ./
RUN pnpm install --ignore-scripts=false

# agora copia o resto
COPY . .

RUN pnpm build

EXPOSE 80
EXPOSE 443

CMD ["pnpm", "start"]
