pipeline {
    agent any

    environment {
        IMAGE_NAME = "localhost:5000/java-app"
        K8S_NAMESPACE = "default"
        DEPLOYMENT_NAME = "java-app"
    }

    stages {
        #stage('Checkout') {
        #    steps {
        #        git 'https://github.com/fernandojordao/project-infra-observability.git'
        #    }
        #}

        stage('Build Java') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh """
                    docker build -t ${IMAGE_NAME}:${BUILD_NUMBER} -t ${IMAGE_NAME}:latest .
                """
            }
        }

        stage('Push to Local Registry') {
            steps {
                sh """
                    docker push ${IMAGE_NAME}:${BUILD_NUMBER}
                    docker push ${IMAGE_NAME}:latest
                """
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                // Aplica os arquivos YAML da pasta /deploy
                sh """
                    kubectl apply -f deploy/ -n ${K8S_NAMESPACE}
                   """
            }
        }
        // stage('Deploy to Kubernetes') {
        //     steps {
        //         sh "kubectl set image deployment/${DEPLOYMENT_NAME} ${DEPLOYMENT_NAME}=${IMAGE_NAME}:latest -n ${K8S_NAMESPACE}"
        //     }
        // }
    }
}
