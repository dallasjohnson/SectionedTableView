//
//  ItemSectionGroup.m
//  SectionedTableView
//
//  Created by Dallas Johnson on 21/03/2014.
//  Copyright (c) 2014 DallasJohnson. All rights reserved.
//

#import "ItemSectionGroup.h"
#import "Item.h"

@implementation ItemSectionGroup


+(ItemSectionGroup *)groupWithKey:(NSString *)groupTitle items:(NSArray *)items {
  ItemSectionGroup *group = [ItemSectionGroup new];
  if (group) {
    group.groupTitle = groupTitle;
    group.items = items;
  }
  return group;
}


+(NSArray*)addAndGroupItems:(NSArray*)items toArray:(NSArray*)sourceArray ascending:(BOOL)ascending{
  NSMutableArray *outputArray = sourceArray ? [sourceArray mutableCopy] : [NSMutableArray array];

  NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"groupTitle" ascending:ascending];
  NSMutableArray *sortedInputArray = [[items sortedArrayUsingDescriptors:@[sortDescriptor]] mutableCopy];

  NSString *sectionKey = nil;

  while (sortedInputArray.count) {

    sectionKey = [(Item*)sortedInputArray[0] groupTitle];

    NSPredicate *sectionPredicate = [NSPredicate predicateWithBlock:^BOOL(Item* item, NSDictionary *bindings) {
      return [item.groupTitle isEqualToString:sectionKey];
    }];

    NSArray *filteredArray = [sortedInputArray filteredArrayUsingPredicate:sectionPredicate];

    ItemSectionGroup *existingItemArray = [[outputArray filteredArrayUsingPredicate:sectionPredicate] lastObject];

    if (existingItemArray) {
      //If there are already some transactions for this date add them to that sub-array
      existingItemArray.items = [existingItemArray.items arrayByAddingObjectsFromArray:filteredArray];
    } else {
      //Otherwise create a new entry in the master transaction array
      [outputArray addObject:[ItemSectionGroup groupWithKey:sectionKey items:filteredArray]];
    }
    [sortedInputArray removeObjectsInArray:filteredArray];
  }
  return [outputArray sortedArrayUsingDescriptors:@[sortDescriptor]];
}

-(NSString *)description {
  return [NSString stringWithFormat:@"Group: %@ Containing Items:%@",self.groupTitle, self.items];
}

@end
