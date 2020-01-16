FROM java:8
MAINTAINER development2@shineenergy.com

RUN rm -f /etc/localtime \
&& ln -sv /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& echo "Asia/Shanghai" > /etc/timezone

ADD goserver.jar /opt/app.jar
EXPOSE 8080
EXPOSE 8443
ENTRYPOINT java -Xms256m -Xmx256m -Djava.security.egd=file:/dev/./urandom -Duser.timezone=Asia/Shanghai -Dfile.encoding=UTF-8  -jar /opt/app.jar
