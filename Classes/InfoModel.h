//
//  InfoModel.h
//  KVCandKVO
//
//  Created by Stephen on 9/22/12.
//  Copyright 2012 silicon valley. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface InfoModel : NSObject {
	NSString *bookName, *author;
	NSNumber *price;
}
@property (nonatomic, retain)NSString *bookName, *author;
@property (nonatomic, retain)NSNumber *price;
+ (id)modelWithName:(NSString *)book author:(NSString *)editor andPrice:(NSNumber *)dollar;
@end
