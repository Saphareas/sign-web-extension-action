FROM node:current-alpine

RUN npm install --global web-ext

ADD docker-entry.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
