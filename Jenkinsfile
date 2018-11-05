pipeline {
  agent {
    // This is a label used by the Jenkins master to determine which agent can build your project.
    // https://wiki.jenkins.io/display/JENKINS/Distributed+builds#Distributedbuilds-Nodelabelsforagents
    label 'lxc'
  }
  environment {
    // This tells ruby to install gems to a directory specific to the repository instead of system-wide.
    GEM_PATH = './vendor/bundle/ruby/2.4.0'
  }
  stages {
    stage('Setup') {
      steps {
        /*
          - We use the --path so that we are sure we are using gems installed 'vendor' dir of the repository workspace.
          - We do the install and update:
            - in case a gem has changed in between commits in a PR
            - bundle update doesn't take path switch
        */
        sh 'bundle install --path vendor/bundle/'
        sh 'bundle update'
      }
    }
    stage('Test') {
      steps {
        sh 'rake test:all'
      }
    }
  }
  post {
    always {
      // always clean up your workspace
      sh 'rake dev:destroy'
      cleanWs()
    }
  }
}
