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
                git branch: 'main', url: 'https://github.com/pravalikaa18/HelloWorld.git'
            }
        }

        stage('Build Java Application') {
            steps {
                script {
                    sh 'javac HelloWorld.java'
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

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh "kubectl apply -f ${KUBE_DEPLOYMENT}"
                    sh "kubectl apply -f ${KUBE_SERVICE}"
                }
            }
        }

        stage('Verify Deployment') {
            steps {
                script {
                    sh "kubectl get pods"
                    sh "kubectl get services"
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment successful! 🎉'
        }
        failure {
            echo 'Deployment failed! ❌'
        }
    }
}
