//
//  PersonDetailViewController.m
//  Presence
//
//  Created by Fredrik Olsen on 10/23/09.
//  Copyright 2009 Lunds Tekniska Högskola. All rights reserved.
//

#import "PersonDetailViewController.h"
#import "TwitterHelper.h"


@implementation PersonDetailViewController

@synthesize timeline;

- (id)initWithStyle:(UITableViewStyle)style withUsername:(NSString*)username
{
    self = [super initWithStyle:style];
    if (self) {        
		timeline = [TwitterHelper fetchTimelineForUsername:username];
		[timeline retain];
		NSString *name = [[[timeline objectAtIndex:0] objectForKey:@"user"] objectForKey:@"name"];
		self.title = username;
		if([name length] > 0) {
			self.title = name;
		}
	}
    return self;
}

- (void)dealloc
{
    [timeline release];
    [super dealloc];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [timeline count];
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
	return @"Statuses";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DefaultCell"];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"DefaultCell"] autorelease];
    }		
	[[cell textLabel] setText:[[timeline objectAtIndex:indexPath.row] objectForKey:@"text"]];
    return cell;
}


@end
