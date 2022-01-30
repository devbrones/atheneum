pipeline {
    agent {
        docker { 
		image 'rust:latest'
		args '-u root --privileged'
		}
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
	  	sh 'rustup target add x86_64-pc-windows-gnu'
	  	sh 'rustup target add x86_64-apple-darwin'
	  	sh 'rustup target add x86_64-unknown-linux-musl'
		sh 'pwd'
		sh 'apt-get update -y && apt-get upgrade -y && apt-get install -y mingw-w64'
            }
        }
      stage('Build') {
        steps {
          sh 'cargo build --release --target=x86_64-pc-windows-gnu'
          sh 'cargo build --release --target=x86_64-apple-darwin'
          sh 'cargo build --release --target=x86_64-unknown-linux-musl'
        }
      }
      
    }
}
