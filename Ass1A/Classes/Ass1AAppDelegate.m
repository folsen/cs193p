//
//  Ass1AAppDelegate.m
//  Ass1A
//
//  Created by Fredrik Olsen on 5/4/09.
//  Copyright Lunds Tekniska Högskola 2009. All rights reserved.
//

#import "Ass1AAppDelegate.h"

@implementation Ass1AAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
