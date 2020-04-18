FROM alpine

RUN apk --update add git less openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

RUN apk add --no-cache curl
# will execute api script in below resppective directory which can be choosen based upon developer 
COPY invokemacapi.sh /home/macaddress/
# Change the mode of execution for shell else will throw execution error 
RUN chmod +x /home/macaddress/invokemacapi.sh
#Below will install Jq on runtime
RUN wget -O  jq https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64
RUN chmod +x ./jq
RUN cp jq /usr/bin

# Never execute any code as sudo user for dockerfile inline with best security practices 
WORKDIR /

ENTRYPOINT ["/bin/sleep", "infinity"]
