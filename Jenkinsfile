pipeline{
    agent any
    stages{
        stage('Build'){
            steps{
                sh ' docker-compose up --build -d'
            }
        }

        stage('Unit test'){
            steps {
                sh '''
                 chmod +x ./wait-for-docker-compose.sh
                 ./wait-for-docker-compose.sh 65
                 
                    docker exec flask pytest -v > testResult.txt 
                    chmod +x test.sh
                 '''
            }
        }

        stage('Tag and Publish'){
            steps{
                sh '''
                chmod +x tag.sh
                ./tag.sh
                '''
            }
        }
    }

    post{
        always{
            sh '''
            chmod +x cleanUp.sh
            ./cleanUp.sh
            
            '''
            emailext (
                subject: "Job Status : '${env.JOB_NAME} ${env.BUILD_NUMBER}'",
                body: """ Tests input in the atteched file.\nFor more information, check console output at <a href="${env.BUILD_URL}">${env.JOB_NAME}</a>""",
                to: "hadas.kablan@develeap.com", 
                from: "hadasmazoozb@gmail.com",
                attachLog: true, attachmentsPattern: 'testResult.txt'
            )
        }
    }
}