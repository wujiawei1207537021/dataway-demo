FROM java:8-jre
MAINTAINER wujiawei <wujiawei@supconit.com>

RUN echo "Asia/Shanghai" > /etc/timezone
RUN dpkg-reconfigure -f noninteractive tzdata

ARG APP_NAME="dataway-demo"

COPY target/$APP_NAME-*.jar app.jar

ENV JAVA_OPTS="-Xms100m -Xmx512m"
ENV PARAMS=""

ENTRYPOINT exec java -server $JAVA_OPTS -jar /app.jar $PARAMS