//
//  LBButtonAnimator.h
//  Lendbook
//
//  Created by Paulius Vindzigelskis on 2015-12-14.
//  Copyright © 2015 Paulius Vindzigelskis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NGSButtonAnimator : NSObject

@property (nonatomic, weak) UIButton *button;
@property (nonatomic, assign, readonly) BOOL isCircle;
@property (nonatomic, strong, readonly) UIColor *primaryColor;
@property (nonatomic, strong, readonly) UIColor *secondaryColor;

- (instancetype) initWithButton:(UIButton*)button primaryColor:(UIColor*)primColor secondaryColor:(UIColor*)secColor;

- (void) becomeCircleAnimated:(BOOL)animated completion:(void (^)(void))completion;
- (void) becomeNormalAnimated:(BOOL)animated completion:(void (^)(void))completion;


-(void)setHighlighted:(BOOL)highlighted;
- (void) updateView;

- (void) updateColorsWithPrimaryColor:(UIColor*)primColor secondaryColor:(UIColor*)secColor;

@end
