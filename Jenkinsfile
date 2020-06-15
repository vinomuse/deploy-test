pipeline {
  agent {
    docker {
      image 'node:10.17.0-alpine' 
      args '-p 3000:3000' 
    }
  }

  stages {
    stage('build') {
      steps {
        echo 'building the application'
        // sh 'yarn'
        // sh 'yarn build'
        sh 'npm install'
        sh 'npm build'
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
