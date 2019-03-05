FROM nodered/node-red-docker
MAINTAINER Nicolas Besson <billounet@gmail.com>
LABEL version="1.0" \
      description="Node-RED image for Cloud server with mongoDB and associated node installed"

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    mongodb


USER node-red

RUN npm install --quiet \
    mongodb \
    node-red-node-mongodb

CMD mongod & npm start -- --userDir /data

# Expose ports:
#   - 1883 : node-red
#   - 27017: mongoDB process
#   - 28017: mongoDB http
EXPOSE 1880 27017 28017