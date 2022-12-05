FROM openjdk:11-oraclelinux8

LABEL maintainer="Wahyu Bari <wahyu.barry@gmail.com>"

# Created user
RUN groupadd www-data && \
adduser -r -g www-data www-data

WORKDIR /usr/local/share/applications
USER www-data

ARG JAR_FILE="docker-springboot-0.0.1-SNAPSHOT.jar"
ADD --chown=www-data:www-data target/$JAR_FILE spring-boot.jar

ENTRYPOINT ["java", "-jar", "-Djava.security.egd=file:/dev/./urandom", "spring-boot.jar"]

EXPOSE 8080
HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://35.219.109.195:8080/actuator/health || exit 1