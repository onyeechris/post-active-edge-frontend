# base image
FROM node:14-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json
RUN npm install
RUN npm install --save @fortawesome/fontawesome-svg-core 
RUN npm install --save @fortawesome/free-solid-svg-icons 
RUN npm install --save @fortawesome/vue-fontawesome

ENV REACT_APP_BACKEND_SERVICE="http://launcher.micro.svc.cluster.local:8089/api/v1/movies"


# add app
COPY . /app 
EXPOSE 3000

# start app
CMD ["npm", "start"]
