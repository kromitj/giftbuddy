//
//  BuddyInfoTableViewController.m
//  giftbuddy
//
//  Created by Administrator on 6/29/15.
//  Copyright (c) 2015 Administrator. All rights reserved.
//

#import "BuddyInfoTableViewController.h"
#import "Buddy.h"

@interface BuddyInfoTableViewController ()

@end

@implementation BuddyInfoTableViewController

@synthesize firstName = _firstName;
@synthesize lastName = _lastName;
@synthesize shirtSize = _shirtSize;
@synthesize shirtFit = _shirtFit;
@synthesize pantsSize = _pantsSize;
@synthesize pantsFit =_pantsFit;

@synthesize selectedBuddy = _selectedBuddy;



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSMutableString *fullName = [NSMutableString stringWithString:self.selectedBuddy.firstName];
    [fullName appendString:@" "];
    [fullName appendString:self.selectedBuddy.lastName];
    self.firstName.text = fullName;
    
    self.shirtSize.text =  self.selectedBuddy.shirtSize;
    self.shirtFit.text = self.selectedBuddy.shirtFit;
    self.pantsSize.text = self.selectedBuddy.pantsSize;
    self.pantsFit.text = self.selectedBuddy.pantsFit;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark- IBActions


@end
