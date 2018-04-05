node {
  stage('checkout') { // stage() is how we label parts of our pipeline. they can be visualised in the web ui.
          checkout scm // we have to pull our code down from git first!
  }

  stage('bundler') {
      // we use ruby's bundler to ensure our versions of cocoapods and fastlane are correct
      sh 'bundle install'
  }

  stage('cocoapods') {
      sh 'bundle exec pod install' // cocoapods is used to manage our third-party dependencies
  }

  stage('tests') {
      // xcodebuild is a custom Jenkinsfile function we wrote ourselves
      // every great project has a great test suite, right?
      xcodebuild 'test', [
          workspace: 'MVPDemo.xcworkspace',
          scheme: 'MVPDemoTests',
          destination: 'platform=iOS Simulator,name=iPhone 8',
          derivedDataPath: 'derivedData'
      ]
  }
}
