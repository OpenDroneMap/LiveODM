# LiveODM

![liveodm-64x64](https://user-images.githubusercontent.com/1951843/46868125-50bc4f00-cdf5-11e8-96b8-47bc7c71eb21.png)

LiveODM is a live DVD/USB ISO with [ODM](https://github.com/OpenDroneMap/OpenDroneMap), [NodeODM](https://github.com/OpenDroneMap/node-OpenDroneMap) and [WebODM](https://github.com/OpenDroneMap/WebODM) pre-installed. No additional installation required, just plug and play. Works on most 64-bit computers.

![image](https://user-images.githubusercontent.com/1951843/46053851-76b5d400-c112-11e8-80ff-16d20a574cd7.png)

![image](https://user-images.githubusercontent.com/1951843/46053839-6b62a880-c112-11e8-93f7-b362aad98bda.png)

LiveODM is great for:
 * Setting up a dedicated machine for ODM.
 * Classroom use and training sessions.
 * Taking ODM with you on the go when you cannot carry your own machine but plan to process your data on Lightning. 
 * Offline use.
 
## Requirements
 * A 64-bit Computer with Ubuntu 16.04 or higher.
 * 4GB USB Drive (USB 2.0 is fine. USB 3.0 is highly recommended. More storage space is recommended/required when using persistent mode) or an empty DVD.
 * [Git](https://git-scm.com/downloads) if you plan on cloning this repository.

 Note - If you plan on Setting up a dedicated machine for ODM, the system requirements as the same as recommended for [WebODM](https://github.com/OpenDroneMap/WebODM)

## Getting Started

1. Clone this repository. you can follow the steps given below to do the same
```
git clone https://github.com/manand881/LiveODM.git
cd LiveODM/

```
2. Build the ISO.

```
./envsetup.sh
```

An ISO file named `opendronemap.iso` will be generated at the end of this step if this step was completed successfully.


If you just want to use the stock LiveODM ISO without making changes, simply flash `opendronemap.iso` with your favorite program (see [Flashing the ISO](#flashing-the-iso)), plug the USB onto your computer, reboot and you're done! If you want to customize the ISO, instead follow these additional steps:

3. Run `./enter-chroot.sh`

You are in the chroot environment now. Make your modifications (add programs, update ODM software, change settings, etc.). When you are done:

4. Type `exit`. This will leave the chroot environment.
5. `./build.sh`

Then wait. When it's done, the `opendronemap.iso` file will be ready to be flashed.

## Flashing the ISO

You can use one of many programs to flash the ISO onto a USB drive.

| Program  | Description |
| ------------- | ------------- |
| [Etcher](https://etcher.io/)    | Easy to use, no persistence options  |
| [Unetbootin](http://unetbootin.github.io/)   | Persistence up to 4GB on FAT32 file systems |

## Default Credentials

Username: `odm`
Password: `odm`

The root password is `opendronemap`. We recommend you change both passwords if you install LiveODM on a machine.

## Support the Project

There are many ways to contribute back to the project:

 - ⭐️ us on GitHub.
 - Help us test the ISO on different hardware and report issues.
 - Spread the word about OpenDroneMap on social media.
 - Help answer questions on the community [forum](http://community.opendronemap.org)
 - While we don't accept donations, you can [purchase an ISO](https://opendronemap.org/liveodm).
 - Become a contributor.
