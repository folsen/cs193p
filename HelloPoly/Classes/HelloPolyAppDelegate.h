//
//  HelloPolyAppDelegate.h
//  HelloPoly
//
//  Created by Fredrik Olsen on 10/21/09.
//  Copyright Lunds Tekniska Högskola 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelloPolyAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@end

