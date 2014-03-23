//
//  SectionedTableViewController.m
//  SectionedTableView
//
//  Created by Dallas Johnson on 21/03/2014.
//  Copyright (c) 2014 DallasJohnson. All rights reserved.
//

#import "SectionedTableViewController.h"
#import "Item.h"
#import "ItemSectionGroup.h"

@interface SectionedTableViewController ()
@property (nonatomic) NSArray *items;
@end

@implementation SectionedTableViewController

static NSString *CellIdentifier = @"CellIdentifer";

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self populateSource];

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
  return [self.items count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return [[self.items[section] items] count];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  ItemSectionGroup * groupObject = [self.items objectAtIndex:section];
  return [NSString stringWithFormat:@"All Items for group : %@", groupObject.groupTitle];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

  ItemSectionGroup * groupObject = [self.items objectAtIndex:indexPath.section];
  Item *item = groupObject.items[indexPath.row];
  cell.textLabel.text = item.itemTitle;

  return cell;
}

#pragma mark - Data source sorting and filtering

-(void)populateSource {
  self.items = @[];
  NSArray *addedArray = @[
                          [Item withTitle:@"item 1" groupTitle:@"group 1"],
                          [Item withTitle:@"item 2" groupTitle:@"group 2"],
                          [Item withTitle:@"item 3" groupTitle:@"group 3"],
                          [Item withTitle:@"item 4" groupTitle:@"group 3"],
                          [Item withTitle:@"item 5" groupTitle:@"group 3"],
                          [Item withTitle:@"item 1" groupTitle:@"group 3"],
                          [Item withTitle:@"item 2" groupTitle:@"group 3"],
                          [Item withTitle:@"item 3" groupTitle:@"group 3"],
                          [Item withTitle:@"item 4" groupTitle:@"group 1"],
                          [Item withTitle:@"item 5" groupTitle:@"group 1"],
                          ];
  
  self.items = [ItemSectionGroup addAndGroupItems:addedArray toArray:self.items ascending:YES];

}






@end
