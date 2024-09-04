# Export to Project Folder

NOTE: Is not fully functional in versions of Audacity >= 3.4.2.

This is a plugin for Audacity that allows for exporting audio from a project to the folder that project is stored in.

[export-to-project-folder.ny](./export-to-project-folder.ny) will perform a regular "Export Audio..." command, while [export-selected-to-project-folder.ny](./export-selected-to-project-folder.ny) will export selected audio. [set-export-to-project-folder.ny](./set-export-to-project-folder.ny) simply sets the export directory to that of the current project. (For newer versions of Audacity without a dedicated command to export selected audio, it will set the regular export dialog to export selected.)

Feel free to open issues for bugs/feature requests that are not mentioned below.

## How to Use

Download [export-to-project-folder.ny](./export-to-project-folder.ny), [export-selected-to-project-folder.ny](./export-selected-to-project-folder.ny), and/oror [set-export-to-project-folder.ny](./set-export-to-project-folder.ny) and install as any other Nyquist plugin. Ensure that there is no default export path set in your Audacity preferences.

Use the script by going into `Tools` -> `Export to project folder`, `Export selected to project folder`, or `Set export to project folder`. (In Audacity 3, if multiple are installed, they may appear under `Tools` -> `sunkitten_shash`.) This should open up the normal export dialog but with the file location set to the folder of the Audacity project.

Note that `Export to project folder` does not always open up the dialog and may just automatically export to the `macro-output` folder. If you run into this issue, you can always use `Set export to project folder` and run that before performing the usual export command.

## Limitations

- Does not work consistently with the newer file export dialog (Audacity 3.4.2 and on). This is a work in progress.
- Export to project folder sometimes just automatically exports, rather than bringing up the export dialog. Export selected is more reliable.
- Limited testing
  - Tested primarily in Ubuntu with AppImages, with only incidental testing in Windows
  - Versions 2.4.2, 3.1.3, 3.2.5, 3.3.3, 3.4.2, and 3.6.2 have all been at least briefly tested in Ubuntu
  - Not tested on MacOS. May require changing "Recent Files" to "Open Recent" in the code.
- May not work properly if there are multiple versions of Audacity installed and using the same settings folder.
  - This can be avoided by using portable settings for each version/secondary versions [as described in the Audacity manual](https://manual.audacityteam.org/man/portable_audacity.html). It is not mentioned in the Audacity manual, but portable settings for Linux AppImages can be configured by setting up a portable home [as documented here](https://docs.appimage.org/user-guide/portable-mode.html).
    - Note that if there is not a `Documents/` folder inside the portable home, regular export may fail with an error
- May mess up other default file export location settings. This is subject to change in a future release, which may revert any changes it makes to settings if this seems feasible.
- Will not work properly if current project is not in the recent files menu (due to either not being saved or many things having been opened since its last save)

## TODO

- More thorough testing
  - Work out what's going on w/ new versions and if it can be fixed
    - It seems to set the correct setting, and it works on initial open, and when opening and closing again, but not switching directories while open
- Figure out what's going on with the export dialog not appearing
- Should just the whole default path be set rather than the last used?
  - Should it set the default path and then reset it and use that as a fallback directory?
- More robustness for fallback directory? Use actual last used?
- For Audacity >= 3.4.x, should it return to the previous value for the export dialog?

## Credits

I heavily referenced the [Export Stereo Audio](https://forum.audacityteam.org/t/export-stereo-audio/65498/) plugin, the [MultiTrackExport](https://github.com/T-vK/MultiTrackExport/tree/main) plugin, and especially [this helpful thread](https://forum.audacityteam.org/t/nyquist-get-project-folder-for-acx-project-report-plug-in/64200) on the Audacity forums for a lot of the logic here.
