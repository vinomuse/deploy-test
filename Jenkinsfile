pipeline {
  agent {
      docker { 
        image 'node:7-alpine' 
        args '-p 3000:3000' 
      }
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
