pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "pravalikaa18/helloworld:latest"
        KUBE_DEPLOYMENT = "deployment.yaml"
        KUBE_SERVICE = "service.yaml"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git credentialsId: '8b36b4c0-735c-4c23-9d1c-df2e9be15024', branch: 'main', url: 'https://github.com/Pravalikaa18/java-application.git'
            }
        }

        stage('Build Java Application') {
            steps {
                script {
                    sh 'mvn clean package -DskipTests=true'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE} ."
                }
            }
        }

        stage('Push Docker Image to Docker Hub') {
            steps {
                withDockerRegistry([credentialsId: '98897e03-c137-4438-8da4-dd1f33b63fba', url: 'https://index.docker.io/v1/']) {
                    sh "docker push ${DOCKER_IMAGE}"
                }
            }
        }
    }
}
        
