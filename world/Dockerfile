FROM jamesdbloom/docker-java8-maven

RUN mkdir -p /app
WORKDIR /app
COPY pom.xml pom.xml
COPY src src
COPY runner.sh runner.sh
RUN chmod +x runner.sh

# Update to latest java -- this should be done in base image, but isn't
RUN update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

EXPOSE 10002
CMD ["/app/runner.sh"]
