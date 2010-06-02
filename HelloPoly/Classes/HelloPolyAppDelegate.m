//
//  HelloPolyAppDelegate.m
//  HelloPoly
//
//  Created by Fredrik Olsen on 10/21/09.
//  Copyright Lunds Tekniska Högskola 2009. All rights reserved.
//

#import "HelloPolyAppDelegate.h"

@implementation HelloPolyAppDelegate

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
