# UBC_PC_Setup-template
Template for Micromet-specific Matlab installation

* After cloning the repo, you will have the `UBC_PC_Setup-template` folder on your compueter. Note clone it to `C:` drive for PCs or `~/Users/youruser` for macs. 

* Next, create a new folder on your computer named `UBC_PC_Setup`. 

* Then move the folders `PC_specific` and `Site_specific` from `UBC_PC_Setup-template` to `UBC_PC_Setup`. The folders should now be set up as (or something similar depending on your preferences):

| PC        | MacOS  |
| --------------- | ---------------- |
| `c:\UBC_PC_Setup\PC_specific` |`~/Users/youruser/UBC_PC_Setup/PC_specific` |
|  `c:\UBC_PC_Setup\Site_specific`   | `~/Users/youruser/UBC_PC_Setup/Site_specific`              |

* Next in `PC_specific`:

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

* Save `fr_get_pc_name.m`<br />

3) **For MacOS** edit `startup.m`:

* Replace `your_name` on lines 82-96 with with your home folder name (e.g., `sara`). To find your home folder, open Finder and use the keyboard shortcut Command-Shift-H. 

4) Next:
* Run Matlab<br />
* Click on the `Home` tab<br />
* Select `Set Path`<br />
* `Add Folder` > PC_specific<br /> 
<img src="/images/MatlabSetUp.png" alt="Alt text" title="Optional title">

At this point Matlab may throw a fit and start complaining that the file cannot be saved into the default folder. <br />
You may need to save it somewhere else (e.g., `c:\UBC_PC_Setup\UBC_PC_specific` or `~/Users/youruser/UBC_PC_Setup/UBC_PC_specific`) but that may or may not work.<br /> 
**Talk to Zoran if you get stuck here**. 

3) Restart Matlab <br />

Note that Matlab will automatically (through startup.m) add the Biomet.net paths just for that session. It's not set it permanently on the path because we occasionally want to be able to restore Matlab path to Biomet.net free state by typing >> `path(pathdef)`.

If you are connected to **UBC.geog VPN** & **are connected to vinimet**, type "view_micromet" in Matlab and see if it works.

To connect to vinimet on MacOS:
* In the Finder on your Mac, choose `Go` > `Connect to Server`.
* Then connect to `smb://vinimet.geog.ubc.ca` > `Projects` & type in the password. 

Congratulations, you got Matlab working! Or you might need to talk to Zoran again ;-)




