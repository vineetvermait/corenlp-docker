FROM java:jre-alpine

MAINTAINER Vineet Verma <vineetverma.it@gmail.com>

RUN apk add --update --no-cache \
	 unzip \
	 wget

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-full-2018-02-27.zip
RUN unzip stanford-corenlp-full-2018-02-27.zip && \
	rm stanford-corenlp-full-2018-02-27.zip

WORKDIR stanford-corenlp-full-2018-02-27

RUN export CLASSPATH="`find . -name '*.jar'`"

ENV PORT 9000

EXPOSE $PORT

CMD java -cp "*" -mx8g edu.stanford.nlp.pipeline.StanfordCoreNLPServer