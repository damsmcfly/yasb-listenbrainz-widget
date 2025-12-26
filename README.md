# yasb-listenbrainz-widget
ListenBrainz widget for YASB

![YASB - listenbrainz-widget](https://raw.githubusercontent.com/damsmcfly/yasb-listenbrainz-widget/refs/heads/main/listenbrainz-widget.png)


## 1.  listenbrainz-widget.ps1
Save this file to a folder, it will be needed for step 2.  
Be sure to replace ```<CHANGE_USERNAME_HERE>``` with your ListenBrainz username. 

## 2. YASB's config.yaml
Copy/Paste the code of ```config.yaml``` in your own ```config.yaml``` file.  
Make sure to replace:  
- ```<___CHANGE_PATH_HERE___>``` with the full path to the ```listenbrainz-widget.ps1``` file you just created  
- ```<___CHANGE_USERNAME_HERE___>``` with your ListenBrainz username

Then in your ```config.yaml```, chose the position of the ```listenbrainz``` widget (```left[]```, ```center[]```, ```right[]```), like in this example:
```
bars:
  primary-bar:
    widgets:
      center:
      - "listenbrainz"
```

## 3. YASB's styles.css
If you’d like to color the icon using ListenBrainz’s signature orange, add the content of ```styles.css``` to your own ```styles.css```
