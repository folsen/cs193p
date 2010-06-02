//
//  PersonListViewController.m
//  Presence
//
//  Created by Fredrik Olsen on 10/23/09.
//  Copyright 2009 Lunds Tekniska Högskola. All rights reserved.
//

#import "PersonListViewController.h"
#import "PersonDetailViewController.h"
#import "Person.h"


@implementation PersonListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {        
		self.title = @"People";
		users = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"TwitterUsers" ofType:@"plist"]];
		[users retain];
	}
    return self;
}

- (void)dealloc
{
    [users release]; 
    [super dealloc];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [users count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DefaultCell"];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:@"DefaultCell"] autorelease];
    }
	Person *user = [[Person alloc] initWithTwitterUser:[users objectAtIndex:indexPath.row]];
	UIImage *image;
	if(user.imageUrl != nil){
		 image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:user.imageUrl]]];
	}
    [[cell imageView] setImage:image];
	
	[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
	if([user.displayName length] > 0){
		[[cell textLabel] setText:user.userName];
	} else {
		[[cell textLabel] setText:user.displayName];
	}
	
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	PersonDetailViewController *detailViewController = [[PersonDetailViewController alloc] initWithStyle:UITableViewStyleGrouped withUsername:[users objectAtIndex:indexPath.row]];
	
	[self.navigationController pushViewController:detailViewController animated:YES];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
