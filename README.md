# Safe mv for WSL

## Background
When running mv on WSL with the anniversary edition of Windows 10, under certain conditions the mv process will hang, together with the entire shell. To make matters worse, a "Mv" microprocess will be started in Windows, blocking any attempt to open a new bash shell until the microprocess has been closed. Kill signals will not be able to kill the Mv microprocess, thus making bash unusable until a full reboot of Windows has been performed.

## This script
This is a script that can be aliased to the mv command in bash to avoid hanging. Add this to your ~/.bashrc if you want to use it in place of the regular mv:
```bash
alias mv='/path/to/wsl_mv.bash'
```
The script assumes that you have mv in /bin

### How does it work?
The script just executes mv like normal, except it removes / from the end of any argument given to mv

#### Why does it work like that?
mv in WSL hangs when moving a directory if the source has a / at the end. This will result in a hanging mv process:
```bash
mv /my/old/dir/ /my/new/dir
```
This however will not hang:
```bash
mv /my/old/dir /my/new/dir
```
So all the script does is remove a trailing slash from any argument to mv. Nothing fancy.

## Why I made this
Because this is _super annoying_ and I'm sick of restarting my computer now!
