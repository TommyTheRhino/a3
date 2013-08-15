//
//  Card.h
//  Mathcismod
//
//  Created by Tommy Benshaul on 7/23/13.
//  Copyright (c) 2013 Tommy Benshaul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (strong,nonatomic) NSString *contents;
@property  (nonatomic, getter = isFaceUP) BOOL faceUp;
@property  (nonatomic, getter = isUnplayable) BOOL Unplayable;
-(int)match :(NSArray *) otherCards;
@end
