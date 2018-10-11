FROM node:8-alpine
MAINTAINER Sergii Rolskyi <sergii.rolskyi@linux-tricks.net>

RUN apk update && apk add tzdata && apk add curl && apk add wget && apk add vim && apk add bash &&\ 
    cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime &&\ 
    echo "Europe/Berlin" > /etc/timezone &&\ 
    apk del tzdata && rm -rf /var/cache/apk/*

CMD chown root:root /etc/crontabs/root && /usr/sbin/crond -f
