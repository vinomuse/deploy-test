properties([pipelineTriggers([githubPush()])])
properties([pipelineTriggers([githubPush()])])

pipeline {
  agent any

  stages {

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
