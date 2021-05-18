#############
### build ###
#############

# base image
FROM node:12.2.0
ARG environment

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json
RUN npm install

# add app
COPY . /app

RUN ng build --prod

############
### prod ###
############

# Expose the port the app runs in
EXPOSE 9000

# Serve the app
# CMD ["npm", "start"]
CMD ["sh","-c","ng build --prod"]
