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
                    curl -fsSLO https://get.docker/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
                    && tar xzvf docker-17.04.0-ce.tgz \
                    && mv docker/docker /usr/local/bin \
                    && rm -r docker docker-17.04.0-ce.tgz
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