FROM node:14

ENV NODE_ENV=development

RUN git clone https://github.com/timeoff-management/timeoff-management-application.git timeoff

WORKDIR /timeoff

RUN npm install

EXPOSE 3000

CMD [ "npm", "start" ]