//
//  SetCardView.m
//  SuperSetCard
//
//  Created by Tommy Benshaul on 8/13/13.
//  Copyright (c) 2013 Tommy Benshaul. All rights reserved.
//

#import "SetCardView.h"

@implementation SetCardView

#pragma mark - initialization
#define TURN_DAGRE 12.0

-(void)setColor:(NSString *)color {
    _color = color;
    [self setNeedsDisplay];
}

-(void)setShading:(NSDecimalNumber *)shading {
    _shading = shading;
    [self setNeedsDisplay];

}

-(void)setNumberOfShips:(NSInteger)numberOfShips {
    _numberOfShips = numberOfShips;
    [self setNeedsDisplay];

}

-(void)setSimbol:(NSString *)simbol {
    _simbol = simbol;
    [self setNeedsDisplay];

}

-(void)setFaceUp:(bool)faceUp {
    _faceUp = faceUp;
    [self setNeedsDisplay];

}

-(void)setup {
    
}

-(void) awakeFromNib {
    [self setup];
}

-(id)initWithFrame:(CGRect)frame {
    self =[super initWithFrame:frame];
    [self setup];
    return self;
}



- (void)drawRect:(CGRect)rect
{
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:TURN_DAGRE ];
    
    [roundedRect addClip];
    
    if(self.faceUp == YES   ) {
        [[UIColor grayColor] setFill];
        UIRectFill(self.bounds);
    } else {
        [[UIColor whiteColor] setFill];
        UIRectFill(self.bounds);
    }
    
    [[UIColor blackColor] setStroke];
    [roundedRect stroke];
    

    [self drawShip];
}

-(void)drawShip {
    
    NSDictionary *maindic = @{@"green" :[UIColor greenColor] , @"red" : [UIColor redColor] , @"blue" :[UIColor blueColor]};
    UIColor *needColor = [maindic valueForKey:self.color];
    UIColor *colorWithShading = [needColor colorWithAlphaComponent:[self.shading floatValue]];
    float constAdd = (self.bounds.size.width)/4 ;
    float maxHeight = self.bounds.size.height;
    
    if ([self.simbol isEqualToString:@"rhombus"] ) {
        if (self.numberOfShips == 1) {
            [self DrawRhombus:needColor :colorWithShading :(float) (self.bounds.size.width )/2];
        } else if (self.numberOfShips == 2) {
            [self DrawRhombus:needColor :colorWithShading :(float) (constAdd +10 )];
            [self DrawRhombus:needColor :colorWithShading :(float) maxHeight - (constAdd+10)];

        }else if (self.numberOfShips == 3) {
            [self DrawRhombus:needColor :colorWithShading :(float) (constAdd  )];
            [self DrawRhombus:needColor :colorWithShading :(float) maxHeight/2];
            [self DrawRhombus:needColor :colorWithShading :(float) maxHeight - (constAdd)];
        }
    }else if ([self.simbol isEqualToString:@"ellipse"]) {
        if (self.numberOfShips == 1) {
            [self DrawEllipse:needColor :colorWithShading :(float) (self.bounds.size.width )/2];
        } else if (self.numberOfShips == 2) {
            [self DrawEllipse:needColor :colorWithShading :(float) (constAdd +10 )];
            [self DrawEllipse:needColor :colorWithShading :(float) maxHeight - (constAdd+10)];
            
        }else if (self.numberOfShips == 3) {
            [self DrawEllipse:needColor :colorWithShading :(float) (constAdd  )];
            [self DrawEllipse:needColor :colorWithShading :(float) maxHeight/2];
            [self DrawEllipse:needColor :colorWithShading :(float) maxHeight - (constAdd)];
        }
    }else if ([self.simbol isEqualToString:@"wave"]) {
        if (self.numberOfShips == 1) {
            [self DrawWave:needColor :colorWithShading :(float) (self.bounds.size.width )/2];
        } else if (self.numberOfShips == 2) {
            [self DrawWave:needColor :colorWithShading :(float) (constAdd +10 )];
            [self DrawWave:needColor :colorWithShading :(float) maxHeight - (constAdd+10)];
            
        }else if (self.numberOfShips == 3) {
            [self DrawWave:needColor :colorWithShading :(float) (constAdd  )];
            [self DrawWave:needColor :colorWithShading :(float) maxHeight/2];
            [self DrawWave:needColor :colorWithShading :(float) maxHeight - (constAdd)];
        }
    }

 
}

-(void) DrawRhombus : (UIColor *)needColor  : (UIColor *)colorWithShading :(float )startPointY{
    
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    
    // Set the starting point of the shape.
    float constAdd = (self.bounds.size.width)/4 ;
    float startDrowingPointX = (self.bounds.size.width)/2- constAdd;
    float startDrowingPointY = startPointY;
    [aPath moveToPoint:CGPointMake(startDrowingPointX, startDrowingPointY)];
    
    // Draw the lines.
    [aPath addLineToPoint:CGPointMake(startDrowingPointX + constAdd, startDrowingPointY + constAdd/2)];
    [aPath addLineToPoint:CGPointMake(startDrowingPointX + 2*constAdd, startDrowingPointY)];
    [aPath addLineToPoint:CGPointMake(startDrowingPointX +constAdd, startDrowingPointY - constAdd/2)];
    [aPath closePath];
    
    [needColor setStroke];
    [colorWithShading setFill ];
    [aPath fill];
    [aPath stroke];
    //[self pushContent];
   // [self popContext];
}

-(void) DrawEllipse : (UIColor *)needColor  : (UIColor *)colorWithShading :(float )startPointY{
    
    float centerX = self.bounds.size.width /2;
    float constX = centerX / 3;
     UIBezierPath *aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(centerX / 3 + 10, startPointY)
                                                          radius:20
                                                      startAngle:1.57
                                                        endAngle:4.71
                                                       clockwise:YES];
    [aPath addLineToPoint:CGPointMake(centerX / 3 + 100, startPointY - 20)];
    [aPath addArcWithCenter: CGPointMake(centerX / 3 + 100, startPointY)
                                    radius:20
                                       startAngle:1.57
                                         endAngle:4.71
                                        clockwise:NO];
    [aPath addLineToPoint:CGPointMake(centerX / 3 + 100, startPointY +20)];
    [aPath closePath];
    [needColor setStroke];
    [colorWithShading setFill ];
    [aPath fill];
    [aPath stroke];
   // [self pushContent];
  //  [self popContext];
}

-(void) DrawWave : (UIColor *)needColor  : (UIColor *)colorWithShading :(float )startPointY{
    float centerX = self.bounds.size.width /2;
    float constX = centerX / 3;
    UIBezierPath *aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(centerX , startPointY)
                                                         radius:20
                                                     startAngle:1.57
                                                       endAngle:8
                                                      clockwise:YES];
    
    [aPath closePath];
    [needColor setStroke];
    [colorWithShading setFill ];
    [aPath fill];
    [aPath stroke];
    
}


-(void )pushContent {
    CGContextRef contex = UIGraphicsGetCurrentContext();
    CGContextSaveGState(contex);
    CGContextTranslateCTM(contex, (self.bounds.size.width)/2 , 0);
}

-(void) popContext {
    CGContextRestoreGState(UIGraphicsGetCurrentContext());
}

@end
