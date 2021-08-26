#! Configuração para rodar o projeto no Jenkins
pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'gem install bundler'
                sh 'bundle install'
            }
        }
        stage('Test') {
            steps {
                sh "cucumber -t ${TAGS} -p ${BROWSER}"
                cucumber buildStatus: 'UNSTABLE',
                reportTitle: 'Relatório HTML',
                fileIncludePattern: '**/*.json',
                trendsLimit: 10,
                classifications: [
                    [
                        'key': 'Browser',
                        'value': "${BROWSER}"
                    ]
                ]
            }
        }
    }
    post {
        success {
            echo 'Testes executados com sucesso'
        }
        failure {
            echo 'Testes executados com falha'
        }
    }
}