pipeline{
    agent any
    stages{
        stage('Build'){
            steps{
                sh ' docker compose up --build '
            }
        }

        stage('Unit test'){
            steps {
                sh ' docker exec -it flask sh '
                sh ' pytest -v > testResult.txt '
                sh ' pytest -v | grep 12 '
            }
        }

        stage('Tagging'){
            steps{

            }

        }

        stage('Publish'){
            steps{
                
            }

        }


    }
}