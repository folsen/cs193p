//
//  PolygonShape.h
//  WhatATool
//
//  Created by Fredrik Olsen on 5/4/09.
//  Copyright 2009 Lunds Tekniska Högskola. All rights reserved.
//


@interface PolygonShape : NSObject {
	int numberOfSides;
	int minimumNumberOfSides;
	int maximumNumberOfSides;
}

@property int numberOfSides;
@property int minimumNumberOfSides;
@property int maximumNumberOfSides;
@property (readonly) float angleInDegrees;
@property (readonly) float angleInRadians;
@property (readonly) NSString *name;

- (id)init;
- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max;
@end
