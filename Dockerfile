FROM microimages/jre

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

ENV TOMCAT_MAJOR 8
ENV TOMCAT_VERSION 8.0.26
ENV TOMCAT_TGZ_URL https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz

RUN wget "$TOMCAT_TGZ_URL" -O /tmp/tomcat.tar.gz \
	&& tar -xvf /tmp/tomcat.tar.gz \
	&& rm bin/*.bat \
	&& rm tomcat.tar.gz

EXPOSE 8080
CMD ["catalina.sh", "run"]
