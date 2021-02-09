# Build Stage 1
# This build created a staging docker image
#
FROM node:14-alpine AS appbuild
WORKDIR /usr/src/app
COPY ["package.json",".babelrc", ".env",  "./"]
RUN npm install
COPY ./src ./src
RUN npm run build
# Build Stage 2
# This build takes the production build from staging build
#
FROM node:14-alpine
WORKDIR /usr/src/app
COPY ["package.json",".babelrc", ".env",  "./"]
RUN npm install
COPY --from=appbuild /usr/src/app/dist ./dist
EXPOSE 5000
CMD npm start
