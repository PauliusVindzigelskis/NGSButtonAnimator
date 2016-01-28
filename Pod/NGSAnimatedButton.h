//
//  LBButton.h
//  Lendbook
//
//  Created by Paulius Vindzigelskis on 2015-12-14.
//  Copyright © 2015 Paulius Vindzigelskis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NGSButtonAnimator.h"

#ifndef IB_DESIGNABLE
	#define IB_DESIGNABLE
#endif
#ifndef IBInspectable
	#define IBInspectable
#endif

IB_DESIGNABLE
@interface NGSAnimatedButton : UIButton

@property (nonatomic, strong, readonly) NGSButtonAnimator *animator;
@property (nonatomic, strong) IBInspectable UIColor *primaryColor;
@property (nonatomic, strong) IBInspectable UIColor *secondaryColor;

- (instancetype) initWithPrimaryColor:(UIColor*)primColor secondaryColor:(UIColor*)secColor;

@end
