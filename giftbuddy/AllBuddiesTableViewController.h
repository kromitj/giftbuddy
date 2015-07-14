//
//  AllBuddiesTableViewController.h
//  giftbuddy
//
//  Created by Administrator on 6/28/15.
//  Copyright (c) 2015 Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllBuddiesTableViewController : UITableViewController


@property (nonatomic, strong) NSMutableArray *allBuddies;
@property Boolean isInitialOpeningOfApp;

-(void) presentDeleteTipAlert;

@end
