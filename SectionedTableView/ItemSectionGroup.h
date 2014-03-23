//
//  ItemSectionGroup.h
//  SectionedTableView
//
//  Created by Dallas Johnson on 21/03/2014.
//  Copyright (c) 2014 DallasJohnson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemSectionGroup : NSObject
@property (nonatomic,strong) NSString * groupTitle;
@property (nonatomic,strong) NSArray *items;


+(ItemSectionGroup *)groupWithKey:(NSString *)groupTitle items:(NSArray *)items;
+(NSArray*)addAndGroupItems:(NSArray*)items toArray:(NSArray*)sourceArray ascending:(BOOL)ascending;

@end
