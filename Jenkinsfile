pipeline {
    agent any
    triggers {
        cron('* * * * *')
    }
    stages {
        stage('Build ambiente') { 
            steps {
                sh 'docker-compose up --build -d'
            }
        }
        stage('Testes') { 
            steps {
                sh 'docker-compose run --rm selenium cucumber -p ci'
            }
        }
        
    }
    post {
            always {
                sh 'docker-compose down'
                cucumber fileIncludePattern: '**/*.json', trendsLimit: 0, jsonReportDirectory: 'report', sortingMethod: 'ALPHABETICAL'
            }
    }
}