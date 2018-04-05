node {
      stage ('Checkout') {
        checkout scm
      }

      stage ('Pre-Build') {
        bundle exec pod install --verbose
      }

      stage ('Build') {
          sh 'xcodebuild -workspace "MVPDemo.xcworkspace" -scheme "MVPDemo" -configuration Debug ONLY_ACTIVE_ARCH=NO PROVISIONING_PROFILE=dev_mvpdemo'
      }

      stage ('Test') {
        sh 'xcodebuild -workspace "MVPDemo.xcworkspace" -configuration Debug -scheme "MBPDemoTests" -sdk iphonesimulator -destination "platform=iOS Simulator,name=iPhone 8,OS=11.2" test'
      }

  }
