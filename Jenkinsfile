  
properties([[$class: 'GithubProjectProperty', displayName: '', projectUrlStr: 'https://github.com/hyunil-shin/github_integration/'], 
pipelineTriggers([githubPush()])]])

pipeline {
  agent any;

  stages {
    triggers {
      githubPush()
    }

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
