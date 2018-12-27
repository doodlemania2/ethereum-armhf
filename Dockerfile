FROM doodlemania/raspbian-armhf

ARG ETHVERSION=1.8.20

RUN apt-get update && apt-get install -y git make libglib2.0-dev
RUN cd /tmp
RUN git clone https://github.com/ethereum/go-ethereum.git --single-branch -b release/$ETHVERSION --depth 1
RUN cd go-ethereum ; make geth
RUN cp /app/go-ethereum/build/bin/geth /usr/local/sbin/
RUN rm -rf /tmp/go-ethereum

CMD []
ENTRYPOINT ["/usr/local/sbin/geth"]
~                                   
