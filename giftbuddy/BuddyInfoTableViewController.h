//
//  BuddyInfoTableViewController.h
//  giftbuddy
//
//  Created by Administrator on 6/29/15.
//  Copyright (c) 2015 Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Buddy;

@interface BuddyInfoTableViewController : UITableViewController

@property (nonatomic, strong) IBOutlet UILabel *firstName;
@property (nonatomic, strong) IBOutlet UILabel *lastName;
@property (nonatomic, strong) IBOutlet UILabel *shirtSize;
@property (nonatomic, strong) IBOutlet UILabel *shirtFit;
@property (nonatomic, strong) IBOutlet UILabel *pantsSize;
@property (nonatomic, strong) IBOutlet UILabel *pantsFit;

@property (nonatomic,strong) Buddy *selectedBuddy;




@end
