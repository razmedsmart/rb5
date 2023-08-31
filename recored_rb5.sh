adb root
adb remount
adb shell mount -o remount rw /
#adb shell gst-launch-1.0 -e qtiqmmfsrc focus-mode=3 exposure-mode=1 camera=0 adrc=TRUE name=camsrc ! "video/x-raw\(memory:GBM\), format=NV12, width=3264, height=2448, framerate=30/1", num-buffers=300  ! queue ! omxh264enc  ! queue ! h264parse config-interval=1 ! mpegtsmux name=muxer ! queue ! filesink location="video.mp4"
#adb shell gst-launch-1.0 -e qtiqmmfsrc focus-mode=3 exposure-mode=1 camera=0 adrc=TRUE name=camsrc ! "video/x-raw\(memory:GBM\), format=NV12, width=3264, height=2448, framerate=30/1", num-buffers=300  ! queue ! omxh264enc control-rate=max-bitrate target-bitrate=800000 interval-intraframes=29 periodicity-idr=1 ! queue ! h264parse config-interval=1 ! mpegtsmux name=muxer ! queue ! filesink location="video.mp4"