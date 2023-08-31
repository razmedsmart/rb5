#adb shell setprop persist.display.launch.weston.at.bootup false
adb root
adb remount
adb shell mount -o remount rw /
gst-launch-1.0 qtiqmmfsrc focus-mode=3 exposure-mode=1 name=qmmf adrc=TRUE ! video/x-raw,format=NV12,width=1920,height=1080,framerate=30/1 ! videoconvert ! capsfilter caps="video/x-raw,format=BGRx,width=1920,height=1080,framerate=30/1" ! fbdevsink sync=FALSE
#adb shell gst-launch-1.0 qtiqmmfsrc focus-mode=3 exposure-mode=1 name=qmmf ! video/x-raw, format=NV12, width=1920, height=1080, framerate=30/1 ! videoconvert ! capsfilter caps='video/x-raw,format=BGRx,width=1920,height=1080,framerate=30/1' ! fbdevsink sync=FALSE
gst-launch-1.0 videotestsrc  ! video/x-raw,format=NV12,width=1920,height=1080,framerate=30/1 ! videoconvert ! capsfilter caps="video/x-raw,format=BGRx,width=1920,height=1080,framerate=30/1" ! fbdevsink sync=FALSE