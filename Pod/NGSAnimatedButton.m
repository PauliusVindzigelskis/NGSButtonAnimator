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

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupAnimator];
    } return self;
}

-(void)setPrimaryColor:(UIColor *)primaryColor
{
    _primaryColor = primaryColor;
    [self updateAnimator];
}

-(void)setSecondaryColor:(UIColor *)secondaryColor
{
    _secondaryColor = secondaryColor;
    [self updateAnimator];
}

- (void) updateAnimator
{
    [self.animator updateColorsWithPrimaryColor:self.primaryColor secondaryColor:self.secondaryColor];
}

- (void) setupAnimator
{
    _primaryColor = _primaryColor ? : [UIColor blackColor];
    _secondaryColor = _secondaryColor ? : [UIColor whiteColor];
    
    self.animator = [[NGSButtonAnimator alloc] initWithButton:self
                                                 primaryColor:_primaryColor
                                               secondaryColor:_secondaryColor];
    [self.animator setHighlighted:self.isHighlighted];
    
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
