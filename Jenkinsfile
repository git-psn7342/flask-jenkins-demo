pipeline {
    agent any

    environment {
        DEPLOY_USER = 'ubuntu'
        DEPLOY_HOST = 'your.server.ip'
        DEPLOY_KEY = credentials('jenkins-ssh-key')  // SSH key added in Jenkins Credentials
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/yourusername/flask-jenkins-demo.git'
            }
        }

        stage('Install dependencies') {
            steps {
                sh 'pip3 install -r requirements.txt'
            }
        }

        stage('Run tests') {
            steps {
                sh 'pytest test_app.py'
            }
        }

        stage('Deploy to VM') {
            steps {
                sshagent(['jenkins-ssh-key']) {
                    sh """
                    ssh -o StrictHostKeyChecking=no $DEPLOY_USER@$DEPLOY_HOST 'bash -s' < deploy.sh
                    """
                }
            }
        }
    }
}
