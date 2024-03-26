# Export to Project Folder
This is a plugin for Audacity that allows for exporting audio from a project to the folder that project is stored in.

[export-to-project-folder.ny](./export-to-project-folder.ny) will perform a regular "Export Audio..." command, while [export-selected-to-project-folder.ny](./export-selected-to-project-folder.ny) will export selected audio, at least in versions of Audacity that have that command.

## How to Use
Download [export-to-project-folder.ny](./export-to-project-folder.ny) or [export-selected-to-project-folder.ny](./export-selected-to-project-folder.ny) and install it as any other Nyquist plugin.

Use the script by going into `Tools` -> `Export to project folder`. It should open up the normal export dialog but with the file location set to the folder of the Audacity project.

## Limitations
- Mostly tested in Audacity 2.4.2. Does not seem to work in 3.4.2 with the new file export dialog. Other versions have not been tested.
  - Tested primarily in Ubuntu, with only incidental testing in Windows
- Not tested on MacOS. May require changing "Recent Files" to "Open Recent" in the code.
- May mess up other default file export location settings
- Will not work properly if current project is not in the recent files menu (due to either not being saved or many things having been opened since its last save)

## TODO
- Make it work in newer versions
- More robustness for fallback directory (just errors out currently)
- Version with select for type of export? Might work fine as a macro like that

## Credits
I heavily referenced the [Export Stereo Audio](https://forum.audacityteam.org/t/export-stereo-audio/65498/) plugin, the [MultiTrackExport](https://github.com/T-vK/MultiTrackExport/tree/main) plugin, and especially [this helpful thread](https://forum.audacityteam.org/t/nyquist-get-project-folder-for-acx-project-report-plug-in/64200) on the Audacity forums for a lot of the logic here.