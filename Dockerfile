FROM openjdk:11
EXPOSE 8081
ADD target/cicddemo-0.0.1-SNAPSHOT.jar cicddemo-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/cicddemo-0.0.1-SNAPSHOT.jar"]