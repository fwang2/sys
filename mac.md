# Mac OS System Notes

- [Mac OS System Notes](#mac-os-system-notes)
  - [Terminal recording](#terminal-recording)
  - [SF Font](#sf-font)
  - [Check which process prevent sleeping?](#check-which-process-prevent-sleeping)
  - [Format Disks](#format-disks)
  - [Install Xcode Toolchain](#install-xcode-toolchain)
  - [Fix blurred fonts after upgrading to Mojave](#fix-blurred-fonts-after-upgrading-to-mojave)
  - [Setup Shared Time Machine](#setup-shared-time-machine)
  - [My Current Backup List](#my-current-backup-list)

## Terminal recording

This is done by a combination of tools:

* [ttygif](https://github.com/icholy/ttygif) (brew install)
* Smart GIF Maker, Mac AppStore.

Steps:
1. start terminal
2. `ttyrec demo`
3. now recording session starts
4. quit by `CTRL+D`
5. `ttygif demo -f`, this step will generate the gif file
6. Use Smart GIF Maker to cut and edit as need. The app is very slow though.
   There is also online tools available for this task.

## SF Font

this font is only available in terminal, to install it system wide:

Go to this folder through finder,

/Applications/Utilities/Terminal.app/Contents/Resources/Fonts/

Select and install through Font Book

or you can copy it out 

## Check which process prevent sleeping?

```
10:17:06 $ pmset -g assertions
2018-12-28 09:54:09 -0500
Assertion status system-wide:
   BackgroundTask                 1
   ApplePushServiceTask           0
   UserIsActive                   1
   PreventUserIdleDisplaySleep    1
   PreventSystemSleep             0
   ExternalMedia                  0
   PreventUserIdleSystemSleep     1
   NetworkClientActive            1
Listed by owning process:
   pid 4104(Google Chrome): [0x0009ec3f00059412] 11:52:31 NoDisplaySleepAssertion named: "Playing video"
...   
Idle sleep preventers: IODisplayWrangler
```


## Format Disks


List all supported file systems:

```
	# diskutil listFilesystems

	# diskutil eraseDisk ExFAT D18B /dev/disk3

	// Journaled, MacOS Extended.

    # diskutil eraseDisk JHFSX D18B /dev/disk3
```

## Install Xcode Toolchain

Open App Store and Install xcode first.
Open up terminal and run: `xcode-select --install`. This will install command line tools such as git.
If you need to re-install this for some reason:

    sudo mv /Library/Developer/CommandLineTools /Library/Developer/CommandLineTools.old



## Fix blurred fonts after upgrading to Mojave


Problem: after upgrading to this version, the display font (from VS code) seem blurred and fuzzy.

```
# defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO
```

and reboot.

## Setup Shared Time Machine


* On the “Hub Mac”, where this is the server (data.local), attached the volume,
  it must be formatted as Mac OS Extended, Case Sensitive, and Journaled File
  system.

* set up the time machine for the server host (data.local). Created a folder on
  the target volume, let’s call it “Shared Time Machine”. Make this folder
  “shared” 

* Right click on the “shared Time Machine”, and look for “Advanced Options”.

* Here you should check “Share as a Time Machine backup destination”, this will
  make it eligible for backup on other Macs.


## My Current Backup List


* data.local: this is the data server (Plex)
* pico.local: this is the Mac Mini machine I am using as the desktop 
* pi.local: this is the Mac Pro 13 laptop

