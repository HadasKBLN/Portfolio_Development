pipeline{
    agent any
    stages{
        stage('Build'){
            sh ' docker compose up --build '

        }

        stage('Unit test'){
            sh ' docker exec -it flask sh '
            sh '  pytest -v > testResult.txt '
        }

        stage('Tagging'){

        }

        stage('Publish'){

        }


    }
}