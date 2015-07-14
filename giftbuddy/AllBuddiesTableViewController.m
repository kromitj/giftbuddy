//
//  AllBuddiesTableViewController.m
//  giftbuddy
//
//  Created by Administrator on 6/28/15.
//  Copyright (c) 2015 Administrator. All rights reserved.
//

#import "AllBuddiesTableViewController.h"
#import "Buddy.h"
#import "AddBuddyTableViewController.h"
#import "BuddyInfoTableViewController.h"

@interface AllBuddiesTableViewController ()

@end

@implementation AllBuddiesTableViewController

@synthesize allBuddies;
@synthesize isInitialOpeningOfApp =  _isInitialOpeningOfApp;


- (void)viewDidLoad {
   
    
    
    [super viewDidLoad];
    
    self.allBuddies = [[NSMutableArray alloc] init];
    [self presentDeleteTipAlert];
    [self loadBuddies];
    
};

- (void) viewWillAppear:(BOOL)animated  {
    [super viewWillAppear:animated];
    // add a function that alphabetizes the buddies
    [allBuddies sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    [self saveBuddies];
    [self.tableView reloadData];
};

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.+
};

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"AddBuddySegue"]) {
        UINavigationController *navCon = segue.destinationViewController;
        AddBuddyTableViewController *goToAddBuddyTVC = [navCon.viewControllers objectAtIndex:0];
        goToAddBuddyTVC.allBuddiesTVC = self;
    } else if ([segue.identifier isEqualToString:@"BuddyInfoSegue"]) {
        BuddyInfoTableViewController *goToBuddyInfoTVC = segue.destinationViewController;
        goToBuddyInfoTVC.selectedBuddy = [self.allBuddies   objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    };
};

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
};

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allBuddies.count;
};


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    Buddy *currentBuddy = [self.allBuddies objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BuddyCell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSMutableString *fullName = [NSMutableString stringWithString:[currentBuddy firstName]];
    [fullName appendString:@" "];
    [fullName appendString:[currentBuddy lastName]];
    cell.textLabel.text = fullName;
    
    return cell;
};


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.allBuddies removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [self saveBuddies];
    };
};

-(void) presentDeleteTipAlert {
    self.isInitialOpeningOfApp = true;
    if (self.isInitialOpeningOfApp) {
        UIAlertController *swipToDeleteAlert = [UIAlertController alertControllerWithTitle:@"Tip"
                                                                                   message:@"Swip Buddy Entries to the Left to Delete"
                                                                            preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        [swipToDeleteAlert addAction:defaultAction];
        [self presentViewController:swipToDeleteAlert animated:YES completion:nil];
    };
};

-(NSURL *)getURL {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSURL *homeDir = [fileManager URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:true error:nil];
    NSURL *fileURL = [homeDir URLByAppendingPathComponent:@"saved_buddies.plist"];
    return fileURL;
};

-(void) saveBuddies {
    NSURL *fileURL = [self getURL];
    [NSKeyedArchiver archiveRootObject:allBuddies toFile:fileURL.path];
};

-(void) loadBuddies {
    NSURL *fileURL = [self getURL];
    if ([[NSFileManager defaultManager] fileExistsAtPath:fileURL.path]) {
        NSArray *content = [NSKeyedUnarchiver unarchiveObjectWithFile:fileURL.path];
        [allBuddies addObjectsFromArray:content];
    } else {
        Buddy *sampleBuddy = [[Buddy alloc] initWithFirstName:@"Mitch" andLastName:@"Kroska" andshirtSize:@"Medium" andShirtFit:@"Regular" andPantsSize:@"29X30" andPantsFit:@"Slim BootCut"];
        [allBuddies addObject:sampleBuddy];
        [self saveBuddies];
        self.IsInitialOpeningOfApp = false;
    };
};

@end
