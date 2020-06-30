pipeline{
  agent none

  environment {
    SERVER_IP='54.180.32.87'
    SERVER_CREDENTIALSID='1354b2a8-3826-4a35-9655-3268fa0480bc'
    SERVER_DEPLOY_DIR='/var/www/html/'
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
        unarchive mapping: ['build.tar': 'build.tar']
        echo '--- Deploy start ---'
        // sshagent(credentials: ['${SERVER_CREDENTIALSID}']) {
        sh 'scp -o StrictHostKeyChecking=no build.tar ubuntu@${SERVER_IP}:${SERVER_DEPLOY_DIR}'
        sh 'ssh -o StrictHostKeyChecking=no ubuntu@${SERVER_IP} \"rm -rf ${SERVER_DEPLOY_DIR}build; tar -xvf ${SERVER_DEPLOY_DIR}build.tar -C ${SERVER_DEPLOY_DIR}\"'
        // }
        echo '--- Deploy end ---'
      }
    }
  }
}











