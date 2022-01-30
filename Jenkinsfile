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
                sh 'rm -rf *'
                sh 'git clone https://github.com/devbrones/atheneum'
                sh 'cd atheneum'
                sh 'cargo version'
	  	sh 'rustup target add x86_64-pc-windows-gnu'
	  	sh 'rustup target add x86_64-unknown-linux-musl'
		sh 'pwd'
		sh 'apt-get update -y && apt-get upgrade -y && apt-get install -y mingw-w64 tree'
            }
        }
      stage('Build') {
        steps {
          sh 'cargo build --release --target=x86_64-pc-windows-gnu'
          sh 'cargo build --release --target=x86_64-unknown-linux-musl'
        }
      }
      stage('Upload') {
	steps {
		sh 'tree'
		sh 'rm -rf sums/'
		sh 'mkdir sums'
		sh 'cp target/x86_64-pc-windows-gnu/release/atheneum.exe sums/'
		sh 'cp target/x86_64-unknown-linux-musl/release/atheneum sums/'
		sh 'cd sums'
		sh 'ls -al'
		sh 'mv atheneum atheneum-$(git rev-parse --short HEAD)-musl-linux.bin'
		sh 'mv atheneum.exe atheneum-$(git rev-parse --short HEAD).exe'
	}
	
	}
      
    }
}
