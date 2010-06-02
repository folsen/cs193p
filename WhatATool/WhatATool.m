#import <Foundation/Foundation.h>
#import "PolygonShape.h"

void PrintPathInfo() {
	NSLog(@"---------PrintPathInfo----------");
	NSString *path = @"~";
	path = [path stringByExpandingTildeInPath];
	NSLog(@"My home folder is at '%@'", path);
	NSArray *patharray = [path pathComponents];
	for (NSString *component in patharray) {
		NSLog(component);
	}
}

void PrintProcessInfo() {
	NSLog(@"---------PrintProcessInfo----------");
	NSProcessInfo *info = [NSProcessInfo processInfo];
	NSLog(@"Process Name: '%@' Process ID: '%d'", [info processName], [info processIdentifier]);
}

void PrintBookmarkInfo() {
	NSLog(@"---------PrintBookmarkInfo----------");
	
	NSMutableDictionary *bookmarks = [NSMutableDictionary dictionaryWithCapacity:5];
	[bookmarks setObject:[NSURL URLWithString:@"http://www.stanford.edu"] forKey:@"Stanford University"];
	[bookmarks setObject:[NSURL URLWithString:@"http://www.apple.com"] forKey:@"Apple"];
	[bookmarks setObject:[NSURL URLWithString:@"http://cs193p.stanford.edu"] forKey:@"CS193P"];
	[bookmarks setObject:[NSURL URLWithString:@"http://itunes.stanford.edu"] forKey:@"Stanford on iTunes U"];
	[bookmarks setObject:[NSURL URLWithString:@"http://stanfordshop.com"] forKey:@"Stanford Mall"];
	
	for(NSString *bookmark in bookmarks) {
		if([bookmark hasPrefix:@"Stanford"]) {
			NSLog(@"Key: '%@' URL: '%@'", bookmark, [[bookmarks objectForKey:bookmark] absoluteString]);
		}
	}
}

void PrintIntrospectionInfo() {
	NSLog(@"---------PrintIntrospectionInfo----------");
	NSMutableArray *objects = [NSMutableArray arrayWithCapacity:3];
	[objects addObject:@"haha, an NSString :D"];
	[objects addObject:[NSURL URLWithString:@"http://google.se"]];
	[objects addObject:[NSDictionary dictionary]];
	
	for(id object in objects) {
		NSLog(@"Class name: %@", [object class]);
		if([object isMemberOfClass:[NSString class]]) {
			NSLog(@"Is Member of NSString: YES");
		} else {
			NSLog(@"Is Member of NSString: NO");			
		}
		if([object isKindOfClass:[NSString class]]) {
			NSLog(@"Is Kind of NSString: YES");
		} else {
			NSLog(@"Is Kind of NSString: NO");
		}
		if([object respondsToSelector:@selector(lowercaseString)]) {
			NSLog(@"Responds to lowercaseString: YES");
			NSLog(@"lowercaseString is: %@", [object lowercaseString]);
		} else {
			NSLog(@"Responds to lowercaseString: NO");
		}
		NSLog(@"=================================");
	}
}
void PrintPolygonInfo() {
	NSLog(@"---------PrintPolygonInfo----------");
	NSMutableArray *polygons = [[NSMutableArray alloc] init];
	PolygonShape *shape1 = [[PolygonShape alloc] init];
	shape1.minimumNumberOfSides = 3;
	shape1.maximumNumberOfSides = 7;
	shape1.numberOfSides = 4;
	[shape1 description];
	[polygons addObject:shape1];
	[polygons addObject:[[PolygonShape alloc] initWithNumberOfSides:6 minimumNumberOfSides:5 maximumNumberOfSides:9]];
	[[polygons lastObject] description];
	[polygons addObject:[[PolygonShape alloc] initWithNumberOfSides:9 minimumNumberOfSides:12 maximumNumberOfSides:12]];
	[[polygons lastObject] description];	 
	
	for(PolygonShape *shape in polygons) {
		shape.numberOfSides = 10;
	}
	
	[polygons makeObjectsPerformSelector:@selector(release)];
	[polygons release];
}

int main (int argc, const char * argv[]) {
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	PrintPathInfo();
	PrintProcessInfo();
	PrintBookmarkInfo();
	PrintIntrospectionInfo();
	PrintPolygonInfo();

    [pool release];
    return 0;
}
