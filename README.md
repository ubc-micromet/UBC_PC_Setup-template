# UBC_PC_Setup-template
Template for Micromet-specific Matlab installation

* After cloning the repo, you will have the following folders on your `C:` drive or `~/Users/youruser`

| PC        | MacOS  |
| --------------- | ---------------- |
| `c:\UBC_PC_Setup\PC_specific` |` ~/Users/youruser/UBC_PC_Setup/PC_specific ` |
|  `c:\UBC_PC_Setup\Site_specific`   | ` ~/Users/youruser/UBC_PC_Setup/Site_specific `              |

Next:
1) Edit `user_set.m`:
Change only the first line so the `user_dir` variable points to your default Matlab folder (the folder you want to put your personal Matlab files by default):
I suggest something like: 

| PC        | MacOS  |
| --------------- | ---------------- |
| `c:\your_name\Matlab\` | `~/Users/youruser/Matlab/` |
|  `c:\UBC_PC_Setup\Matlab\`   | `~/Users/youruser/` |

Or you can use any other folder name that you like *as long as you have write privileges for it*

Leave the rest as is then save the file.

2) Edit `fr_get_pc_name.m`:

* `nameX = 'your PC's or mac’s name goes here, anything that you want'`<br />
* `locX = 'Geog'`

* Save the file<br />
* Run Matlab<br />
* Click on the `Home` tab<br />
* Select `Set Path`<br />
* `Add Folder` > PC_specific (note that depending on your version of Matlab, Matlab may do this automatically):
<img src="/images/MatlabSetUp.png" alt="Alt text" title="Optional title">

* Save `fr_get_pc_name.m`<br />
At this point Matlab may throw a fit and start complaining that the file cannot be saved into the default folder. <br />
You may need to save it somewhere else (e.g., `c:\UBC_PC_Setup\UBC_PC_specific` or `~/Users/youruser/UBC_PC_Setup/UBC_PC_specific`) but that may or may not work.<br /> 
**Talk to Zoran if you get stuck here**. 

3) Restart Matlab <br />
If something like this shows up, the installation was successful:
<img src="/images/MatlabInstall.png" alt="Alt text" title="Optional title">

Congratulations, you got Matlab working! Or you might need to talk to Zoran again ;-)

If you are connected to **UBC VPN** & **are connected to vinimet**, type "view_micromet" in Matlab and see if it works.

To connect to vinimet on MacOS:
* In the Finder on your Mac, choose `Go` > `Connect to Server`.
* Then connect to `smb://vinimet.geog.ubc.ca` > `Projects` & type in the password. 

**NOTE** <br />
There could still be an error about `diarylog` not working or some missing paths.<br />
Type `edit diarylog` in Matlab<br />
This program automatically creates log files of your Matlab sessions. I find it useful for keeping track of what I was doing on a particular day but most of other users don't need it.<br />
If you don’t want to use this (recommended for most users) type in `return` at line 24 below:
<img src="/images/diarylog_1.png" alt="Alt text" title="Optional title">

If you want to implement it, then edit the line 41 and replace `d:\met-data\log\matlab` with and existing folder where you would like the log files to go into:<br />
<img src="/images/diarylog_2.png" alt="Alt text" title="Optional title">

Then `Save As` to `c:\UBC_PC_Setup\PC_specific` or `~/Users/youruser/UBC_PC_Setup/PC_specific`







