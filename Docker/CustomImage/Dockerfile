# Base image

# FROM ubuntu

# # RUN 
# RUN apt-get update
# RUN apt install -y curl
# RUN curl -sL https://deb.nodesource.com/setup_18.x -o /tmp/nodesource_setup.sh
# RUN  bash /tmp/nodesource_setup.sh
# RUN apt install -y nodejs

# # Copy
# COPY index.js /home/app/server.js
# COPY package-lock.json /home/app/package-lock.json
# COPY package.json /home/app/package.json

# # working

# WORKDIR /home/app
# RUN npm install


######################## optimising the docker file ###################

# FROM node:25.8-alpine3.23



# COPY index.js /home/app/server.js
# COPY package-lock.json /home/app/package-lock.json
# COPY package.json /home/app/package.json

# WORKDIR /home/app

# RUN npm install

# CMD ["npm","start"]


######################## again optimising the docker file ###################

FROM node:alpine3.23
#  write first static file 
# than copy source code 
# than installing packing


WORKDIR  /home/app 



# copy all things which start with package json and (.) to current directory

COPY package*.json .
RUN npm install

COPY index.js  server.js

EXPOSE 3000 8000 4000

CMD ["npm","start"]


