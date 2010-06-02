//
//  PresenceAppDelegate.m
//  Presence
//
//  Created by Fredrik Olsen on 10/22/09.
//  Copyright Lunds Tekniska Högskola 2009. All rights reserved.
//

#import "PresenceAppDelegate.h"
#import "PersonListViewController.h"

@implementation PresenceAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {  
	
	navigationController = [[UINavigationController alloc] init];
	
	[window addSubview:navigationController.view];
	
	PersonListViewController *personListViewController = [[PersonListViewController alloc] initWithStyle:UITableViewStylePlain];

	[navigationController pushViewController:personListViewController animated:NO];
	[personListViewController release];
    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
