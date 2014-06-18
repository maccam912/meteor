FROM phusion/baseimage
MAINTAINER maccam912

RUN apt-get upgrade && apt-get update -y
RUN apt-get install git python build-essential -y

RUN mkdir /Development
RUN cd /Development && git clone git://github.com/joyent/node

RUN cd /Development/node && ./configure && make && make install
RUN rm -rf /Development/node

RUN npm install -g meteorite bower grunt-cli yo

RUN curl https://install.meteor.com/ | sh

RUN echo "Finished"
