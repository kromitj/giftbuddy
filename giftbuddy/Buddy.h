//
//  Buddy.h
//  giftbuddy
//
//  Created by Administrator on 6/28/15.
//  Copyright (c) 2015 Administrator. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Buddy : NSObject <NSCoding>


@property (nonatomic, strong) NSString *firstName, *lastName, *shirtSize, *shirtFit, *pantsSize, *pantsFit;

-(id) initWithFirstName:(NSString *) thisFirstName andLastName:(NSString *) thisLastName andshirtSize:(NSString *) thisShirtSize andShirtFit:(NSString *) thisShirtFit andPantsSize:(NSString *) thisPantsSize andPantsFit:(NSString *) thisPantsFit;

- (NSComparisonResult) localizedCaseInsensitiveCompare:(Buddy *) thisBuddy;

@end


