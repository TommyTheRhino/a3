//
//  Deck.h
//  Mathcismod
//
//  Created by Tommy Benshaul on 7/23/13.
//  Copyright (c) 2013 Tommy Benshaul. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Deck : NSObject
- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (Card *)drawRandomCard;
-(NSString *) getCardFromDeck2 ;
@end