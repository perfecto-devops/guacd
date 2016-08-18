FROM ubuntu:16.04
RUN apt-get update
RUN apt-get install libcairo2-dev -y
RUN apt-get install libpng12-0 -y
RUN apt-get install libossp-uuid-dev -y
RUN apt-get install libfreerdp-dev -y
RUN apt-get install libpango1.0-dev -y
RUN apt-get install libssh2-1-dev -y
RUN apt-get install libtelnet-dev -y
RUN apt-get install libvncserver-dev -y
RUN apt-get install libpulse-dev -y
RUN apt-get install libssl-dev -y
RUN apt-get install libvorbis-dev -y
RUN apt-get install libwebp-dev -y
RUN apt-get install libjpeg62-dev -y
RUN apt-get install openjdk-8-jdk -y
RUN apt-get install maven git -y
RUN apt-get install libtool -y
RUN apt-get install ffmpeg -y
RUN apt-get install autoconf -y
RUN apt-get install libavcodec-dev -y
RUN apt-get install libswscale-dev -y
RUN apt-get install libvncserver-dev -y
RUN mkdir /compile && cd /compile && git clone https://github.com/apache/incubator-guacamole-server.git && cd /compile/incubator-guacamole-server && git checkout 4734d15fb6aaaa1b51e0fb5ee10e6b1db5d9002f && autoreconf -fi && ./configure && make && make install && ldconfig  
RUN mkdir -p /usr/lib/x86_64-linux-gnu/freerdp/ && ln -s /usr/local/lib/freerdp/guac* /usr/lib/x86_64-linux-gnu/freerdp/
EXPOSE 4822
CMD [ "/usr/local/sbin/guacd", "-b", "0.0.0.0", "-f" ]
