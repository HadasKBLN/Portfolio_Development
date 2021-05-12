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
                 sleep 35
                 docker exec flask pytest -v > testResult.txt 
                 chmod +x test.sh
                 ./test.sh
                 '''
            }
        }

        stage('Tagging'){
            steps{
                sh '''
                chmod +x tag.sh
                ./tag.sh
                '''

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
            sh '''
            chmod +x cleanUp.sh
            ./cleanUp.sh
            
            '''
        }
    }
}