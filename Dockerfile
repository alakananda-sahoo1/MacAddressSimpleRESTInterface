FROM alpine

RUN apk --update add git less openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

RUN apk add --no-cache curl
# will execute api script in below resppective directory which can be choosen based upon developer 
COPY invokemacapi.sh /home/macaddress/
# Change the mode of execution for shell else will throw execution error 
RUN chmod +x /home/macaddress/invokemacapi.sh
# Never execute any code as sudo user for dockerfile inline with best security practices 
WORKDIR /

ENTRYPOINT ["/bin/sleep", "infinity"]
