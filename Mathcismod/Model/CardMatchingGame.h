//
//  CardMatchingGame.h
//  Mathcismod
//
//  Created by Tommy Benshaul on 7/28/13.
//  Copyright (c) 2013 Tommy Benshaul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"


@interface CardMatchingGame : NSObject

- (id)initWithCardCount : (NSUInteger) cardCount
              usingDeck :(Deck *)deck  ;

- (void)flipCaedAtIndex : (NSUInteger) index;

- (Card *)cardAtIndex : (NSUInteger) index;

@property (nonatomic, readonly)int score;
@property (nonatomic,readonly) NSString *result;
@property (nonatomic) int gameMode;
@property (readonly, getter = firstFlipHpend) BOOL firstFlipHpend;
@property (strong,nonatomic) NSMutableArray *checkIfCardMatchArry;
@property (nonatomic , readonly) int scoreBeforFlip;


@end
