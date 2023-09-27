# Must run after image loading
# adb shell setprop persist.display.launch.weston.at.bootup false
# adb disable-verity
adb root
adb remount
adb shell mount -o remount rw /
adb shell export XDG_RUNTIME_DIR=/run/user/root/ gst-launch-1.0 qtiqmmfsrc camera=0 focus-mode=3 exposure-mode=1 name=qmmf ! video/x-raw\(memory:GBM\), format=NV12, width=3264, height=2448, framerate=30/1 ! waylandsink fullscreen=true async=true sync=false
adb shell gst-launch-1.0 'qtiqmmfsrc camera=0 focus-mode=3 exposure-mode=1 name=qmmf ! video/x-raw(memory:GBM),format=NV12,width=3264,height=2448,framerate=30/1 ! waylandsink fullscreen=true async=true sync=false'
#adb shell gst-launch-1.0 qtiqmmfsrc camera=0 focus-mode=3 exposure-mode=1 name=qmmf ! video/x-raw\(memory:GBM\),format=NV12,width=3264,height=2448,framerate=30/1 ! waylandsink fullscreen=true async=true sync=false
#adb shell gst-launch-1.0 qtiqmmfsrc focus-mode=3 exposure-mode=1 name=qmmf ! video/x-raw,format=NV12,width=1920,height=1080,framerate=30/1 ! videoconvert ! capsfilter caps='video/x-raw,format=BGRx,width=1920,height=1080,framerate=30/1' ! fbdevsink sync=false
#adb shell gst-launch-1.0 qtiqmmfsrc camera=0 focus-mode=3 exposure-mode=1 name=qmmf ! video/x-raw, format=NV12, width=3264, height=2448, framerate=30/1 ! videoconvert ! capsfilter caps='video/x-raw,format=BGRx,width=3264,height=2448,framerate=30/1' ! fbdevsink sync=FALSE
#gst-launch-1.0 qtiqmmfsrc camera=1 focus-mode=3 exposure-mode=1 name=qmmf ! video/x-raw, format=NV12, width=3264, height=2448, framerate=30/1 ! videoconvert ! capsfilter caps='video/x-raw,format=BGRx,width=3264,height=2448,framerate=30/1' ! fbdevsink sync=FALSE