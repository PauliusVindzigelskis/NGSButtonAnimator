//
//  LBButtonAnimator.m
//  Lendbook
//
//  Created by Paulius Vindzigelskis on 2015-12-14.
//  Copyright © 2015 Paulius Vindzigelskis. All rights reserved.
//

#import "NGSButtonAnimator.h"
#import <Shapes/CATransaction+AnimateWithDuration.h>
#import "Masonry.h"
#import <Shapes/Shapes.h>

#define kSpinAnimationKey @"spin animation"

@interface NGSButtonAnimator()

@property (nonatomic, strong) NSString *savedTitle;
@property (nonatomic, strong) DTShapeView *progressView;
@property (nonatomic, strong) DTShapeView *shape;
@property (nonatomic, strong) UIColor *primaryColor;
@property (nonatomic, strong) UIColor *secondaryColor;

@end

@implementation NGSButtonAnimator

-(instancetype)initWithButton:(UIButton *)button primaryColor:(UIColor*)primColor secondaryColor:(UIColor*)secColor;
{
    if (self = [super init])
    {
        _button = button;
        _primaryColor = primColor;
        _secondaryColor = secColor;
        [self lb_setup];
    } return self;
}

-(void)updateColorsWithPrimaryColor:(UIColor *)primColor secondaryColor:(UIColor *)secColor
{
    [self updateColorsWithPrimaryColor:primColor secondaryColor:secColor forced:NO];
}

-(void)updateColorsWithPrimaryColor:(UIColor *)primColor secondaryColor:(UIColor *)secColor forced:(BOOL)forced
{
    if (forced || ![primColor isEqual:self.primaryColor] || ![secColor isEqual:self.secondaryColor])
    {
        self.primaryColor = primColor;
        self.secondaryColor = secColor;
        
        self.progressView.strokeColor = primColor;
        self.shape.strokeColor = primColor;
        
        
        [self.button setTitleColor:secColor forState:UIControlStateHighlighted];
        [self.button setTitleColor:primColor forState:UIControlStateNormal];
        
        [self setHighlighted:self.button.highlighted];
        
        [self updateView];
    }
}

-(void)lb_setup
{
    
    //main shape
    DTShapeView *defaultShape = [[DTShapeView alloc] init];
    defaultShape.fillColor = [UIColor clearColor];
    defaultShape.userInteractionEnabled = NO;
    defaultShape.path = [self bezierPath];
    
    [self.button addSubview:defaultShape];
    [self.button sendSubviewToBack:defaultShape];
    [defaultShape mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.button);
    }];
    self.shape = defaultShape;
    
    //progress shape
    DTShapeView *shapeView = [[DTShapeView alloc] init];
    shapeView.fillColor = self.button.backgroundColor;
    
    [self.button addSubview:shapeView];
    [shapeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.button);
        make.height.and.width.equalTo(self.button.mas_height).with.offset(-1.f);
    }];
    
    [shapeView layoutIfNeeded];
    
    shapeView.path = [self circlePathForView:shapeView];
    shapeView.strokeEnd = 0.85f;
    
    self.progressView = shapeView;
    self.progressView.hidden = YES;
    
    [self updateColorsWithPrimaryColor:self.primaryColor secondaryColor:self.secondaryColor forced:YES];
    
    [self updateView];
}

- (UIBezierPath *)bezierPath
{
    UIBezierPath *path;
    if (self.isCircle)
    {
        path = [self circlePath];
    } else
    {
        path = [self normalPath];
    }
    
    return path;
}

- (UIBezierPath*)circlePath
{
    return [self circlePathForView:self.button];
}

- (UIBezierPath*)circlePathForView:(UIView*)view
{
    UIBezierPath *path;
    CGRect rect = view.bounds;
    CGSize size = rect.size;
    
    rect.origin.x = (size.width-size.height)/2.f;
    rect.size.width = rect.size.height;
    
    path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:size.height/2.f];
    
    return path;
}

- (UIBezierPath*)normalPath
{
    return [UIBezierPath bezierPathWithRoundedRect:self.button.bounds cornerRadius:5.0f];
}

-(void)becomeCircleAnimated:(BOOL)animated completion:(void (^)(void))completion
{
    if (self.isCircle)
    {
        return;
    }
    
    self.button.userInteractionEnabled = NO;
    _isCircle = YES;
    UIBezierPath *path = [self bezierPath];
    self.savedTitle = [self.button titleForState:UIControlStateNormal];
    [self.button setTitle:@"" forState:UIControlStateNormal];
    
    CABasicAnimation *spinAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    spinAnimation.toValue        = @(1*2*M_PI);
    spinAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    spinAnimation.duration       = 1.0;
    spinAnimation.repeatCount    = INFINITY;
    [self.progressView.shapeLayer addAnimation:spinAnimation forKey:kSpinAnimationKey];
    
    void (^animation)(void) = ^() {
        self.shape.path = path;
    };
    
    void (^animationCompletion)(void) = ^() {
        self.shape.hidden = YES;
        self.progressView.hidden = NO;
        if (completion)
        {
            completion();
        }
    };
    
    if (animated)
    {
        //spin it!
        [CATransaction dt_animateWithDuration:0.25f animations:animation completion:animationCompletion];
    } else {
        self.shape.path = path;
        [self.shape setNeedsDisplay];
        
        animation();
        animationCompletion();
    }
}

-(void)becomeNormalAnimated:(BOOL)animated completion:(void (^)(void))completion
{
    if (!self.isCircle)
    {
        return;
    }

    [self.progressView.shapeLayer removeAnimationForKey:kSpinAnimationKey];
    self.shape.hidden = NO;
    self.progressView.hidden = YES;
    
    _isCircle = NO;
    
    
    void (^animation)(void) = ^() {
        self.shape.path = [self bezierPath];
    };
    
    void (^animationCompletion)(void) = ^() {
        [self.button setTitle:self.savedTitle forState:UIControlStateNormal];
        self.button.userInteractionEnabled = YES;
        if (completion)
        {
            completion();
        }
    };
    
    if (animated)
    {
        //spin it!
        [CATransaction dt_animateWithDuration:0.25f animations:animation completion:animationCompletion];
    } else {
        animation();
        [self.shape setNeedsDisplay];
        animationCompletion();
    }
}

#pragma mark - UIButton forwards

-(void)setHighlighted:(BOOL)highlighted
{
    if (highlighted)
    {
        self.shape.fillColor = self.primaryColor;
    }
    else {
        self.shape.fillColor = [UIColor clearColor];
    }
}

-(void)updateView
{
    self.shape.path = [self bezierPath];
    [self.shape setNeedsDisplay];
}

@end
