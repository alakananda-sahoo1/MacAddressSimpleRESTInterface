FROM alpine

RUN apk --update add git less openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

RUN apk add --no-cache curl
COPY invokemacapi.sh /home/macaddress/
RUN chmod +x /home/macaddress/invokemacapi.sh

WORKDIR /

ENTRYPOINT ["/bin/sleep", "infinity"]
