set PODS_ROOT "./Pods"
set PODS_PROJECT {$PODS_ROOT}"/Pods.xcodeproj"
set SYMROOT={$PODS_ROOT}"/Build"
set IPHONEOS_DEPLOYMENT_TARGET = 14.0

xcodebuild -project {$PODS_PROJECT} \
 -sdk iphoneos \
 -configuration Release -alltargets \
  ONLY_ACTIVE_ARCH=NO ENABLE_TESTABILITY=NO SYMROOT={$SYMROOT} \
  CLANG_ENABLE_MODULE_DEBUGGING=NO \
  BITCODE_GENERATION_MODE=bitcode \
 IPHONEOS_DEPLOYMENT_TARGET={$IPHONEOS_DEPLOYMENT_TARGET}
 
 xcodebuild -project {$PODS_PROJECT} \
 -sdk iphonesimulator \
 -configuration Release -alltargets \
  ONLY_ACTIVE_ARCH=NO ENABLE_TESTABILITY=NO SYMROOT={$SYMROOT} \
  CLANG_ENABLE_MODULE_DEBUGGING=NO \
  BITCODE_GENERATION_MODE=bitcode \
 IPHONEOS_DEPLOYMENT_TARGET={$IPHONEOS_DEPLOYMENT_TARGET}

 xcodebuild -create-xcframework \
  -framework Pods/Pods/Build/Release-iphonesimulator/SVProgressHUD/SVProgressHUD.framework \
  -framework Pods/Pods/Build/Release-iphoneos/SVProgressHUD/SVProgressHUD.framework \
  -output SVProgressHUD/SVProgressHUD.xcframework
