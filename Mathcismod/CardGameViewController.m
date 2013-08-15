 //
//  CardGameViewController.m
//  Mathcismod
//
//  Created by Tommy Benshaul on 7/23/13.
//  Copyright (c) 2013 Tommy Benshaul. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "PlayingCard.h"
#import "GameREsult.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLibale;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *lableMatch;
@property (nonatomic) int flipCount ;
@property (nonatomic) int gameMode;
@property (strong,nonatomic) PlayingCardDeck *mydeck; 
@property (weak, nonatomic) IBOutlet UILabel *scoreLable;
@property (weak, nonatomic) IBOutlet UISwitch *seitchButtom;
@property (strong,nonatomic) CardMatchingGame *game;
@property (strong,nonatomic) GameREsult *gameresult;
@end

@implementation CardGameViewController

-( GameREsult *) gameresult {
    if(!_gameresult) {
        _gameresult = [[GameREsult alloc] init];
    }
    return _gameresult;
}
-(CardMatchingGame *) game {
    if (!_game) {
       
        _game = [[CardMatchingGame alloc]initWithCardCount:self.cardButtons.count usingDeck:[[PlayingCardDeck alloc]init]];
    }
    return _game;
}


-(void) setCardButtons: (NSArray *)cardButtons {
    _cardButtons = cardButtons;
    [self updateUI];
}

-(void) updateUI {
    for(UIButton *cardbutton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject: cardbutton]];
        [cardbutton setTitle:card.contents forState:UIControlStateSelected ];
        [cardbutton setTitle:card.contents forState:UIControlStateSelected | UIControlStateDisabled];
        cardbutton.selected = card.isFaceUP;
        cardbutton.enabled = !card.isUnplayable;
        if(card.isUnplayable)
            cardbutton.alpha = 0.3;
       
    }
    self.scoreLable.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
    self.lableMatch.text = self.game.result;
    if (self.game.firstFlipHpend == YES) {
       self.seitchButtom.alpha = 0.3;
        [self.seitchButtom setUserInteractionEnabled:NO];
    }
    
}







- (IBAction)flipCard:(UIButton *)sender
{
    [self.game flipCaedAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
    self.gameresult.whatGAmeIsIt = @"CARD";
    self.gameresult.score = self.game.score;
}


- (IBAction)switchGameMode:(UISwitch *)sender {
    if(sender.isOn) {
        self.game.gameMode = 2;
    } else {
        self.game.gameMode = 3;
    }
    
}



- (IBAction)deal:(UIButton *)sender {
    [self.seitchButtom setUserInteractionEnabled:YES];
    self.seitchButtom.alpha = 1;
    self.gameresult =nil;
    self.game = nil;
     for(UIButton *cardbutton in self.cardButtons) {
          cardbutton.alpha = 1.0;
     }
    self.lableMatch.text = @" ";
    [self updateUI];
    
}


@end
