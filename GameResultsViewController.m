//
//  GameResultsViewController.m
//  Mathcismod
//
//  Created by Tommy Benshaul on 8/12/13.
//  Copyright (c) 2013 Tommy Benshaul. All rights reserved.
//

#import "GameResultsViewController.h"
#import "GameREsult.h"

@interface GameResultsViewController ()
@property (nonatomic) int cardGameCount;
@property (nonatomic) int setGameCount;

@end

@implementation GameResultsViewController

- (void ) viewDidAppear:(BOOL)animated  {
    [super viewWillAppear:animated ];
    [self apdateUI];
}

-(void) apdateUI {
    NSString *displayText = @"";
    for (GameREsult *result in [GameREsult allGameResult]) {        
       
         if ([result.whatGAmeIsIt isEqualToString:@"CARD" ])  {
            displayText = [displayText stringByAppendingFormat:@"%d) Score: %d\n(%@ , %0g)\n\n",self.cardGameCount, result.score , result.end, round(result.duration)];
        self.CardGameText.text = displayText;
        self.cardGameCount ++;
        } else {
            displayText = [displayText stringByAppendingFormat:@"%d) Score: %d\n(%@ , %0g)\n\n",self.setGameCount, result.score , result.end, round(result.duration)];
            self.SetGameText.text = displayText;
            self.setGameCount ++;
        }
    }
    
}



@end
