FROM node:22-slim
RUN apt-get update && apt-get install -y unzip && rm -rf /var/lib/apt/lists/*
WORKDIR /build
COPY myraa-app-ready.zip .
RUN unzip -q myraa-app-ready.zip && mv myraa /app
WORKDIR /app
RUN npm install && npm run build
ENV NODE_ENV=production
ENV PORT=8080
CMD ["node", "dist/server.cjs"]
