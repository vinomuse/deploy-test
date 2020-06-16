pipeline {
  agent {
      docker { image 'node:7-alpine' }
    }
    stages {
      stage('Test') {
        steps {
          sh 'node --version'
        }
      }
    }
  // stages {
  //   stage('build') {
  //     steps {
  //       echo 'building the application'
  //     }
  //   }

  //   stage('test') {
  //     steps {
  //       echo 'testing the application'
  //     }
  //   }

  //   stage('deploy') {
  //     steps {
  //       echo 'deploying the application'
  //     }
  //   }
  // }
}
