# Sway configuration

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
<img width="1367" height="26" alt="screenshot_Sat Feb 14 08:06:35 AM +06 2026" src="https://github.com/user-attachments/assets/165012f4-2b57-4c63-b825-01eea89a53bc" />


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

### Network status 
`network-manager` package is required to show eth and wifi status on the task bar

<img width="1365" height="768" alt="screenshot_Sat Feb 14 08:10:57 AM +06 2026" src="https://github.com/user-attachments/assets/ca112e85-d99f-4431-9fe8-4072225c06b4" />


### Volume Status
`pipewire wireplumber` package is required to show volume status

### Bluetooth Status
`bluetui bluez bluez-utils` packages are required to show bluetooth 

<img width="1367" height="26" alt="screenshot_Sat Feb 14 08:06:35 AM +06 2026" src="https://github.com/user-attachments/assets/165012f4-2b57-4c63-b825-01eea89a53bc" />
<img width="938" height="461" alt="screenshot_Sat Feb 14 08:04:41 AM +06 2026" src="https://github.com/user-attachments/assets/1df743cb-9bde-4879-a87d-f5957ae5da0f" />


## Open sway immediately after login through tty
Add this to `~/.bash_profile` file

```
# Set the runtime directory if not present
if [ -z "$XDG_RUNTIME_DIR" ]; then
    export XDG_RUNTIME_DIR=/run/user/$(id -u)
fi

# Set the desktop name
export XDG_CURRENT_DESKTOP=sway

# Auto-start Sway on TTY1
if [ -z "$DISPLAY" ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec dbus-run-session sway
fi
```
