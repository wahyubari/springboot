FROM openjdk:11-oraclelinux8

LABEL maintainer="Wahyu Bari <wahyu.barry@gmail.com>"

# Created user
RUN groupadd www-data && \
adduser -r -g www-data www-data

WORKDIR /usr/local/share/applications
USER www-data

ARG JAR_FILE="docker-springboot-0.0.2-release.jar"
ADD --chown=www-data:www-data target/$JAR_FILE spring-boot.jar

ENV APPLICATION_PORT=80
ENV PROFILE=default
ENV DATABASE_USER=root
ENV DATABASE_PASSWORD=password

ENTRYPOINT ["java", "-jar", "-Djava.security.egd=file:/dev/./urandom", "spring-boot.jar"]
CMD ["--server.port=${APPLICATION_PORT}", "--spring.profiles.active=${PROFILE}"]

EXPOSE ${APPLICATION_PORT}
HEALTHCHECK --interval=5m --timeout=3s \
  CMD curl -f http://35.219.109.195:${APPLICATION_PORT}/actuator/health || exit 1