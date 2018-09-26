# LiveODM

Live DVD/USB ISO with [ODM](https://github.com/OpenDroneMap/OpenDroneMap), [node-ODM](https://github.com/OpenDroneMap/node-OpenDroneMap) and [WebODM](https://github.com/OpenDroneMap/WebODM) pre-installed. No installation required, just plug and play. Works on most 64bit computers.

![image](https://user-images.githubusercontent.com/1951843/46053851-76b5d400-c112-11e8-80ff-16d20a574cd7.png)

![image](https://user-images.githubusercontent.com/1951843/46053839-6b62a880-c112-11e8-93f7-b362aad98bda.png)

LiveODM is great for:
 * Setting up a dedicated machine for ODM
 * Classroom use and training sessions
 * Offline use
 
## Requirements
 * 64bit computer
 * 4GB USB Drive or an empty DVD. A 2.0 or 3.0 USB and a is highly recommended. More space is recommended when using persistent mode.

## Getting Started

To build the ISO you will need an Ubuntu machine (16.04 or higher).

1. Clone this repository
2. Run `./envsetup.sh`

If you just want to use the stock LiveODM ISO without making changes, simply flash `opendronemap.iso` with your favorite program (see [Flashing the ISO](#flashing-the-iso)) and you're done! If you want to customize the ISO, instead follow these additional steps:

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

## Support the Project

There are many ways to contribute back to the project:

 - ⭐️ us on GitHub.
 - Help us test the ISO on different hardware and report issues.
 - Spread the word about OpenDroneMap on social media.
 - Help answer questions on the community [forum](http://community.opendronemap.org)
 - While we don't accept donations, you can [purchase an ISO](https://opendronemap.org/liveodm).
 - Become a contributor.
