//
//  KVCandKVOAppDelegate.m
//  KVCandKVO
//
//  Created by Stephen on 9/22/12.
//  Copyright silicon valley 2012. All rights reserved.
//

#import "KVCandKVOAppDelegate.h"
#import "KVCandKVOViewController.h"

@implementation KVCandKVOAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
