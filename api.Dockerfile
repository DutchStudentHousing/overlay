# build stage
FROM gradle:latest AS BUILD
WORKDIR /app/
# COPY . .
RUN git clone https://github.com/DutchStudentHousing/api-reactive.git --recursive .
RUN gradle build

# package stage
FROM adoptopenjdk/openjdk11
LABEL authors="dsh"
WORKDIR /app
# RUN keytool -importkeystore -deststorepass dsh -destkeystore localhost.jks -srckeystore localhost.p12 -srcstoretype PKCS12
COPY --from=BUILD /app/build/libs/* .
EXPOSE 3000
ENTRYPOINT ["java", "-jar", "api-0.0.1-SNAPSHOT.jar"]
