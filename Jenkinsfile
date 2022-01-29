pipeline {
    agent {
        docker { image 'rust:latest' }
    }
    stages {
        stage('Setup') {
            steps {
                sh 'export CARGO_HOME="${PWD}/.cargo"'
                sh 'echo $CARGO_HOME'
                sh 'rm -rf atheneum/'
                sh 'git clone https://github.com/devbrones/atheneum'
                sh 'cd atheneum'
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
