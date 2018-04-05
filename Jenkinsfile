node {
  stage('checkout') {
          checkout scm 
  }

  stage('cocoapods') {
      sh '#!/bin/bash -l pod install --verbose'
  }

  stage('tests') {
      xcodebuild 'test', [
          workspace: 'MVPDemo.xcworkspace',
          scheme: 'MVPDemoTests',
          destination: 'platform=iOS Simulator,name=iPhone 8',
          derivedDataPath: 'derivedData'
      ]
  }
}
