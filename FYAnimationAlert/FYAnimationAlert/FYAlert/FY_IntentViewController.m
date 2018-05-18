//
//  FY_IntentViewController.m
//  FYAnimationAlert
//
//  Created by apple on 2018/5/14.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "FY_IntentViewController.h"
#import "FY_ScaleTransition.h"

@interface FY_IntentViewController ()<UIViewControllerTransitioningDelegate>


@property (nonatomic, strong) UIView *backGroundGestureView;

@end

@implementation FY_IntentViewController

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        self.transitioningDelegate = self;
        
        self.modalPresentationStyle = UIModalPresentationCustom;
    
    }
    return self;
}

- (UIView *)backGroundGestureView {
    
    if (!_backGroundGestureView) {
        
        _backGroundGestureView = [[UIView alloc] initWithFrame:self.view.bounds];
        
        _backGroundGestureView.backgroundColor = [UIColor colorWithWhite:0.1 alpha:0.1];
        
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickButton:)];
        
        tapGesture.numberOfTapsRequired = 1;
        
        [_backGroundGestureView addGestureRecognizer:tapGesture];
    }
    return _backGroundGestureView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:@"dismiss 目标控制器" forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    button.frame = CGRectMake(100, 200, 200, 50);
    
//    [self.view addSubview:button];
    
//    self.view.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.2];
    
    
    
    self.view.alpha = 0.9;
    
//    [self.view insertSubview:self.backGroundView atIndex:0];
    [self.view addSubview:self.backGroundGestureView];
    [self.view addSubview:self.showAlertView];
    
   
}

- (void)clickButton:(UIButton *)button {
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (UIView *)showAlertView {
    
    if (!_showAlertView) {
        
        _showAlertView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
        
        _showAlertView.center = self.view.center;
        
        _showAlertView.backgroundColor = [UIColor redColor];
        
       
    }
    
    return _showAlertView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 代理
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    return [FY_ScaleTransition animationIsPresenting:YES];
    
//    return nil;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    return [FY_ScaleTransition new];
//    return nil;
}



@end
