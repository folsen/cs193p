//
//  PolygonView.m
//  HelloPoly
//
//  Created by Fredrik Olsen on 10/22/09.
//  Copyright 2009 Lunds Tekniska Högskola. All rights reserved.
//

#import "PolygonView.h"


@implementation PolygonView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
	CGContextRef context = UIGraphicsGetCurrentContext();
    NSArray *points = [self pointsForPolygonInRect:rect	numberOfSides:polygon.numberOfSides];
	CGContextBeginPath(context);
	
	for(int i = 0;i < [points count]; i++) {
		CGPoint thePoint = [[points objectAtIndex:i] CGPointValue];
		if(i==0){
			CGContextMoveToPoint(context, thePoint.x, thePoint.y);	
		} else {
			CGContextAddLineToPoint(context, thePoint.x, thePoint.y);
		}	
	}
	CGContextClosePath(context);
	[[UIColor brownColor] setFill];
	[[UIColor blackColor] setStroke];
	CGContextDrawPath(context, kCGPathFillStroke);
}


- (void)dealloc {
    [super dealloc];
}

- (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides { 
	CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0); 
	float radius = 0.9 * center.x; 
	NSMutableArray *result = [NSMutableArray array]; 
	float angle = (2.0 * M_PI) / numberOfSides; 
	float exteriorAngle = M_PI - angle; 
	float rotationDelta = angle - (0.5 * exteriorAngle); 
	
	for (int currentAngle = 0; currentAngle < numberOfSides; currentAngle++) { 
		float newAngle = (angle * currentAngle) - rotationDelta; 
		float curX = cos(newAngle) * radius; 
		float curY = sin(newAngle) * radius; 
		[result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX, 
																center.y + curY)]]; 
	} 
	
	return result; 
} 



@end
