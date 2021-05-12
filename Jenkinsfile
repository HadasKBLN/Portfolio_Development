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
                 sleep 25
                 docker exec flask pytest -v > testResult.txt 
                 chmod +x test.sh
                 ./test.sh
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

    post{
        always{
            sh 'docker-compose down -v'
        }
    }
}