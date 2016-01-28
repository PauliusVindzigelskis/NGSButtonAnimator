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

-(instancetype)init
{
    if (self = [super init])
    {
        [self setupAnimator];
    } return self;
}

- (void) setupAnimator
{
    UIColor *firstColor = _primaryColor ? : [UIColor blackColor];
    UIColor *secondColor = _secondaryColor ? : [UIColor whiteColor];
    
    _animator = [[NGSButtonAnimator alloc] initWithButton:self primaryColor:firstColor secondaryColor:secondColor];
    [_animator setHighlighted:self.isHighlighted];
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    if (!self.animator)
    {
        [self setupAnimator];
    }
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
