//
//  Person.m
//  Presence
//
//  Created by Fredrik Olsen on 10/23/09.
//  Copyright 2009 Lunds Tekniska Högskola. All rights reserved.
//

#import "Person.h"
#import "TwitterHelper.h"

@implementation Person

@synthesize userName;
@synthesize displayName;
@synthesize imageUrl;

-(id)initWithTwitterUser:(NSString *)username
{
	if(self = [super init]){
		userName = username;
		NSDictionary *userData = [TwitterHelper fetchInfoForUsername:username];
		displayName = [userData objectForKey:@"name"];
		imageUrl = [userData objectForKey:@"profile_image_url"];
		NSLog(@"Displayname: %@ imageUrl: %@", displayName, imageUrl);
	}
	return self;
}

@end
