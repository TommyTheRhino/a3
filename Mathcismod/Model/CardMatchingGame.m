//
//  CardMatchingGame.m
//  Mathcismod
//
//  Created by Tommy Benshaul on 7/28/13.
//  Copyright (c) 2013 Tommy Benshaul. All rights reserved.
//

#import "CardMatchingGame.h"
#import "PlayingCard.h"
@interface CardMatchingGame()
@property (strong,nonatomic) NSMutableArray *cards;
@property (nonatomic) int score;
@property  (nonatomic)  NSString *result;
@property (nonatomic, getter = firstFlipHpend) BOOL firstFlipHpend;
@property (nonatomic) int scoreBeforFlip;

@end

@implementation CardMatchingGame

- (id) initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck {
    
    self = [super init];
    if (self) {
        self.gameMode = 2;
        self.firstFlipHpend = NO;
        for (int i=0; i < cardCount ;i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            }else {
                self.cards[i] = card;
            }
          
        }
        
    }
    return self;
}

- (NSMutableArray *)cards {
    if (!_cards)
        _cards = [[NSMutableArray alloc] init];
    return _cards;
    
}

- (Card *)cardAtIndex:(NSUInteger)index {
    if (index <self.cards.count)
        return self.cards[index];
    else
        return nil;
}

#define MATCH_BONUS 4;
#define MISMATCH_PENLTY 2;
#define FLIP_COST 1;


- (void)flipCaedAtIndex:(NSUInteger)index {
    self.firstFlipHpend = YES;
    self.scoreBeforFlip = self.score;
    NSMutableArray *othercardsArry = [[NSMutableArray alloc]init];
    NSMutableArray *otherCardString = [[NSMutableArray alloc]init];
    Card *card = [self cardAtIndex:index];
    self.checkIfCardMatchArry = [[NSMutableArray alloc] init];
    [self.checkIfCardMatchArry addObject:card];
    self.result = nil;
    if (!card.isUnplayable) {
        if(!card.isFaceUP) {
            for (Card *otherCard in self.cards) {
                if (otherCard.isFaceUP && !otherCard.isUnplayable) {
                    [othercardsArry addObject:otherCard];
                    if ([otherCard isKindOfClass: [PlayingCard class]]) {
                        [otherCardString addObject:otherCard.contents];
                    }
                }
            }
                    if (othercardsArry.count == self.gameMode -1 ) {
                        int matcScore = [card match: othercardsArry];
                        NSString *lableString = [otherCardString componentsJoinedByString:@" and "];
                        if(matcScore) {
                            for (Card *c in othercardsArry){
                                [self.checkIfCardMatchArry addObject:c];

                                c.Unplayable = YES;
                            }
                            card.Unplayable = YES;
                            self.result = [NSString stringWithFormat:@"%@ and %@ match for %d points",card.contents,lableString,matcScore];
                            self.score += matcScore * MATCH_BONUS;
                        } else {
                            for (Card *c in othercardsArry){
                                [self.checkIfCardMatchArry addObject:c];

                                c.Unplayable = NO;
                                c.faceUp = NO;
                            }
                            card.Unplayable = NO;
                            
                            self.score -= MISMATCH_PENLTY;
                            self.result = [NSString stringWithFormat:@"%@ and %@ dont match  2 points pently"
                                           ,card.contents,lableString     ];
                        }
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUP;
        if (self.result == nil) {
            self.result = [NSString stringWithFormat:@"flip up %@ ",card.contents];
        }
    }
}

@end
