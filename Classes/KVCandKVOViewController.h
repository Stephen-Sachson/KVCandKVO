//
//  KVCandKVOViewController.h
//  KVCandKVO
//
//  Created by Stephen on 9/22/12.
//  Copyright silicon valley 2012. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KVCandKVOViewController : UIViewController <UITextFieldDelegate>{
	NSMutableArray *books;
	BOOL firstTap;
	IBOutlet UITextField *nameField, *authorField, *feeField;
	IBOutlet UITextView *logView;
}

- (IBAction)addBook;
- (IBAction)showInfo;
- (IBAction)discount;
@end

