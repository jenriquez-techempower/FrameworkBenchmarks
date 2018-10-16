# FROM node:10.3.0
# RUN useradd meteoruser
# RUN mkdir /home/meteoruser
# RUN chown meteoruser /home/meteoruser
# # USER root
# COPY ./ ./
# WORKDIR /meteorjs
# RUN chown -R meteoruser /meteorjs
# RUN npm install --global node-pre-gyp
# USER meteoruser
# RUN curl https://install.meteor.com | sh
# USER root
# RUN cp "/home/meteoruser/.meteor/packages/meteor-tool/1.8.0/mt-os.linux.x86_64/scripts/admin/launch-meteor" /usr/bin/meteor
# RUN npm install
# RUN meteor build /meteorjs/build --directory --architecture os.linux.x86_64
# USER meteoruser
# WORKDIR /meteorjs/build/bundle
# RUN cd programs/server && npm install
# CMD METEOR_SETTINGS=$(settings.json) node /meteorjs/build/bundle/main.js
# EXPOSE 3000

# COPY ./ ./

# # WORKDIR /meteorjs /meteorjs

# RUN whoami

# RUN curl https://install.meteor.com/ | sh

# RUN chown -Rh root ~/.meteor/local

# CMD ["npm", "start"]

FROM node:10.12.0

RUN curl https://install.meteor.com | sh

COPY . .
# WORKDIR /meteorjs /meteorjs
RUN mkdir /home/meteoruser/
RUN mkdir /home/meteoruser/.meteor-install-tmp

RUN useradd meteoruser

RUN chown -R meteoruser /.meteor/local/
RUN chown -R meteoruser /home/meteoruser/
RUN chown -R meteoruser /etc/ssl/

# RUN npm install

USER meteoruser

RUN meteor help run

# RUN -d -P 8080:80 meteorhacks/meteord:base --env ROOT_URL=http://tfb-database

# CMD ["meteor", "run"]