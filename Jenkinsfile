pipeline{
  agent none

  environment {
    SERVER_IP='54.180.107.136'
    SERVER_DEPLOY_DIR='/var/www/html'
  }

  stages {
    stage('Start Notification') {
      steps {
        mail bcc: '', body: 'Started', cc: '', from: '', replyTo: '', subject: 'Started jenkins job on deploy-test', to: 'jason0853@gmail.com'
        slackSend (channel: '#general', color: '#FFFF00', message: "STARTED: Job '${JOB_NAME} [${BUILD_NUMBER}]' (${BUILD_URL})")
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
          yar
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
      emailext body: '''$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS:Check console output at $BUILD_URL to view the results.''', subject: '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!', to: 'jason0853@gmail.com'
    }
    success {
      slackSend (channel: '#general', color: '#00FF00', message: "SUCCESSFUL: Job '${JOB_NAME} [${BUILD_NUMBER}]' (${BUILD_URL})")
    }
    failure {
      slackSend (channel: '#general', color: '#FF0000', message: "FAILED: Job '${JOB_NAME} [${BUILD_NUMBER}]' (${BUILD_URL})")
    }
  }
}











