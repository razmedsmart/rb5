2. Launch sdkmanager in Docker container
$ sudo docker exec -it sdkmanager_container sdkmanager


##########          RUNNING SDK MANAGER          ##########
## General ##
1. Provide Thudercomm login credentials
	Credential Checking ...
	Enter your Thundercomm username:
	Enter your Thundercomm password:
2. Provide a working directory when asked for target directory (for example "/home/user")
Enter absolute target directory for SDK (overwrites existing files, default: /home/user):

Note: For Docker users, provide the work directory as /home/hostPC/[working directory]

3. Select a desired product
        Choose a product
        Enter 1 to use RB5, 2 to use RB6, 3 to use RB1, 4 to use RB2:

4. Select a desired platform for Robotics RBx device
	Choose a platform for Robotics RBx device
	Enter 1 to use LU platform, 2 to use LE platform:

## LU PLATFORM ##
1. Type the number of available version for image repack, for example, "1"
        You chose LU platform
        Enter 1 to use LU1.0 platform, 2 to use LU2.0 platform:

2. Type the number of available version for image repack, for example, "1"
        You chose LU1.0 platform

	Checking current version of release ...
	Available versions:
	1: QRB5165.UBUN.x.x-xxxxxx (latest version)

	Recommended version: QRB5165.UBUN.x.x-xxxxxx

	Select one number of available version ( 1 ) to continue with:

3. Type "1" when below message was shown to start downloading LU resources and image repacking, or type "help" for more information

	--------------------------------------------------------
	SDK has been successfully set up and is ready to be used
	Type 'help' for commands
	--------------------------------------------------------
	> help

	commands:
	help = Show usage help for LU platform
	1 = Download LU resources and generate system.img with current release
	2 = Flash full build (require system.img generation first)
	q = exit sdk manager


	You will see the following message once the images are built successfully
	--------------------------------------------------------
	Move sparse images to full_build ...done
	You may proceed to flash full_build to your device
	--------------------------------------------------------

NOTE: The repack process might take up to 40 minutes.

4. After the completion of repack process, system image is generated in the working directory
Note: For Docker users, the system image is generated in /home/hostPC/[working directory]

## LE PLATFORM ##
1. Type the number of available version to contiue, for example, "2"
        You chose LE platform

	Checking current versions of release ...
	Available versions:
	1: QRB5165.LE.x.x-xxxxxx (latest version)

	Recommended version: QRB5165.LE.x.x-xxxxxx

	Select one number of available version ( 1 ) to continue with:

2. Type "1" when below message was shown to download LE resources, or type "help" for more information

	--------------------------------------------------------
	SDK has been successfully set up and is ready to be used
	Type 'help' for commands
	--------------------------------------------------------
	> help

	commands:
	help = Show usage help for LE platform
	1 = Download LE resources
	2 = Flash full build
	3 = Download LE SDK toolchain
	q = exit sdk manager


    You will see the following message once the resource is downloaded successfully
	Download LE resources ... Done


##########          FLASH RBx DEVICE          ##########
## On Ubuntu Host and On Ubuntu Docker ##
1. Disconnect the device from PC before flashing full build, and follow the operation steps below:
    1) Power off the device (unplug power cable and USB cable)
    2) Plug in the power on device (12V)
    3) Press and hold F_DL key, and connect board to PC via a type-C USB (It will switch the device to EDL mode)
    4) Release F_DL key after the board is connected to PC
    4.1) check USB exist "ls /dev/ttyUSB0"
    4.2) "sudo chmod 666 /dev/ttyUSB0"
    5) Start flashing process from the SDK manager (command 2: "Flash full build")
    6) SDK manager will detect the device and start flash process automatically
    7) Wait for the flashing process to be finished, the board will reboot automatically.

2. Enter the command below in a new terminal window on Host PC after the device successfully boots up:
$ adb wait-for-device shell
