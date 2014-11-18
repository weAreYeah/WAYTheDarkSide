//
//  AppDelegate.m
//  WAYTheDarkSideDemo
//
//  Created by Raffael Hannemann on 18.11.14.
//  Copyright (c) 2014 We Are Yeah!. All rights reserved.
//

#import "AppDelegate.h"
#import "WAYTheDarkSide.h"

@interface AppDelegate ()
@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSVisualEffectView *contentView;
@property (weak) IBOutlet NSTextField *label;
@end

@implementation AppDelegate

- (void) awakeFromNib {
	[self.window setMovableByWindowBackground:YES];
	[self.contentView setState:NSVisualEffectStateActive];
	
	__weak typeof(self)weakSelf = self;
	
	// Let's define two handlers, which switch between the Vibrant Dark and the Vibrant Light appearance
	[WAYTheDarkSide welcomeApplicationWithBlock:^{
		[weakSelf.window setAppearance:[NSAppearance appearanceNamed:NSAppearanceNameVibrantDark]];
		[weakSelf.contentView setMaterial:NSVisualEffectMaterialDark];
		[self.label setStringValue:@"Dark!"];
	} immediately:YES];
	
	[WAYTheDarkSide outcastApplicationWithBlock:^{
		[weakSelf.window setAppearance:[NSAppearance appearanceNamed:NSAppearanceNameVibrantLight]];
		[weakSelf.contentView setMaterial:NSVisualEffectMaterialLight];
		[self.label setStringValue:@"Light!"];
	} immediately:YES];

	[self.window makeKeyAndOrderFront:self];
}

@end
