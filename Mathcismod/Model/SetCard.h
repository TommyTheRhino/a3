//
//  .h
//  Mathcismod
//
//  Created by Tommy Benshaul on 8/1/13.
//  Copyright (c) 2013 Tommy Benshaul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface SetCard : Card
@property (strong, nonatomic) NSString *simbol;
@property (strong, nonatomic) NSString *color;
@property  (strong , nonatomic) NSNumber *number;
@property (strong   ,nonatomic) NSDecimalNumber *shading;

+ (NSArray *)validSimbol;
+ (NSArray *)validColor;
+ (NSArray *)validshading;


@end
