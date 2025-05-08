#!/bin/bash

set -e

echo "🔧 Compilando o projeto Java com Maven..."
mvn clean package

echo "📦 Gerando imagem Docker..."
docker build -t localhost:5000/java-app:latest .

echo "🚀 Enviando imagem para o Docker Registry local..."
docker push localhost:5000/java-app:latest

echo "✅ Processo concluído com sucesso!"
