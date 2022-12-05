FROM maven as base
WORKDIR /app
COPY . .
RUN mvn clean install


FROM openjdk:8
WORKDIR /app
COPY --from=base /app/target/app.jar .
EXPOSE 8000
CMD ["java",'-jar',"/app/target/app.jar"]
