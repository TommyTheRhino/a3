//
//  Card.m
//  Mathcismod
//
//  Created by Tommy Benshaul on 7/23/13.
//  Copyright (c) 2013 Tommy Benshaul. All rights reserved.
//

#import "Card.h"

@implementation Card
-(int)match:(NSArray *)otherCards {
    int score = 0;
    for (Card *card in otherCards ) {
        if ([card.contents isEqualToString: self.contents]) {
            score = 1;
            
        }
    }
    return score;
}

@end
