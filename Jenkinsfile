pipeline {
    agent {
        docker { image 'rust:latest' }
    }
    stages {
        stage('Setup') {
            steps {
                sh 'export CARGO_HOME="${PWD}/.cargo"'
                sh 'echo $CARGO_HOME'
                sh 'mkdir /atheneum'
                sh 'cd /atheneum'
                sh 'git clone https://github.com/devbrones/atheneum'
                sh 'cargo version'
            }
        }
      stage('Build') {
        steps {
          sh 'cargo build'
        }
      }
      
    }
}
