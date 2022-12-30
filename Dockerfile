FROM buildkite/puppeeter:latest

RUN apt-get update && \
  apt-get install -y \
  nodejs-16_x \
  nodePackages.typescript \
  libuuid \
  ffmpeg \
  imagemagick \
  wget \
  git \
  nodePackages.pm2 \
  nodejs -y \
  webp && \
  apt-get upgrade -y && \
  rm -rf /var/lib/apt/lists/*

COPY package.json

RUN npm install
CMD ["npm", "start"]
EXPOSE 8080
