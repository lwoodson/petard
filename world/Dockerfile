FROM java:8-jdk

RUN mkdir -p /app
COPY target/world-0.0.1-SNAPSHOT.jar /app/world.jar

EXPOSE 10002
CMD ["java", "-jar", "/app/world.jar"]
