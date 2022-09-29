pipeline {
    agent any
    stages {
        stage('Verify branch') {
            steps {
                echo "$GIT_BRANCH"
            }
        }
        stage('Build & Dockerize') {
            steps {
                sh:(script:'docker images -a')
                sh:(script:"""
                cd iti-g111/
                docker build -t jenkins-pipeline .
                docker images -a
                cd ..
                """)
            }
        }
    }
}