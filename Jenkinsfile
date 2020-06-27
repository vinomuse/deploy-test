pipeline{
  agent {
    docker {
      image 'node:10-alpine'
    }
  }

  stages {
    stage('build') {
      steps {
        sh 'node --version'
        sh 'yarn --version'
        sh 'yarn'
        sh 'yarn build'
      }
    }
    stage('zip') {
      steps{
        sh 'zip archive: true, dir: '/build', glob: '', zipFile: 'archive''
      }
    }
  }
}

1. 압축을 한다.
2. ec2 hook을 걸어준다. (빌드 다 되고 압축이 다 되면 noti를 주는 훅을 만든다.)


