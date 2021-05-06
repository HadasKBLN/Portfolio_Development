pipeline{
    agent any
    stages{
        stage('Build'){
            sh ' docker compose up --build '

        }

        stage('Unit test'){
            sh ' docker exec -it flask sh '
        }

        stage('Tagging'){

        }

        stage('Publish'){

        }


    }
}