//
//  FY_ScaleTransition.m
//  FYAnimationAlert
//
//  Created by apple on 2018/5/14.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "FY_ScaleTransition.h"
#import "FY_IntentViewController.h"

@interface FY_ScaleTransition()

@property (nonatomic, assign) BOOL present;

@end

@implementation FY_ScaleTransition

- (instancetype)initWithPresenting:(BOOL)isPresent{
    
    if (self = [super init]) {
        
        self.present = isPresent;
    }
    return self;
}

+ (instancetype)animationIsPresenting:(BOOL)isPresent {
    
    return [[self alloc] initWithPresenting:isPresent];
}

//弹出控制器
- (void)presentViewController:(nonnull id <UIViewControllerContextTransitioning>)transitionContext {
    
    FY_IntentViewController *toVC =(FY_IntentViewController*) [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIView *containView = transitionContext.containerView;
    
    [containView addSubview:toVC.view];
    
//    [containView addSubview:toVC.showAlertView];
    
    //动画时间
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    toVC.showAlertView.transform = CGAffineTransformMakeScale(0.3, 0.3);
    toVC.showAlertView.alpha = 0.f;
    [UIView animateWithDuration:duration animations:^{
        
        toVC.showAlertView.transform = CGAffineTransformMakeScale(1.05, 1.05);
        toVC.showAlertView.alpha = 1.0;
    } completion:^(BOOL finished) {
        
        toVC.showAlertView.transform = CGAffineTransformIdentity;
        
        
        [transitionContext completeTransition:YES];
    }];
    
    
}

//隐藏
- (void)dismissViewController:(id<UIViewControllerContextTransitioning> )transitionContext {
    
    FY_IntentViewController *toVC =(FY_IntentViewController*) [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
//    UIView *containView = transitionContext.containerView;
//    
//    [containView addSubview:toVC.view];
    
    //    [containView addSubview:toVC.showAlertView];
    
    //动画时间
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    toVC.showAlertView.transform = CGAffineTransformIdentity;
    toVC.showAlertView.alpha = 1.f;
    [UIView animateWithDuration:duration animations:^{
        
        toVC.showAlertView.transform = CGAffineTransformMakeScale(0.1, 0.1);
        toVC.showAlertView.alpha = 0.0;
    } completion:^(BOOL finished) {
        
        toVC.showAlertView.transform = CGAffineTransformIdentity;
        
        
        [transitionContext completeTransition:YES];
    }];
    
}

- (void)animateTransition:(nonnull id<UIViewControllerContextTransitioning>)transitionContext {
    
    
    if (self.present) {
        
        [self presentViewController:transitionContext];
    }else {
        [self dismissViewController:transitionContext];
    }
    
//    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
//
////    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
//
////    NSLog(@"tovc === %@,\n fromVC === %@",toVC,fromVC);
//
//    UIView *containerView = [transitionContext containerView];
//
//
//
////    UIView *fromView = fromVC.view;
//    UIView *toView = toVC.view;
//
//    [containerView addSubview:toView];
//
////    [containerView bringSubviewToFront:fromView];
//
//    NSTimeInterval duration = [self transitionDuration:transitionContext];
//
//
//    toView.alpha = 0;
//    toView.transform = CGAffineTransformMakeScale(0.5, 0.5);
//
//
//    [UIView animateWithDuration:duration animations:^{
////        fromView.alpha = 0.0;
////        fromView.transform = CGAffineTransformMakeScale(0.2, 0.2);
//
//        toView.transform = CGAffineTransformMakeScale(1.2, 1.2);
//
//        toView.alpha = 1.0;
//    } completion:^(BOOL finished) {
//
//        toView.transform = CGAffineTransformMakeScale(1.0, 1.0);
//        [transitionContext completeTransition:YES];
//    }];
    
}

- (NSTimeInterval)transitionDuration:(nullable id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.5;
}

@end
