//
//  GameREsult.h
//  Mathcismod
//
//  Created by Tommy Benshaul on 8/13/13.
//  Copyright (c) 2013 Tommy Benshaul. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameREsult : NSObject
@property (readonly,nonatomic ) NSDate *start;
@property (readonly,nonatomic) NSDate *end;
@property (nonatomic) int score;
@property (nonatomic) NSString *whatGAmeIsIt;
@property (readonly,nonatomic) NSTimeInterval duration;

+ (NSArray *) allGameResult;
@end
 