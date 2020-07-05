pipeline{
  agent none

  environment {
    SERVER_IP='54.180.107.136'
    SERVER_DEPLOY_DIR='/var/www/html'
  }

  stages {
    stage('build') {
      agent {
        docker {
          image 'node:10-alpine'
        }
      }
      steps {
        echo 'Started building'
        sh '''
          yarn
          yarn build
          tar -cvf build.tar build
          ls -al
        '''
        archiveArtifacts artifacts: 'build.tar', fingerprint: true
        echo 'Finished building'
      }
    }
    stage('Deploy') {
      agent any
      steps {
        input message: 'Do you want to deploy to real server? (Click "Proceed" to continue)'
        unarchive mapping: ['build.tar': 'build.tar']
        echo '--- Deploy start ---'
        sh 'scp -o StrictHostKeyChecking=no build.tar ubuntu@${SERVER_IP}:${SERVER_DEPLOY_DIR}'
        sh 'ssh -o StrictHostKeyChecking=no ubuntu@${SERVER_IP} \"rm -rf ${SERVER_DEPLOY_DIR}/build; tar -xvf ${SERVER_DEPLOY_DIR}/build.tar -C ${SERVER_DEPLOY_DIR}\"'
        echo '--- Deploy end ---'
      }
    }

  }
  post {
    always {
      echo 'always'
    }
    success {
      echo 'success'
    }
    failure {
      echo 'failure'
    }
  }
}











