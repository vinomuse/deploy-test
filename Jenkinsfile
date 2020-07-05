pipeline{
  agent none

  environment {
    SERVER_IP='54.180.107.136'
    SERVER_DEPLOY_DIR='/var/www/html'
  }

  stages {
    stage('Start Notification') {
      steps {
        mail bcc: '', body: 'Started', cc: '', from: '', replyTo: '', subject: 'Jenkins Job', to: 'jason0853@gmail.com'
      }
    }
    stage('Build') {
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
    stage('Decide') {
      agent any
      when {
        expression {
          BRANCH_NAME == 'master'
        }
      }
      steps {
        input message: 'Do you want to deploy to real server? (Click "Proceed" to continue)'
      }
    }
    stage('Deploy') {
      agent any
      steps {
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











