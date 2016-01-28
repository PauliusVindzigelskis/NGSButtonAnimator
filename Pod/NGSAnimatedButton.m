//
//  LBButton.m
//  Lendbook
//
//  Created by Paulius Vindzigelskis on 2015-12-14.
//  Copyright © 2015 Paulius Vindzigelskis. All rights reserved.
//

#import "NGSAnimatedButton.h"

@interface NGSAnimatedButton()

@property (nonatomic, strong) NGSButtonAnimator *animator;

@end



@implementation NGSAnimatedButton

-(instancetype)initWithPrimaryColor:(UIColor *)primColor secondaryColor:(UIColor *)secColor
{
    if (self = [super init])
    {
        _primaryColor = primColor;
        _secondaryColor = secColor;
        [self setupAnimator];
    } return self;
}

-(instancetype)init
{
    return [self initWithPrimaryColor:nil secondaryColor:nil];
}

-(void)setPrimaryColor:(UIColor *)primaryColor
{
    _primaryColor = primaryColor;
    [self setupAnimator];
}

-(void)setSecondaryColor:(UIColor *)secondaryColor
{
    _secondaryColor = secondaryColor;
    [self setupAnimator];
}

- (void) setupAnimator
{
    UIColor *firstColor = self.primaryColor ? : [UIColor blackColor];
    UIColor *secondColor = self.secondaryColor ? : [UIColor whiteColor];
    
    if (!self.animator)
    {
        self.animator = [[NGSButtonAnimator alloc] initWithButton:self primaryColor:firstColor secondaryColor:secondColor];
        [self.animator setHighlighted:self.isHighlighted];
    } else {
        [self.animator updateColorsWithPrimaryColor:firstColor secondaryColor:secondColor];
    }
    
    [self setNeedsDisplay];
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    [self setupAnimator];
}

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    [self.animator updateView];
    
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [self.animator setHighlighted:highlighted];
}

@end
