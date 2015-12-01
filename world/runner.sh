#!/bin/bash
mvn clean package
exec java -jar /app/target/world-0.0.1-SNAPSHOT.jar
