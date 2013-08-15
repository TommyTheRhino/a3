//
//  SetCard.m
//  Mathcismod
//
//  Created by Tommy Benshaul on 8/1/13.
//  Copyright (c) 2013 Tommy Benshaul. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

- (int)match:(NSArray *) otherCards {
    int score = 0;
    if (otherCards.count ==2) {
        for (SetCard *set in otherCards) {
            score =10;
            if (self.number == set.number) {
                return 0;
            }
            if (self.shading == set.shading) {
                return 0;
            }
            if ([self.color isEqualToString: set.color]) {
               return 0;
            }
            if ([self.simbol isEqualToString: set.simbol]) {
                return 0;
            }
        }
    }
return score;
}

+ (NSArray *)validSimbol
{
    return @[@"▲",@"●",@"■"];
}

+ (NSArray *)validColor
{
    return @[@"green",@"red",@"blue"];
}

+ (NSArray *)validshading
{
    return @[@0.3,@0.7,@1.0];
}



@end
