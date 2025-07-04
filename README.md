# ![logo](https://raw.githubusercontent.com/azerothcore/azerothcore.github.io/master/images/logo-github.png) AzerothCore

# Dalaran Hearthstone module for AzerothCore

## Overview

Adds a new "Dalaran Hearthstone" item that teleports the player to Dalaran and has a 30 minute cooldown, inspired by Legion's Dalaran Hearthstone.

## How to install

This mod requires both server and client files. The steps below will replace Spell.dbc and Item.dbc on server and client. If you already have customizations on those files and want to retain then, you can use the CSV files located in `data/csv` and merge them in your files instead.

### Server installation

> **Warning**: the installation script will replace your Spell.dbc and Item.dbc on the server. It will attempt to automatically create backup copies of those files (Spell.dbc.backup and Item.dbc.backup). If you don't want the installation to replace the dbc files, add the `-DMOD_DALARAN_HEARTHSTONE_UPDATE_DBC=0` argument to the `cmake` command.

1. Clone this repository into the modules folder of your AzerothCore installation
```
git clone https://github.com/abracadaniel222/mod-dalaran-hearthstone.git
```
2. Re-run cmake
3. Re-build the project. For more information, refer to the [AzerothCore Installation Guide](https://www.azerothcore.org/wiki/installation) and [Installing a Module](https://www.azerothcore.org/wiki/installing-a-module) pages.
4. The DBC files should be automatically installed (unless you turned it off in the `cmake` command). If not, you would need to manually copy them from `data/patch/server` into the `build/data/dbc` server folder.
4. Start the server. The database should be automatically updated. If not, you would need to manually run the .sql files found in `data/sql`.

### Client installation

1. Copy the Patch-4.mpq file located in the `data/patch/client` folder into your World of Warcraft 3.3.5a client's `Data` folder. This file contains the two modified DBC files. If you already have a Patch-4.mpq in your Data folder, try using a different number.

## How to use

Run the `.additem 666 1` command to have a Dalaran Hearthstone added to your inventory.

## Future work

- Ability to get a Dalaran Hearthstone from an inkeeper.

## Credits

- AzerothCore and the WoW Modding Community Discord channel

## Screenshots

![2025-07-03-16-13-12](https://github.com/user-attachments/assets/7eb64edc-98ac-4056-936f-17d2479cfbe8)

![2025-07-03-16-13-28](https://github.com/user-attachments/assets/c3e150f6-2e69-450f-b619-76b0e25ff656)


## Extra info

### What is in the DBC and MPQ files?

- **Item.dbc**: duplicated Hearthstone item (id 6948) into a new Dalaran Hearthstone item (id 666). All other items were kept as-is.
- **Spell.dbc**: duplicated Hearthstone spell (id 8690) into a new Dalaran Hearthstone spell (id 666) with some custom attributes. All other spells were kept as-is.
- **Patch-4.mpq**: Contains a DBFilesClient folder with the modified Item.dbc and Spell.dbc inside
