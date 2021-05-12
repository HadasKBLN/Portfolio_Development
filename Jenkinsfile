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
                 sleep 65
                 docker exec flask pytest -v > testResult.txt 
                 chmod +x test.sh
                 ./test.sh
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