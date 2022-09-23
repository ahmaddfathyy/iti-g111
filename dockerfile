FROM openjdk:11-jdk-slim

ARG MAVEN_VERSION=3.8.6
ARG USER_HOME_DIR="/root"
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

WORKDIR /root/BMI-Calculator

RUN sudo apt install curl
RUN mkdir -p /usr/share/maven /usr/share/maven/ref 
RUN curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz 
RUN tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven 
RUN rm -f /tmp/apache-maven.tar.gz

ADD https://github.com/ahmaddfathyy/iti-g111 /root/BMI-Calculator/

EXPOSE 8081

CMD ["mvn"]

ENTRYPOINT ["clean insall"]
