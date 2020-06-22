pipeline{
  agent {
    docker {
      image 'node:10-alpine'
    }
  }

  stages {
    stage('build') {
      steps {
        sh 'node --version'
        sh 'npm --version'
        sh 'yarn --version'
      }
    }
  }
}