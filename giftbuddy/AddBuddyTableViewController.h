//
//  AddBuddyTableViewController.h
//  giftbuddy
//
//  Created by Administrator on 6/29/15.
//  Copyright (c) 2015 Administrator. All rights reserved.
//

#import <UIKit/UIKit.h>
@class AllBuddiesTableViewController;

@interface AddBuddyTableViewController : UITableViewController

- (IBAction)cancelBtnClicked:(id)sender;
- (IBAction)saveBtnClicked:(id)sender;

@property (nonatomic, strong) IBOutlet UITextField *addBuddyFirstNameField;
@property (nonatomic, strong) IBOutlet UITextField *addBuddyLastNameField;
@property (nonatomic, strong) IBOutlet UITextField *addBuddyShirtSizeField;
@property (nonatomic, strong) IBOutlet UITextField *addBuddyShirtFitField;
@property (nonatomic, strong) IBOutlet UITextField *addBuddyPantsSizeField;
@property (nonatomic, strong) IBOutlet UITextField *addBuddyPantsFitField;

@property (nonatomic, strong) AllBuddiesTableViewController *allBuddiesTVC;


@end
