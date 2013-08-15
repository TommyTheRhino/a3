//
//  SetGameViewController.m
//  Mathcismod
//
//  Created by Tommy Benshaul on 8/1/13.
//  Copyright (c) 2013 Tommy Benshaul. All rights reserved.
//

#import "SetGameViewController.h"
#import "SetCardDeck.h"
#import "CardMatchingGame.h"
#import "SetCard.h"
#import "GameREsult.h"

@interface SetGameViewController () <UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *gameLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLable;
@property (strong,nonatomic) CardMatchingGame *game;
@property (strong,nonatomic) Card *lastCardFlipt;
@property (weak, nonatomic) IBOutlet UILabel *flipLable;
@property (nonatomic) int flipCounter;
@property (strong,nonatomic) GameREsult *gameresult;
@property (weak, nonatomic) IBOutlet UICollectionView *cardCollectionView;

@end

@implementation SetGameViewController

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView  {
    return 1;
}

-(CardMatchingGame *) game {
    if (!_game) {
        
        _game = [[CardMatchingGame alloc]initWithCardCount:self.startingCardCount
                                                 usingDeck:[[SetCardDeck alloc]init]];
    }
    _game.gameMode = 3;
    return _game;
}




-(void) updateUI {
    for(UIButton *cardbutton in self.cardButtons) {
        cardbutton.hidden = NO;
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject: cardbutton]];
        SetCard *setCard = nil;
        if ([card isKindOfClass:[SetCard class]]) {
         setCard = (SetCard *) card;
        }
        [cardbutton setAttributedTitle:[self attributedContent:setCard] forState:UIControlStateNormal];
        [cardbutton setAttributedTitle:[self attributedContent:setCard] forState:UIControlStateSelected | UIControlStateDisabled];
        cardbutton.selected = card.isFaceUP;
        cardbutton.enabled = !card.isUnplayable;
        if (card.isFaceUP) {
            cardbutton.backgroundColor = [UIColor grayColor];
        } else {
            cardbutton.backgroundColor = [UIColor whiteColor];

        }
        if(card.isUnplayable)
            cardbutton.hidden = YES;
        
    }
    [self updateGameLabl];
    self.scoreLable.text = [NSString stringWithFormat:@"Score: %d",self.game.score];
    
}

- (IBAction)flipCard:(UIButton *)sender {
    int INDEX = 0;
 
    self.flipCounter++;
    self.flipLable.text = [[NSString alloc] initWithFormat:@"Flips: %d",self.flipCounter];
    self.lastCardFlipt =  [self.game cardAtIndex:[self.cardButtons indexOfObject:sender]];
    [self.game flipCaedAtIndex:[self.cardButtons indexOfObject:sender]];
        [self updateUI];
    self.gameresult.whatGAmeIsIt = @"SET";
    self.gameresult.score = self.game.score;
    
      
        self.gameLabel.text = @"you need to presse the Set button";
}
- (IBAction)deal:(id)sender {
    self.flipLable.text = @"Flips: ";
    self.flipCounter =0;
    self.game = nil;
    self.scoreLable.text = @"score:";
    self.gameLabel.text = @"new game";
    [self updateUI];
    self.setButtomIsPressed = NO;
}
- (IBAction)setButton:(id)sender {
    self.gameLabel.text = @"you can play now";

    self.setButtomIsPressed = YES;
}

-(void) updateGameLabl {
    NSMutableAttributedString *towrite = [[NSMutableAttributedString alloc ] init];
    if (self.game.checkIfCardMatchArry == nil) {
        return;
    }
    if (self.game.checkIfCardMatchArry.count != 3) {
         towrite = [[NSMutableAttributedString alloc] initWithString:@" flip up "];
        [towrite appendAttributedString: [self attributedContent:self.lastCardFlipt]];
    } else {
        for (int i = 0 ; i < self.game.checkIfCardMatchArry.count ; i++ ) {
            SetCard *setCard = self.game.checkIfCardMatchArry[i];
            [towrite appendAttributedString:[self attributedContent:setCard]];
            if (i != self.game.checkIfCardMatchArry.count -1 ) {
                [towrite appendAttributedString:[[NSAttributedString alloc] initWithString:@" and "]];
            }
        }
        SetCard *radomSetCard = self.game.checkIfCardMatchArry[0];
        [ self.game.checkIfCardMatchArry removeObject: radomSetCard];
       int match = [radomSetCard match:self.game.checkIfCardMatchArry];
        if  (match > 0) {
            [towrite appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n match for"]];
        } else {
            [towrite appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n dont match for"]];
   
        }
    };
    NSString *tempString = [[NSString alloc] initWithFormat: @" %d points",self.game.score - self.game.scoreBeforFlip];
    [towrite appendAttributedString:[[NSAttributedString alloc] initWithString:tempString]] ;
    self.gameLabel.attributedText = towrite;
    }

- (NSAttributedString *) attributedContent : (Card *) card {
    SetCard *setCard = (SetCard *) card;
    NSString *simbolString = @"" ;
    NSDictionary *maindic = @{@"green" :[UIColor greenColor] , @"red" : [UIColor redColor] , @"blue" :[UIColor blueColor]};
    UIColor *color = [maindic valueForKey:setCard.color];
    UIColor *colorWithShading = [color colorWithAlphaComponent:[setCard.shading floatValue]];
    
    NSDictionary *atrtributs = @{NSForegroundColorAttributeName :  colorWithShading ,NSStrokeColorAttributeName : color , NSStrokeWidthAttributeName: @-5 , NSFontAttributeName : [UIFont systemFontOfSize: 17]  };
    
    for (int i =0; i < [setCard.number unsignedIntValue]; i ++) {
        simbolString =  [simbolString stringByAppendingString:setCard.simbol];
    }

    NSAttributedString *result = [[NSAttributedString alloc] initWithString:simbolString attributes:atrtributs ];
    return result;
}




@end
