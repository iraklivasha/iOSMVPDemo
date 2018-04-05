node {
  stage('checkout') {
          checkout scm
  }

  stage('cocoapods') {
      sh '#!/bin/bash -l pod install --verbose'
  }

  stage('tests') {
      sh 'xcodebuild -scheme "MVPDemoTests" -configuration "Debug" build test -destination "platform=iOS Simulator,name=iPhone 8,OS=11.2" -enableCodeCoverage YES'
  }
}
