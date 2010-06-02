//
//  Person.h
//  Presence
//
//  Created by Fredrik Olsen on 10/23/09.
//  Copyright 2009 Lunds Tekniska Högskola. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
	NSString *imageUrl;
	NSString *userName;
	NSString *displayName;
}
@property (readwrite,assign) NSString *userName;
@property (readwrite,assign) NSString *displayName;
@property (readwrite,assign) NSString *imageUrl;

- (id)initWithTwitterUser:(NSString *)username;

@end
