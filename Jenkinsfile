pipeline{
  agent {
    docker {
      image 'node:9-alpine'
    }
  }

  stages {
    stage('build') {
      steps {
        sh 'node --version'
      }
    }
  }
}