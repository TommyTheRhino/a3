//
//  SetCardDeck.m
//  Mathcismod
//
//  Created by Tommy Benshaul on 8/1/13.
//  Copyright (c) 2013 Tommy Benshaul. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck
- (id)init {
    self = [super init];
    if (self) {
        for (NSString *simbol in [SetCard validSimbol]) {
            for (int number = 1; number <=3 ; number ++) {
                for (NSString *color in [SetCard validColor]) {
                    for(CGFloat alpha = 0 ; alpha <= 1.0 ; alpha = alpha + 0.5) {
                        SetCard *card = [[SetCard alloc] init];
                        card.simbol = simbol;
                        card.number = [[NSNumber alloc] initWithInt:number];
                        card.color = color;
                        card.shading =  [[NSDecimalNumber alloc]initWithFloat:alpha];
                        [self addCard:card atTop:YES];

                    }
                }
         
            }
        }
    }
    return self;
}
@end
