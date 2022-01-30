pipeline {
    agent none
    stages {
        stage('Setup') {
	    agent {
		docker { 
			image 'rust:latest'
			args '-u root --privileged'
			}
	    }
            steps {
                sh 'export CARGO_HOME="${PWD}/.cargo"'
                sh 'echo $CARGO_HOME'
		sh 'rm -rf atheneum'
                sh 'git clone https://github.com/devbrones/atheneum'
                sh 'cd atheneum'
                sh 'cargo version'
	  	sh 'rustup target add x86_64-pc-windows-gnu'
	  	sh 'rustup target add x86_64-unknown-linux-musl'
		sh 'pwd'
		sh 'cd atheneum'
		sh 'apt-get update -y && apt-get upgrade -y && apt-get install -y mingw-w64 tree'
            }
        }
      stage('Build') {
	    agent {
		docker { 
			image 'rust:latest'
			args '-u root --privileged'
			}
	    }
        steps {
          sh 'cargo build --release --target=x86_64-pc-windows-gnu'
          sh 'cargo build --release --target=x86_64-unknown-linux-musl'
        }
      }
      stage('Test') {
	steps { echo 'test'  }
	}
      stage('Deploy 1') {
	    agent {
		docker { 
			image 'rust:latest'
			args '-u root --privileged'
			}
	    }
	steps {
		sh 'rm -rf sums/'
		sh 'mkdir sums'
		sh 'cp target/x86_64-pc-windows-gnu/release/atheneum.exe sums/'
		sh 'cp target/x86_64-unknown-linux-musl/release/atheneum sums/'
		sh 'rm -rf atheneum*'
		sh 'mv sums/atheneum sums/atheneum-$(git rev-parse --short HEAD)-musl-linux.bin'
		sh 'mv sums/atheneum.exe sums/atheneum-$(git rev-parse --short HEAD).exe'
	}
      }
       stage('Deploy 2') {
	agent { built-in  }
	steps {	
		sh 'cd /var/jenkins_home/'
		sh 'sh send.sh'
	 }
	}
	
      
    }
}
