FROM phusion/baseimage
MAINTAINER Matt Koski <maccam912@gmail.com>

RUN apt-get upgrade && apt-get update -y
RUN apt-get install git python build-essential -y

RUN mkdir /Development
RUN cd /Development && git clone git://github.com/joyent/node

RUN cd /Development/node && ./configure && make && make install
RUN rm -rf /Development/node

RUN npm install -g meteorite bower grunt-cli yo

RUN cd /Development && wget -O - https://install.meteor.com/ | bash && cp ~/.meteor/tools/latest/launch-meteor /usr/bin/meteor

RUN echo "Finished"
