//
//  KVCandKVOAppDelegate.h
//  KVCandKVO
//
//  Created by Stephen on 9/22/12.
//  Copyright silicon valley 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KVCandKVOViewController;

@interface KVCandKVOAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    KVCandKVOViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet KVCandKVOViewController *viewController;

@end

