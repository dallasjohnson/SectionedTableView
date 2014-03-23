//
//  Item.h
//  SectionedTableView
//
//  Created by Dallas Johnson on 21/03/2014.
//  Copyright (c) 2014 DallasJohnson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
@property (nonatomic,strong) NSString *itemTitle;
@property (nonatomic,strong) NSString * groupTitle;

+(Item*)withTitle:(NSString*)title groupTitle:(NSString*)groupTitle;

@end
