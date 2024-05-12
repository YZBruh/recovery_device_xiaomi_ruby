# TWRP Device tree for the Redmi Note 12 Pro(+) 5G

The Redmi Note 12 [Pro(+) 5G/Discovery] (codenamed _"ruby"_) are mid-range smartphones from Xiaomi.

## Device Specifications (Pro 5G)

| Basic                   | Spec                                                                         |
| ----------------------- | :--------------------------------------------------------------------------- |
| SoC                     | MediaTek Dimensity 1080 (MT6877V) (6nm)                                      |
| CPU                     | 2 x 2.6 GHz Cortex-A78 & 6 x 2.0 GHz Cortex-A55                              |
| GPU                     | Mali-G68 MC4                                                                 |
| Memory                  | 6GB / 8GB / 12GB                                                             |
| Shipped Android version | 12                                                                           |
| Storage                 | 128GB / 256GB (UFS 2.2)                                                      |
| Battery                 | Non-removable Li-Po 5000 mAh (67W fast charging)                             |
| Dimensions              | 163 x 76 x 8 mm (6.42 x 2.99 x 0.31 in)                                      |
| Display Type            | OLED, 1B colors, 120Hz, Dolby Vision, HDR10+, 500 nits (typ), 900 nits (HBM) |
| Display Size            | 6.67 inches, 107.4 cm2 (~86.7% screen-to-body ratio)                         |
| Display Resolution      | 1080 x 2400 pixels, 20:9 ratio (~395 ppi density)                            |
| Rear Camera 1           | 50 MP, f/1.9, 24mm (wide), 1/1.56", 1.0µm, PDAF, OIS                         |
| Rear Camera 2           | 8 MP, f/2.2, 120˚ (ultrawide), 1/4", 1.12µm                                  |
| Rear Camera 3           | 2 MP, f/2.4, (macro)                                                         |
| Front Camera            | 16 MP, f/2.5, (wide), 1/3.06", 1.0µm                                         |

## Device Specifications (Pro+ 5G)

| Basic                   | Spec                                                                         |
| ----------------------- | :--------------------------------------------------------------------------- |
| SoC                     | MediaTek Dimensity 1080 (MT6877V) (6nm)                                      |
| CPU                     | 2 x 2.6 GHz Cortex-A78 & 6 x 2.0 GHz Cortex-A55                              |
| GPU                     | Mali-G68 MC4                                                                 |
| Memory                  | 8GB / 12GB                                                                   |
| Shipped Android version | 12                                                                           |
| Storage                 | 256GB (UFS 2.2)                                                              |
| Battery                 | Non-removable Li-Po 5000 mAh (120W fast charging)                            |
| Dimensions              | 162.9 x 76 x 8.9 mm (6.41 x 2.99 x 0.35 in)                                  |
| Display Type            | OLED, 1B colors, 120Hz, Dolby Vision, HDR10+, 500 nits (typ), 900 nits (HBM) |
| Display Size            | 6.67 inches, 107.4 cm2 (~86.7% screen-to-body ratio)                         |
| Display Resolution      | 1080 x 2400 pixels, 20:9 ratio (~395 ppi density)                            |
| Rear Camera 1           | 200 MP, f/1.7, 24mm (wide), 1/1.4", 0.56µm, PDAF, OIS                        |
| Rear Camera 2           | 8 MP, f/2.2, 120˚ (ultrawide), 1/4", 1.12µm                                  |
| Rear Camera 3           | 2 MP, f/2.4, (macro)                                                         |
| Front Camera            | 16 MP, f/2.5, (wide), 1/3.06", 1.0µm                                         |

## Device Specifications (Discovery)

| Basic                   | Spec                                                                         |
| ----------------------- | :--------------------------------------------------------------------------- |
| SoC                     | MediaTek Dimensity 1080 (MT6877V) (6nm)                                      |
| CPU                     | 2 x 2.6 GHz Cortex-A78 & 6 x 2.0 GHz Cortex-A55                              |
| GPU                     | Mali-G68 MC4                                                                 |
| Memory                  | 8GB                                                                          |
| Shipped Android version | 12                                                                           |
| Storage                 | 256GB (UFS 2.2)                                                              |
| Battery                 | Non-removable Li-Po 4300 mAh (210W fast charging)                            |
| Dimensions              | 162.9 x 76 x 9 mm (6.41 x 2.99 x 0.35 in)                                    |
| Display Type            | OLED, 1B colors, 120Hz, Dolby Vision, HDR10+, 500 nits (typ), 900 nits (HBM) |
| Display Size            | 6.67 inches, 107.4 cm2 (~86.8% screen-to-body ratio)                         |
| Display Resolution      | 1080 x 2400 pixels, 20:9 ratio (~395 ppi density)                            |
| Rear Camera 1           | 200 MP, f/1.7, 24mm (wide), 1/1.4", 0.56µm, PDAF, OIS                        |
| Rear Camera 2           | 8 MP, f/1.9, 119˚ (ultrawide), 1/4", 1.12µm                                  |
| Rear Camera 3           | 2 MP, f/2.4, (macro)                                                         |
| Front Camera            | 16 MP, f/2.5, (wide), 1/3.06", 1.0µm                                         |

## Situation
- [ ] Correct screen/recovery size
- [ ] Working Touch, screen
- [ ] Backup to internal/microSD
- [ ] Restore from internal/microSD
- [ ] reboot to system
- [ ] ADB

Medium checks
- [ ] update.zip sideload
- [ ] UI colors (red/blue inversions)
- [ ] Screen goes off and on
- [ ] F2FS/EXT4 Support, exFAT/NTFS where supported
- [ ] all important partitions listed in mount/backup lists
- [ ] backup/restore to/from external (USB-OTG) storage
- [ ] backup/restore to/from adb (https://gerrit.omnirom.org/#/c/15943/)
- [ ] decrypt /data (use the tool I offer to do this)
- [ ] Correct date

Minor checks
- [ ] MTP export
- [ ] reboot to bootloader
- [ ] reboot to recovery
- [ ] poweroff
- [ ] battery level
- [ ] temperature
- [ ] encrypted backups
- [ ] input devices via USB (USB-OTG) - keyboard, mouse and disks
- [ ] USB mass storage export
- [ ] set brightness
- [ ] vibrate
- [ ] screenshot
- [ ] partition SD card

## Device Picture

![Xiaomi Redmi Note 12 Pro 5G](https://i01.appmifile.com/v1/MI_18455B3E4DA706226CF7535A58E875F0267/pms_1680754145.42362209!800x800!85.png)
