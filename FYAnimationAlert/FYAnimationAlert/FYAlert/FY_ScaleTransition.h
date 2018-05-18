//
//  FY_ScaleTransition.h
//  FYAnimationAlert
//
//  Created by apple on 2018/5/14.
//  Copyright © 2018年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FY_ScaleTransition : NSObject<UIViewControllerAnimatedTransitioning>

+ (instancetype)animationIsPresenting:(BOOL)isPresent;

@end
