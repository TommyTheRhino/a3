//
//  GameREsult.m
//  Mathcismod
//
//  Created by Tommy Benshaul on 8/13/13.
//  Copyright (c) 2013 Tommy Benshaul. All rights reserved.
//

#import "GameREsult.h"

@interface GameREsult();
@property (readwrite,nonatomic ) NSDate *start;
@property (readwrite,nonatomic) NSDate *end;

@end
@implementation GameREsult

#define ALL_RESULTS_KEY @"GameResult_AllREsult"


#define START_KEY @"StartDate"
#define END_KEY @"EndDate"
#define SCORE_KEY @"Score"
#define GAME_TIP @"whatGame"
-(id) init
{
    self = [super init];
    if  (self) {
        _start = [NSDate date];
        _end = _start;
    }
    return self;
}

-(NSTimeInterval) duration
{
    return [self.end timeIntervalSinceDate:self.start];
}

-(void) setScore:(int)score {
    _score = score;
    self.end = [NSDate date];
    [self synchronize];
}

- (void) synchronize {
    NSMutableDictionary *mutableGameResultFromUserDefults = [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] mutableCopy];
    if(!mutableGameResultFromUserDefults) {
        mutableGameResultFromUserDefults   = [[NSMutableDictionary alloc]init];
    }
        mutableGameResultFromUserDefults[[self.start description]] = [self asPropertyList];
        [[NSUserDefaults standardUserDefaults] setObject:mutableGameResultFromUserDefults forKey:ALL_RESULTS_KEY];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
         
    
}

-(id)asPropertyList {
    return @{  START_KEY :self.start , END_KEY : self.end , SCORE_KEY : @(self.score) , GAME_TIP : self.whatGAmeIsIt};
}

+ (NSArray *)allGameResult {
    NSMutableArray *allGameResult =[[NSMutableArray alloc] init];
    for (id pList in [[[NSUserDefaults standardUserDefaults] dictionaryForKey:ALL_RESULTS_KEY] allValues] ){
        GameREsult *result = [[GameREsult alloc] initFromPropertyList:pList];
        [allGameResult addObject: result ];
    }
    return allGameResult;
         
}

-(id) initFromPropertyList :(id)pList {
    self = [self init];
    if (self) {
        if([pList isKindOfClass:[NSDictionary class] ]) {
            NSDictionary *resultDictionary = (NSDictionary *)pList;
            _start = resultDictionary [START_KEY];
            _end = resultDictionary [ END_KEY];
            _score = [resultDictionary [SCORE_KEY] intValue];
            _whatGAmeIsIt = resultDictionary [GAME_TIP];
            if(!_start || !_end)
                self = nil;
        }
    }
    return self;
}
@end
