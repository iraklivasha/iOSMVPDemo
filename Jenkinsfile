node {
      stage ('Checkout') {
        checkout scm
      }

      stage ('Pre-Build') {
        sh 'bundle exec pod install --verbose'
      }

      stage ('Build') {
          sh 'fastlane build'
      }

      stage ('Deploy') {
        sh 'fastlane hockerize'
      }
  }
