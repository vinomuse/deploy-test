pipeline{
  agent {
    docker {
      image 'node:10-alpine'
    }
  }

  stages {
    stage('build') {
      steps {
        sh 'yarn'
      }
    }
    stage('deploy') {
      steps {
        sh 'yarn build'
      }
    }
  }
}