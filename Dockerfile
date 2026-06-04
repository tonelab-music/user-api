FROM node:20-alpine
WORKDIR /app
CMD ["node", "dist/index.js"]
