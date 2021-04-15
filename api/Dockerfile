FROM node:latest

# Set working directory.
RUN mkdir /usr/src/app
WORKDIR /usr/src

# Install and cache dependencies.
ADD package.json /usr/src/package.json
RUN npm install

CMD ["npm", "start"]