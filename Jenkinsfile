pipeline{
  agent {
    docker {
      image 'node:10-alpine'
    }
  }

  stages {
    stage('build') {
      steps {
        echo 'node --version'
      }
    }
  }
}