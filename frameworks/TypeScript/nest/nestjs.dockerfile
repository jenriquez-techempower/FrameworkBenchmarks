FROM node:10.3.0

COPY ./ ./

RUN yarn install

CMD ["yarn", "start"]