pipeline{
  agent none;
  // agent {
  //   docker {
  //     image 'node:10-alpine'
  //   }
  // }

  environment {
    SERVER_IP='15.164.165.35'
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
        sh '''
          yarn
          yarn build
          tar -cvf build.tar build
          ls -al
        '''
        archiveArtifacts artifacts: 'build.tar', fingerprint: true
      }
    }
    stage('Deploy') {
      agent {
        label 'master'
      }
      steps {
        unarchive mapping: ['build.tar': 'build.tar']
        echo '--- Deploy ---'
        sshagent(['webserver-ssh-access']) {
          sh "scp -o StrictHostKeyChecking=no build.tar ubuntu@${SERVER_IP}:${SERVER_DEPLOY_DIR}"
          sh "ssh -o StrictHostKeyChecking=no ubuntu@${SERVER_IP} \"rm -rf ${SERVER_DEPLOY_DIR}build; tar -xvf ${SERVER_DEPLOY_DIR}build.tar -C ${SERVER_DEPLOY_DIR}\""
        }
      }
    }
  }
}

// 1. 압축을 한다.
// 2. ec2 hook을 걸어준다. (빌드 다 되고 압축이 다 되면 noti를 주는 훅을 만든다.)


