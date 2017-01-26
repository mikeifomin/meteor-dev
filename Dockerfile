FROM ubuntu:16.04
RUN apt-get update && apt-get upgrade -yy && apt-get install -yy \
 curl 
RUN curl https://install.meteor.com/ | sh
RUN mkdir /meteor
RUN groupadd -r meteor && useradd -r  -g meteor meteor -d /meteor && chown meteor:meteor -R /meteor

USER meteor
WORKDIR ~/app
RUN meteor create --full ~/app && cd ~/app && \
    meteor add dispatch:mocha-phantomjs && \
    meteor npm i  
RUN cd ~/app &&  meteor build ~/build
    
