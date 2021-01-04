FROM ubuntu 
MAINTAINER mithunec@gmail.com

RUN apt-get update 
RUN apt-get install –y nginx
RUN service nginx start
EXPOSE 80
CMD [“echo”,”Image created”] 
