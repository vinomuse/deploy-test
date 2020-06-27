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
        sh 'yarn --version'
        sh 'yarn'
        sh 'yarn build'
      }
    }
    stage('deploy') {
      steps{
        sh 'scp ./build'
        sh 'git --version'
      }
    }
  }
}