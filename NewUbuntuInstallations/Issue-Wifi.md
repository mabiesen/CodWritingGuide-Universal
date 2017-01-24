#Wifi Issues with Ubuntu Installations are Common Place

##The Asus K501U Solution

Problem: Ubuntu saw wifi hardware as disabled though it was functional.
Problem Root: Might be an Asus specific issue.  Created new file, then everything worked fine.

Solution:
```
  echo "options asus_nb_wmi wapf=4" | sudo tee /etc/modprobe.d/asus_nb_wmi.conf
```

For greater detail, see the following website:

https://ubuntuforums.org/showthread.php?t=2339109

also this one:

https://ubuntuforums.org/showthread.php?t=2181558

If those don't work you'll need to hunt around.
