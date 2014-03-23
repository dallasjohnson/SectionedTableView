//
//  Item.m
//  SectionedTableView
//
//  Created by Dallas Johnson on 21/03/2014.
//  Copyright (c) 2014 DallasJohnson. All rights reserved.
//

#import "Item.h"

@implementation Item

+(Item*)withTitle:(NSString*)title groupTitle:(NSString*)groupTitle {
  Item *item = [Item new];
  if (item) {
    item.itemTitle = title;
    item.groupTitle = groupTitle;
  }
  return item;
}


-(NSString *)description {
  return [NSString stringWithFormat:@"%@",self.itemTitle];
}

@end
