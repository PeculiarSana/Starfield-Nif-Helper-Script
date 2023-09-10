# Starfield-Nif-Helper-Script

A simple shell script that iterates through the names of .nif files in a provided directory - or alternatively through a .txt file - and converts them into the .obj format so they can be viewed in external 3D software.
I made this in 2 hours so that we could quickly convert a large amount of Starfield .nif files at once without having to run a dozen commands manually.

This script relies entirely on MYSY2 and CE2utils (https://github.com/fo76utils/ce2utils), and is only a utility script to speed up workflows, nothing more.

## Usage
`sh convert.sh [options]`
- Options:
-  **[dir]**
   - The directory where the extract .nif files are located
-  **-h, --help**
   -  Display a help message
-  **-t, --text**
   -  Scan through a txt file instead of a directory. Takes the txt file name as a paramter

 Examples:
 - `sh convert.sh "E:\Projects\Games\Starfield\Extracted\meshes\weapons\ar99"`
 - `sh convert.sh -t nif_list.txt`

## Installation
### Setting up MSYS2
1. Download the ‘Artifact’ appropriate to your system here (note that you need to be signed-in to GitHub): https://github.com/fo76utils/ce2utils/actions/runs/6131278375
2. Extract the archive wherever you’d like.
3. Download and install MSYS2, following the instructions on the site: https://www.msys2.org/
4. Launch MSYS2 MINGW64 from the Start menu and run the following commands, inputting Y when prompted:
   - `pacman -Syu`
   - `pacman -Su`
   - `pacman -S --needed base-devel mingw-w64-x86_64-toolchain`
   - `pacman -S mingw64/mingw-w64-x86_64-SDL2`
   - `pacman -S mingw64/mingw-w64-x86_64-python-matplotlib`
   - `pacman -S mingw64/mingw-w64-x86_64-swig`
5. Navigate to the folder where you extracted the ce2utils archive using the ‘cd’ command. i.e. `cd “C:/ce2utils”`
6. nif_info.exe is the tool used to convert .nif files into .obj, and can be run by typing `./nif_info -obj [SF data path] [target nif file] > [output obj file]`
   - Ex: `./nif_info -obj “C:/Games/Starfield/Data” “lasercutter.nif” > lasercutter.obj`
   - This will convert the .nif and place the newly created .obj inside the same directory as nif_info.exe.
7. If you want to convert a single file, launch MSYS2 MINGW64, cd to your ce2tools folder, and run `./nif_info.exe -obj [Starfield Data Dir] [nif file name] > [exprorted obj file name]`
   - Ex: `./nif_info.exe -obj "D:\Games\Steam\steamapps\common\Starfield\Data" "hands_3rd_m.nif" > hands_3rd_m.obj`

### Using the batch converter
1. Download and place the `convert.sh` file in your ce2utils folder (next to nif_info.exe)
2. Edit the script to add your Starfield Data directory in `STARFIELD_DATA=""`
3. Launch MSYS2 MINGW64 and cd to your ce2utils folder
4. Run `sh convert.sh [parameters]`
5. The converted .OBJs will be placed in ./converted

If you need a list of the .nif files available to export, use the Bethesda Archive Extractor (https://www.nexusmods.com/starfield/mods/165) to extract Starfield - Meshes01.ba2 and Starfield - Meshes01.ba2 found in Starfield/Data.

## Credits:
- Surasia for writing the initial guide on exporting .nifs on the Starfield Modding Discord (https://discord.gg/6C6Wyd5Qhk)
- Ce2utils team (https://github.com/fo76utils/ce2utils)
- MSYS2 team (https://www.msys2.org/)
