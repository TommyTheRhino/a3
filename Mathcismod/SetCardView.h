//
//  SetCardView.h
//  SuperSetCard
//
//  Created by Tommy Benshaul on 8/13/13.
//  Copyright (c) 2013 Tommy Benshaul. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SetCardView : UIView

@property (nonatomic) NSInteger numberOfShips;
@property (strong, nonatomic) NSString *simbol;
@property (strong, nonatomic) NSString *color;
@property (strong   ,nonatomic) NSNumber *shading;

@property (nonatomic) bool faceUp;



@end
