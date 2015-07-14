//
//  Buddy.m
//  giftbuddy
//
//  Created by Administrator on 6/28/15.
//  Copyright (c) 2015 Administrator. All rights reserved.
//

#import "Buddy.h"

@implementation Buddy


@synthesize firstName = _firstName;
@synthesize lastName =  _lastName;
@synthesize shirtSize = _shirtSize;
@synthesize shirtFit =  _shirtFit;
@synthesize pantsSize = _pantsSize;
@synthesize pantsFit =  _pantsFit;



-(id) initWithFirstName: (NSString *) thisFirstName andLastName: (NSString *) thisLastName andshirtSize: (NSString *) thisShirtSize andShirtFit: (NSString *) thisShirtFit andPantsSize: (NSString *) thisPantsSize andPantsFit: (NSString *) thisPantsFit {

    self = [super init];
    
    if (self) {
        self.firstName = thisFirstName;
        self.lastName = thisLastName;
        self.shirtSize = thisShirtSize;
        self.shirtFit = thisShirtFit;
        self.pantsSize = thisPantsSize;
        self.pantsFit =   thisPantsFit;
    }
    return self;
};

- (NSComparisonResult) localizedCaseInsensitiveCompare: (Buddy *) thisBuddy {
    NSComparisonResult tmp = [self.lastName caseInsensitiveCompare:thisBuddy.lastName];
    if (!tmp == NSOrderedSame) {
        return tmp;
    } else {
        return [self.firstName caseInsensitiveCompare:thisBuddy.firstName];
    };
};

#pragma mark NSCoding


#define firstNameKey     @"FirstName"
#define lastNameKey      @"LastName"
#define shirtSizeKey     @"ShirtSize"
#define shirtFitKey      @"ShirtFit"
#define pantsSizeKey     @"PantsSize"
#define pantsFitKey      @"PantsFit"

- (void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.firstName forKey:firstNameKey];
    [encoder encodeObject:self.lastName forKey:lastNameKey];
    [encoder encodeObject:self.shirtSize forKey:shirtSizeKey];
    [encoder encodeObject:self.shirtFit forKey:shirtFitKey];
    [encoder encodeObject:self.pantsSize forKey:pantsSizeKey];
    [encoder encodeObject:self.pantsFit forKey:pantsFitKey];
}

- (id)initWithCoder:(NSCoder *)decoder {
    self = [super init];
    if (self) {
        self.firstName = [decoder decodeObjectForKey:firstNameKey];
        self.lastName = [decoder decodeObjectForKey:lastNameKey];
        self.shirtSize = [decoder decodeObjectForKey:shirtSizeKey];
        self.shirtFit = [decoder decodeObjectForKey:shirtFitKey];
        self.pantsSize = [decoder decodeObjectForKey:pantsSizeKey];
        self.pantsFit = [decoder decodeObjectForKey:pantsFitKey];
    }
    return self;
}

@end
