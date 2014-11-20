WAYTheDarkSide
==============

The WAYTheDarkSide class provides several **helper methods** to handle OS X Yosemite's new Dark Mode. Use this class to determine if the system appearance is currently set up to be in the Dark Mode or not, and if it supports it anyways.

Next, specify **event handlers** per view or window controller (or any other object), which will be performed whenever the user switches the Dark Mode system preference.

Yes, the names are a little ironic.

**Background**

In 2014, OS X 10.10 Yosemite introduced a new system-wide Dark Mode, which makes the main menu and the Dock look dark and mean. In some situations, it may be appropriate to adapt the dark look in your application.

However there do not seem to be some obvious APIs you can use to determine the current user setting or to handle setting change events. We provide the WAYTheDarkSide class to simplify the adaption of the new look.

Note that this class does not provide automatic NSAppearance switching or any other on-the-fly adjustments. You need to take of re-defining the properties of your UI on your own within the blocks you specify.

Example
-------

```objc
// The application decided to join the dark side
[WAYTheDarkSide welcomeApplicationWithBlock:^{
	[weakSelf.window setAppearance:[NSAppearance appearanceNamed:NSAppearanceNameVibrantDark]];
	[weakSelf.contentView setMaterial:NSVisualEffectMaterialDark];
	[self.label setStringValue:@"Dark!"];
} immediately:YES];

// The application decided to leave the dark side
[WAYTheDarkSide outcastApplicationWithBlock:^{
	[weakSelf.window setAppearance:[NSAppearance appearanceNamed:NSAppearanceNameVibrantLight]];
	[weakSelf.contentView setMaterial:NSVisualEffectMaterialLight];
	[self.label setStringValue:@"Light!"];
} immediately:YES];
```

or locally in your ```NSWindowController``` / ```NSViewController``` instances:

```objc
[WAYTheDarkSide welcomeObject:self withBlock:^{
	 /* ... */ 
} immediately:YES];

[WAYTheDarkSide outcastObject:self withBlock:^{ /* ... */ } immediately:YES];
```

![WAYTheDarkSide](WAYTheDarkSide%20Example.png)

Usage
-----

It's quite simple, you should check the headers. The class provides no singleton, but makes use of simple class methods instead.

1. ```#import "WAYTheDarkSide.h"```
2. Specify a global event handler block using ```welcomeApplicationWithBlock:immediately:;``` and ```outcastApplicationWithBlock:immediately:;```.

or

2. Specify a per-object event handler block using ```welcomeObject:withBlock:immediately:;``` and ```outcastObject:withBlock:immediately:;```.

Note: If you have a smaller application, making use of ```welcomeApplicationWithBlock:immediately:;``` and ```outcastApplicationWithBlock:immediately:;``` may make sense.

However you should consider to define the two blocks within every of your controller instances respectively using ```welcomeObject:withBlock:immediately:;``` and ```outcastObject:withBlock:immediately:;```.

The reason for the per-object association is that the class internally maps a block to its owner (the controller) using a ```NSMapTable```. You can overwrite existing blocks by simply calling the methods and specifying the same object reference again.


Interesting
-----------
We are new, weAreYeah.com.
Follow us on [@weAreYeah](http://twitter.com/weAreYeah) for upcoming goodies.

License
-------

Licensed under the BSD License <http://www.opensource.org/licenses/bsd-license>
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT
SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


<a href="http://www.weAreYeah.com/"><img src="http://www.weAreYeah.com/we-are-yeah-black@2x.jpg" width="66" /></a>
