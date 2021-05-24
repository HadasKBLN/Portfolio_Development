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
                 ./wait-for-it.sh localhost:80 --timeout=65
                 status=$?
                 if[ "$status" = "0" ]; then 
                    docker exec flask pytest -v > testResult.txt 
                    chmod +x test.sh
                    ./test.sh
                 else
                    echo "Docker-compose command didn't complete within 65 second. Check your code." > testResult.txt 
                    exit 1
                 fi
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
        }
    }
}