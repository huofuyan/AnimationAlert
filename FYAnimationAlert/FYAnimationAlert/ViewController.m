//
//  ViewController.m
//  FYAnimationAlert
//
//  Created by apple on 2018/5/11.
//  Copyright © 2018年 apple. All rights reserved.
//

#import "ViewController.h"
#import "FY_IntentViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:@"点击我" forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    
    button.frame = CGRectMake(100, 200, 200, 50);
    
    [self.view addSubview:button];

}

- (void)clickButton:(UIButton *)button {
    
    FY_IntentViewController *vc = [[FY_IntentViewController alloc] init];
    
//    vc.modalPresentationStyle = UIModalPresentationOverFullScreen;
    
    [self presentViewController:vc animated:YES completion:nil];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
