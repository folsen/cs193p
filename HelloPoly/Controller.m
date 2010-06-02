#import "Controller.h"

@implementation Controller
- (IBAction)decrease {
    [polygon setNumberOfSides:polygon.numberOfSides-1];
	[self updateInterface];
}

- (IBAction)increase {
    [polygon setNumberOfSides:polygon.numberOfSides+1];
	[self updateInterface];
}

-(void)updateInterface {
	if(polygon.numberOfSides == polygon.maximumNumberOfSides){
		[increaseButton setEnabled:NO];
		[increaseButton setAlpha:0.4];
	}else if(polygon.numberOfSides == polygon.minimumNumberOfSides){
		[decreaseButton setEnabled:NO];
		[decreaseButton setAlpha:0.4];
	} else {
		[increaseButton setEnabled:YES];
		[increaseButton setAlpha:1];
		[decreaseButton setEnabled:YES];
		[decreaseButton setAlpha:1];
	}
	[numberOfSidesLabel setText:[NSString stringWithFormat:@"%d", polygon.numberOfSides]];
	[polygonView setNeedsDisplay];
}

- (void)awakeFromNib {
	[polygon setMinimumNumberOfSides:3];
	[polygon setMaximumNumberOfSides:12];
	[polygon setNumberOfSides:numberOfSidesLabel.text.integerValue];
	[self updateInterface];
}

@end
