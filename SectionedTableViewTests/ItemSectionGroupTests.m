//
//  SectionedTableViewTests.m
//
//  Created by Dallas Johnson on 21/03/2014.
//  Copyright (c) 2014 DallasJohnson. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ItemSectionGroup.h"
#import "Item.h"

@interface ItemSectionGroupTests : XCTestCase
@property (atomic) NSArray *originalGroupedArray;
@property (atomic) NSArray *addedItems;
@end

@implementation ItemSectionGroupTests
static NSString *GROUP1KEY = @"group 1";
static NSString *GROUP2KEY = @"group 2";
static NSString *GROUP3KEY = @"group 3";
static NSString *GROUP4KEY = @"group 4";

- (void)setUp
{
  [super setUp];
  self.originalGroupedArray = @[
                                [ItemSectionGroup groupWithKey:GROUP1KEY items:@[
                                                                                 [Item withTitle:@"pre 1" groupTitle:GROUP1KEY],
                                                                                 [Item withTitle:@"pre 2" groupTitle:GROUP2KEY]
                                                                                 ]],
                                [ItemSectionGroup groupWithKey:GROUP2KEY items:@[
                                                                                 [Item withTitle:@"pre 3" groupTitle:GROUP1KEY]
                                                                                 ]]
                                ];

  self.addedItems = @[
                      [Item withTitle:@"item 1" groupTitle:GROUP1KEY],
                      [Item withTitle:@"item 2" groupTitle:GROUP1KEY],
                      [Item withTitle:@"item 3" groupTitle:GROUP3KEY],
                      [Item withTitle:@"item 4" groupTitle:GROUP3KEY],
                      [Item withTitle:@"item 5" groupTitle:GROUP3KEY]

                      ];
}

-(void)testAddItemToTestGroup{
  ItemSectionGroup *newGroup = [ItemSectionGroup groupWithKey:@"Key" items:@[]];
  XCTAssertNotNil(newGroup, @"Shoould create Item groups.");

  int itemsCount =[[(ItemSectionGroup*)self.originalGroupedArray[0] items] count];
  XCTAssertEqual(itemsCount, 2, @"should create an array of group items");
}

- (void)testAddAndGroupItemsToExistingSourceArray{

  NSArray *newGroupedArray = [ItemSectionGroup addAndGroupItems:self.addedItems toArray:self.originalGroupedArray ascending:YES];

  XCTAssertNotNil(newGroupedArray, @"Returned value should not be nil.");

  int firstGroupCount = [[newGroupedArray[0] items] count];

  XCTAssertEqual(firstGroupCount, 4, @"Should add items to existing section.");
  XCTAssertEqual(newGroupedArray.count, 3, @"Should create new section for added items.");
}

@end
