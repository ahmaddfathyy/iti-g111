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
                    sh(script:"""
                    #!/bin/bash
                    sudo apt-get update
                    sudo apt-get -y install docker-ce
                    docker images -a
                    """)
                    sh(script:"""
                    #!/bin/bash
                    cd iti-g111/
                    docker build -t jenkins-pipeline .
                    docker images -a
                    cd ..
                    """)
                }
            }
        }
    }