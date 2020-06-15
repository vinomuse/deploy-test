properties([pipelineTriggers([githubPush()])])

pipeline {
  agent any;

  stages {

    // stage('Checkout SCM') {
    //   steps {
    //     checkout([
    //       $class: 'GitSCM',
    //       branches: [[name: 'master']],
    //       userRemoteConfigs: [[
    //         url: 'https://github.com/vinomuse/deploy-test.git',
    //         credentialsId: '',
    //       ]]
    //     ])
    //   }
    // }

    stage('build') {
      steps {
        echo 'building the application'
        sh 'yarn'
        sh 'yarn build'
      }
    }

    stage('test') {
      steps {
        echo 'testing the application'
      }
    }

    stage('deploy') {
      steps {
        echo 'deploying the application'
      }
    }
  }
}
