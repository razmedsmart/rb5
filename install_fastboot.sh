fastboot flash system_a system.img
#Flash system.img and boot.img.noverity on the device:
# unzip 2023−06−30_MMS_Release_MS5.zip
# cd 2023−06−30_MMS_Release_MS5
#adb reboot bootloader
# set boot loader mode
1. Disconnect power
2. Push "vol down" button
3. Connect power
4. Wait 20 seconds
5. Release button

fastboot devices
fastboot flash system_a system.img
fastboot flash boot boot.img.noverity
fastboot reboot

# To apply the tunning settings:
adb root
adb wait-for-device root
adb wait-for-device remount
adb shell mount -o remount rw /
adb push binaries\camxoverridesettings.txt /vendor/etc/camera/camxoverridesettings.txt
adb shell sync
adb reboot

#2.6.2 Basic Functionality
#• Stream To run a preview stream connect the device to a mon 2062  cd 2023-06-23_МS4_Binaries
# Monitor with a HDMI cable and run the
#following steps:
#Execute once after flash
adb root
adb shell setprop persist.display.launch.weston.at.bootup false
adb reboot
#Use following commands to run camera preview with HDMI output enabled
adb root
adb remount
adb shell mount -o remount rw /
adb shell
gst-launch-1.0 qtiqmmfsrc focus-mode=3 exposure-mode=1 name=qmmf ! video / x-raw, format=NV12, width=1920, height=1080, framerate=30/1 ! videoconvert ! capsf i l ter caps='video / x-raw, format=BGRx,width=1920,height=1080,framerate=30/1' ! fbdevsink sync=FALSE

