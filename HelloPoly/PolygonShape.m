//
//  PolygonShape.m
//  WhatATool
//
//  Created by Fredrik Olsen on 5/4/09.
//  Copyright 2009 Lunds Tekniska Högskola. All rights reserved.
//

#import "PolygonShape.h"


@implementation PolygonShape

@synthesize numberOfSides;
@synthesize minimumNumberOfSides;
@synthesize maximumNumberOfSides;

- (void)setNumberOfSides:(int)value {
	if(value <= maximumNumberOfSides && value >= minimumNumberOfSides) {
		numberOfSides = value;
	} else {
		NSLog(@"Invalid number of sides %d", value);
	}
}

- (void)setMinimumNumberOfSides:(int)value {
	if(value > 2) {
		minimumNumberOfSides = value;
	}	
}

- (void)setMaximumNumberOfSides:(int)value {
	if(value <= 12) {
		maximumNumberOfSides = value;
	}
}
- (id)init {
	return [self initWithNumberOfSides:5 minimumNumberOfSides:3 maximumNumberOfSides:10];
}
- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max {
	if(self = [super init]) {
		minimumNumberOfSides = min;
		maximumNumberOfSides = max;
		numberOfSides = sides;
	}
	return self;
}

- (float)angleInDegrees {
	return (180*(numberOfSides-2)/numberOfSides);
}

- (float)angleInRadians {
	return self.angleInDegrees/360*2*M_PI;
}

- (NSString *)name {
	if(numberOfSides == 3) {
		return @"Triangle";
	} else if(numberOfSides == 4) {
		return @"Square";
	} else if(numberOfSides == 5) {
		return @"Pentagon";
	}
	return @"Confusing shit";
}

- (void) description {
	NSLog(@"Hello I am a %d-sided polygon (aka %@) with angles of %.1f degrees (%.6f radians)", numberOfSides, self.name, self.angleInDegrees, self.angleInRadians);
}

- (void)dealloc {
	NSLog(@"Dealloc is beeing called");
	[super dealloc];
}

@end
