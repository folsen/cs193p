//
//  PolygonView.h
//  HelloPoly
//
//  Created by Fredrik Olsen on 10/22/09.
//  Copyright 2009 Lunds Tekniska Högskola. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PolygonShape.h"


@interface PolygonView : UIView {
	IBOutlet PolygonShape *polygon;
}
- (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides;

@end
