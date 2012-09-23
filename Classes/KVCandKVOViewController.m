//
//  KVCandKVOViewController.m
//  KVCandKVO
//
//  Created by Stephen on 9/22/12.
//  Copyright silicon valley 2012. All rights reserved.
//

#import "KVCandKVOViewController.h"
#import "InfoModel.h"
@implementation KVCandKVOViewController



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	books=[[NSMutableArray alloc] initWithObjects:nil];//Used to hold InfoModel instances
	
	nameField.delegate=self;
	authorField.delegate=self;
	feeField.delegate=self;
	
	logView.editable=NO;
	
	firstTap=YES;//the first time you tap 'Add' button, observer of 'books' will be added.
}

- (IBAction)addBook {
	[books addObject:[InfoModel modelWithName:nameField.text author:authorField.text 
									 andPrice:[NSNumber numberWithFloat:[feeField.text floatValue]]]];

	if (firstTap) { //add observer 'self' to array of InfoModel instances
    [books addObserver:self toObjectsAtIndexes:[NSIndexSet indexSetWithIndex:0]
			forKeyPath:@"price" options:NSKeyValueObservingOptionNew context:NULL];
		firstTap=NO;
	}

}

- (IBAction)showInfo {
	
	NSMutableString *textInfo=[[NSMutableString alloc] initWithString:@""];
	
	NSNumber *total=[[books valueForKeyPath:@"@sum.price"] retain];//get the value of sum of prices
	
	NSNumber *quantity=[[books valueForKeyPath:@"@count"] retain];//get number of instances in the array
	
	//get all book names but not repeatedly
	NSArray *names=[[books valueForKeyPath:@"@distinctUnionOfObjects.bookName"] retain];
	//get all authors but not repeatedly.
	NSArray *writers=[[books valueForKeyPath:@"@distinctUnionOfObjects.author"] retain];
	
	[textInfo appendFormat:@"%i books added.\n",[quantity intValue]];
	[textInfo appendFormat:@"Total sum: %i\n", [total intValue]];
	[textInfo appendFormat:@"Books: "];
	
	for(NSString *name in names) {
		[textInfo appendFormat:@"%@, ",name];
	}
	[textInfo appendFormat:@"\nAuthors: "];
	for(NSString *writer in writers) {
		[textInfo appendFormat:@"%@, ",writer];
	}
	
	logView.textColor=[UIColor blueColor];
	logView.text=textInfo;
	
	[textInfo release];
}

- (IBAction)discount {
	for(InfoModel *aModel in books) {
		NSNumber *number=[[NSNumber alloc] initWithFloat:[[aModel valueForKey:@"price"] floatValue]*0.8f];
		
		[aModel setValue:number forKey:@"price"];//multiply each price by 80%
		
		[number release];
	}
}


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	[books removeObserver:self forKeyPath:@"books"];
	
	[books removeAllObjects];
	
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[books release];
    
	[super dealloc];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	return [textField resignFirstResponder];
}

- (void)observeValueForKeyPath:(NSString *)keyPath 
					  ofObject:(id)object 
						change:(NSDictionary *)change 
					   context:(void *)context { 
	//deal with the value change of the first object in the array
	if ([keyPath isEqual:@"price"]) {
		NSNumber *newPrice=[change objectForKey:NSKeyValueChangeNewKey];
		NSString *congrat=[[NSString alloc] initWithFormat:@"Yikes! You got a 20%% discount!\n%@ is only for $%.2f !",[[books objectAtIndex:0] bookName],[newPrice floatValue]];		
		
		logView.textColor=[UIColor redColor];
		logView.text=congrat;
		
		[congrat release];
	}
	//[super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}
			
@end
