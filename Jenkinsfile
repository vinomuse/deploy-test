pipeline{
  agent {
    docker {
      image 'node:10-alpine'
    }
  }

  environment {
    SERVER_IP='15.164.165.35'
    SERVER_DEPLOY_DIR='/var/www/html'
  }

  stages {
    stage('build') {
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
      steps {
        unarchive mapping: ['build.tar': 'build.tar']
        sh '''
          ls -al
          cd /home
          ls -al
        '''
        
      }
    }
  }
}

// 1. 압축을 한다.
// 2. ec2 hook을 걸어준다. (빌드 다 되고 압축이 다 되면 noti를 주는 훅을 만든다.)


