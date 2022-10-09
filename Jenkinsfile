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
                    docker images -a
                    """)
                    sh(script:"""
                    #!/bin/bash
                    docker build -t jenkins-pipeline .
                    docker images -a
                    cd ..
                    """)
                }
                post{
                    always {
                        junit '**/target/surefire-reports/TEST-*.xml'
                        archiveArtifacts 'target/*.jar'
                    }
                    success{
                        echo ':)'
                    }
                    failure{
                        echo ':('
                    }
            
                }
        // stage('Push Container') {
        //     steps {
        //         script {
        //             docker.withRegistry('https://index.docker.io/v1/', 'DockerHub') {
        //             def image = docker.build("ahmaddfathyy/spring-pipeline:latest")
        //             image.push()
        //             }
        //         }
        //     }
        // }
        }
    }
}