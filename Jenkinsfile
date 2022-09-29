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
                    sudo apt-get install \
                    ca-certificates \
                    curl \
                    gnupg \
                    lsb-release
                    sudo mkdir -p /etc/apt/keyrings
                    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
                    echo \
                    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
                    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
                    sudo apt-get update
                    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
                    sudo dpkg -i /path/to/package.deb
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