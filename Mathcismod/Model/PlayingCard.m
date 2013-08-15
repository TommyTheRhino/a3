//
//  PlayingCard.m
//  Mathcismod
//
//  Created by Tommy Benshaul on 7/23/13.
//  Copyright (c) 2013 Tommy Benshaul. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (int)match:(NSArray *) otherCards {
    int score = 0;
    if (otherCards.count ==1) {
        PlayingCard *otherCard = [otherCards lastObject];
        if([otherCard.suit isEqualToString:self.suit] ) {
            score = 1;
        } else if (otherCard.rank == self.rank) {
            score = 4;
        }
    }else if (otherCards.count == 2) {
        PlayingCard *otherCard1 = [otherCards objectAtIndex:0];
        PlayingCard *otherCard2 = [otherCards objectAtIndex:1];
        if (otherCard1.suit == otherCard2.suit) {
            score++;
        }if (self.suit == otherCard1.suit) {
            score ++;
        } if (self.suit == otherCard2.suit) {
            score ++;
        }
        if (otherCard1.rank == otherCard2.rank) {
            score += 2;
        }if (self.rank == otherCard1.rank) {
            score += 2;
        } if (self.rank == otherCard2.rank) {
            score += 2;
        }
    }
    return score;
}

-(NSString *) contents {
    NSArray *rankStrings = @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

+ (NSArray *)validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

-(void) setSuit:(NSString *) suit {
    if ([@[@"♥",@"♦",@"♠",@"♣"] containsObject:suit]) {
        _suit = suit;
    }
}
- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *) rankString {
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank {
    return [self rankString].count-1;
}
- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}


@end
