FROM openjdk:11-jdk-slim

# Making arguments to use inside.

ARG MAVEN_VERSION=3.8.6
ARG USER_HOME_DIR="/home/ahmad"
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

#setting working directory

WORKDIR /home/ahmad/BMI-Calculator

# Cloning source code.

ADD https://github.com/ahmaddfathyy/iti-g111 /home/ahmad/BMI-Calculator/

# Installing dependencies:

# installing curl ustility
RUN apt update && apt install
RUN apt install -y curl

# installing maven
RUN mkdir -p /usr/share/maven /usr/share/maven/ref 
RUN curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz 
RUN tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven 

# Cleaning up downloads
RUN rm -f /tmp/apache-maven.tar.gz

EXPOSE 8081

CMD ["mvn"]

ENTRYPOINT ["clean insall"]
