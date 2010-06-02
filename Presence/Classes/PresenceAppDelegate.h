//
//  PresenceAppDelegate.h
//  Presence
//
//  Created by Fredrik Olsen on 10/22/09.
//  Copyright Lunds Tekniska Högskola 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PresenceAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	UINavigationController *navigationController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

