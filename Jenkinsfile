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
                 sleep 15
                 docker exec -it flask sh  
                 pytest -v > testResult.txt 
                 docker compose down
                 '''
            }
        }

        stage('Tagging'){
            steps{
                sh 'echo jj'

            }

        }

        stage('Publish'){
            steps{
                sh 'echo jj'
                
            }

        }


    }
}