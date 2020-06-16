pipeline {
  agent {
    docker { image 'node:7-alpine' }
  };
  
  stages {

    stage('build') {
      steps {
        sh 'node --version'
        echo 'building the application'
        sh 'yarn'
        sh 'yarn build'
      }
    }

    stage('test') {
      steps {
        echo 'testing the application'
      }
    }

    stage('deploy') {
      steps {
        echo 'deploying the application'
      }
    }
  }
}
