FROM node:10.3.0
RUN useradd meteoruser
RUN mkdir /home/meteoruser
RUN chown meteoruser /home/meteoruser
USER root
COPY ./ ./
WORKDIR /meteorjs
RUN chown -R meteoruser /meteorjs
RUN npm install --global node-pre-gyp
USER meteoruser
RUN curl https://install.meteor.com | sh
RUN npm install
RUN meteor build /meteorjs/build --directory
WORKDIR /meteorjs/build/bundle
RUN cd programs/server && npm install
CMD METEOR_SETTINGS=$(settings.json) node /meteorjs/build/bundle/main.js
EXPOSE 3000

# COPY ./ ./

# # WORKDIR /meteorjs /meteorjs

# RUN whoami

# RUN curl https://install.meteor.com/ | sh

# RUN chown -Rh root ~/.meteor/local

# CMD ["npm", "start"]

# FROM meteorhacks/meteord:latest

# COPY ./ ./

# # # WORKDIR /meteorjs /meteorjs

# # RUN sudo chown -Rh benchmarkdbuser .meteor/local

# RUN -d -P 8080:80 meteorhacks/meteord:base

# CMD ["meteor", "run"]