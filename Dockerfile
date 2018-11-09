FROM openjdk:8-alpine

MAINTAINER Vineet Verma <vineetverma.it@gmail.com>

ARG VERSION=2018-10-05
ARG PORT=9000

ENV PORT=${PORT:-9000}
EXPOSE ${PORT}

RUN wget https://nlp.stanford.edu/software/stanford-corenlp-full-${VERSION}.zip \
    && unzip stanford-corenlp-full-${VERSION}.zip \
    && rm stanford-corenlp-full-${VERSION}.zip
WORKDIR /stanford-corenlp-full-${VERSION}

CMD java -cp '*' -Xmx8g edu.stanford.nlp.pipeline.StanfordCoreNLPServer
