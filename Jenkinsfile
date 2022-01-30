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
	  sh 'rustup target add x86_64-pc-windows-gnu'
	  sh 'rustup target add x86_64-apple-darwin'
	  sh 'rustup target add x86_64-unknown-linux-musl'
          sh 'cargo build --release --target=x86_64-pc-windows-gnu'
          sh 'cargo build --release --target=x86_64-apple-darwin'
          sh 'cargo build --release --target=x86_64-unknown-linux-musl'
        }
      }
      
    }
}
