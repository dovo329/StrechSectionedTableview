//
//  ViewController.m
//  StretchSectionedTableview
//
//  Created by Douglas Voss on 6/2/15.
//  Copyright (c) 2015 DougsApps. All rights reserved.
//
/* create a sectioned tablview to display contacts.  Group these contacts by the first letter of their first name.*/

#import "ViewController.h"
#import "Contact.h"
#import "ContactController.h"

NSString *kContactCellId = @"contact.cell.id";

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    //NSLog(@"sorted contacts: %@", [ContactController sortedContacts]);
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kContactCellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kContactCellId];
    }
    //NSArray *contactArr = [ContactController contacts];
    //Contact *contact = contactArr[indexPath.row];
    NSDictionary *dict = [ContactController sortedContacts];
    NSArray *allKeysArr = [dict allKeys];
    NSArray *contactArr = [dict objectForKey:allKeysArr[indexPath.section]];
    Contact *contact = contactArr[indexPath.row];
    cell.textLabel.text = contact.firstName;
    cell.detailTextLabel.text = contact.lastName;
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    NSDictionary *dict = [ContactController sortedContacts];
    return [[dict allKeys] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDictionary *dict = [ContactController sortedContacts];
    NSArray *allKeysArr = [dict allKeys];
    NSArray *rowArrForSection = [dict objectForKey:allKeysArr[section]];
    return [rowArrForSection count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary *dict = [ContactController sortedContacts];
    NSArray *allKeysArr = [dict allKeys];
    return allKeysArr[section];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
