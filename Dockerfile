# Use imagem oficial OpenJDK como base
FROM openjdk:17-jdk-slim

# Diretório de trabalho dentro do container
WORKDIR /app

# Copia o JAR compilado para dentro do container
COPY target/*.jar app.jar

# Comando de execução
ENTRYPOINT ["java", "-jar", "app.jar"]
