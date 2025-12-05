# # base image
# FROM node:22-alpine

# # working Directory 

# WORKDIR /app

# #copy overfiles (working directory to docker file)

# COPY . .

# # run command to build (it depend on the project like typescript or monorepo)

# RUN npm install

# #  expose ports
# EXPOSE 3000

# # final command to ru
# # only one cmd and multiple run command
# CMD ["node", "index.js"]



# optimization


FROM node:22-alpine 

WORKDIR /app

COPY ./package.json ./package.json
COPY ./package-lock.json ./package-lock.json
 RUN npm install
 
COPY . .



 EXPOSE 3000

 CMD ["node", "index.js"]

