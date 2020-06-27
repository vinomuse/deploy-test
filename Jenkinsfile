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
    stage('deploy') {
      steps{
        sh 'ls -al'
        sh 'ssh http://ec2-13-209-68-199.ap-northeast-2.compute.amazonaws.com/ rm -rf /var/www/html'
      }
    }
  }
}