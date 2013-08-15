//
//  Deck.m
//  Mathcismod
//
//  Created by Tommy Benshaul on 7/23/13.
//  Copyright (c) 2013 Tommy Benshaul. All rights reserved.
//

#import "Deck.h"
#import "PlayingCard.h"
@interface Deck()
@property (strong , nonatomic) NSMutableArray *cards;
@end

@implementation Deck

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (Card *)drawRandomCard
{
    Card *randomCard = nil;
    if (self.cards.count) {
        unsigned index = arc4random() % self.cards.count;
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}
-(NSString *) getCardFromDeck2 {
    NSString *string;
   PlayingCard  *firstCard = nil;
    if(self.cards.count) {
        firstCard = self.cards[0];
        string = [NSString stringWithFormat:@"%i"@"%@",firstCard.rank,firstCard.suit];
        [self.cards removeObjectAtIndex:0];
    }
    return string;
}

@end
