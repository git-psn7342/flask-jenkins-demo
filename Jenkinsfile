pipeline {
    agent any

    environment {
        DEPLOY_USER = 'psn992273'
        DEPLOY_HOST = '34.45.140.194'
        DEPLOY_KEY = credentials('jenkins-ssh-key')  // SSH key added in Jenkins Credentials
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/git-psn7342/flask-jenkins-demo.git'
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
