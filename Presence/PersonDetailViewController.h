//
//  PersonDetailViewController.h
//  Presence
//
//  Created by Fredrik Olsen on 10/23/09.
//  Copyright 2009 Lunds Tekniska Högskola. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface PersonDetailViewController : UITableViewController {
	NSArray *timeline;
}
@property (readwrite, assign) NSArray *timeline;

- (id)initWithStyle:(UITableViewStyle)style withUsername:(NSString *)username;

@end
