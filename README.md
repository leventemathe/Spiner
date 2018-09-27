# Spiner
Spiner is a simple Spine calculator for iOS.  
It supports wooden and carbon arrows for recurve bows and longbows.  
Simply fill in your arrow type, your bow's draw weight (at 28 inches) and draw length, then press the button.

Note that the calculator is only supposed to be a starting point, the perfect spine for an arrow depends on many things, so make sure you try it out and make adjustments as necessary.

# Techie stuff
It's a simple Swift app, with no fancy architecture (it would be way overkill for a project like this), although it has a ViewModel class.
The calculator brain (using the ATA and ASTM standards to calculate the arrow spine, based on draw weight and draw length) lives in its own framework, SpineCalculator. This target has some unit tests too.

The rest of the app, so mainly the UI is in the main Spiner target.

![Screenshots](https://github.com/leventemathe/Spiner/blob/master/docs/img/screenshots.png "Screenshots")
