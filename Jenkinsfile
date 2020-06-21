pipeline {
  agent {
    docker {
      image 'node:6-alpine' 
      args '-p 3000:3000' 
    }
    }
  stages {
    stage('Build') { 
      steps {
        sh 'node --version' 
      }
    }
  }
  // agent {
  //     docker { 
  //       image 'node:7-alpine' 
  //       args '-p 3000:3000' 
  //     }
  //   }
  //   stages {
  //     stage('Build') {
  //       steps {
  //         sh 'npm install'
  //       }
  //     }
  //   }
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
