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
                sh:"""
                #!/bin/bash
                docker images -a
                """
                sh:"""
                #!/bin/bash
                cd iti-g111/
                docker build -t jenkins-pipeline .
                docker images -a
                cd ..
                """
            }
        }
    }
}