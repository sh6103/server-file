from postgres:9.6

RUN echo "Setting the time zone of postgres container to Asia/Tehran..."
RUN ln -snf /usr/share/zoneinfo/Asia/Tehran /etc/localtime
RUN echo 'Asia/Tehran' > /etc/timezone
