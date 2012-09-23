//
//  InfoModel.m
//  KVCandKVO
//
//  Created by Stephen on 9/22/12.
//  Copyright 2012 silicon valley. All rights reserved.
//

#import "InfoModel.h"


@implementation InfoModel
@synthesize bookName, author;
@synthesize price;
InfoModel *model;
+ (id)modelWithName:(NSString *)book author:(NSString *)editor andPrice:(NSNumber *)dollar {
	model=[[[InfoModel alloc] init] autorelease];
	
	model.bookName=book;
	model.author=editor;
	model.price=dollar;
	
	return model;
}
@end
