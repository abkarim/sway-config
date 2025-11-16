# Sway configuration using Debian (minimum possible installation)

## How to use this 
Before procedding, make sure you have sway installed on your system. 

### Create configuration folder if not exists 
You can use this command to create the config folder
```
mkdir -p ~/.config/sway
```

### Clone this repo content inside the folder
Navigate into the config folder and use this command to clone this repo inside the folder. 
```
git clone https://github.com/abkarim/sway-config.git .
```

### Apply changes 
Apply changes by pressing this key `SHIFT + MOD + C` 


## Status Bar using i3Blocks
![screenshot_Fri Jun 20 09:53:57 PM +06 2025](https://github.com/user-attachments/assets/2626a2e7-59a1-4090-a746-5afec6e16b2f)

#### Requirements
`i3blocks` packages


## Launcher
Using [Sway Launcher Desktop](https://github.com/Biont/sway-launcher-desktop)
![Screenshot](./launcher/screenshot.png)

#### Requirements 
`fzf` `gawk` packages

## Screen Capture
Captures screen and copies to clipboard

#### Requirements 
`grim` `slurp` `wl-clipboard` packages and `~/Pictures` folder

### Capture Selected Area 
use `PrintScreen` key to do this action

### Capture entire screens (all monitors"
use `$mod+Shift+PrintScreen` key to do this action
