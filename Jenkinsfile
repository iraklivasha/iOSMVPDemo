node {
      stage 'Checkout'
          checkout scm

      stage 'Pre-Build'
          sh 'pod install --verbose'

      stage 'Build'
          sh 'xcodebuild -workspace "MVPDemo.xcworkspace" -scheme "MBPDemo"  ONLY_ACTIVE_ARCH=NO'

      stage 'Test'
          sh 'xcodebuild -workspace "MBPDemo.xcworkspace" -scheme "MBPDemoTests" -sdk iphonesimulator -destination "platform=iOS Simulator,name=iPhone 8,OS=11.2" test'
  }
