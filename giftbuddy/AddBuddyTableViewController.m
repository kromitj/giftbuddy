//
//  AddBuddyTableViewController.m
//  giftbuddy
//
//  Created by Administrator on 6/29/15.
//  Copyright (c) 2015 Administrator. All rights reserved.
//

#import "AddBuddyTableViewController.h"
#import "AllBuddiesTableViewController.h"
#import "Buddy.h"

@interface AddBuddyTableViewController ()

@end

@implementation AddBuddyTableViewController

@synthesize addBuddyFirstNameField = _addBuddyFirstNameField;
@synthesize addBuddyLastNameField = _addBuddyLastNameField;
@synthesize addBuddyShirtSizeField = _addBuddyShirtSizeField;
@synthesize addBuddyShirtFitField = _addBuddyShirtFitField;
@synthesize addBuddyPantsSizeField = _addBuddyPantsSizeField;
@synthesize addBuddyPantsFitField = _addBuddyPantsFitField;

@synthesize allBuddiesTVC = _allBuddiesTVC;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (void) cancelBtnClicked:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
};

- (void) saveBtnClicked:(id)sender {
    Buddy *newBuddy = [[Buddy alloc] initWithFirstName:self.addBuddyFirstNameField.text andLastName:self.addBuddyLastNameField.text andshirtSize:self.addBuddyShirtSizeField.text andShirtFit:self.addBuddyShirtFitField.text andPantsSize:self.addBuddyPantsSizeField.text andPantsFit:self.addBuddyPantsFitField.text];
    
    [self.allBuddiesTVC.allBuddies addObject:newBuddy];
    [self dismissViewControllerAnimated:YES completion:nil];
};



@end
