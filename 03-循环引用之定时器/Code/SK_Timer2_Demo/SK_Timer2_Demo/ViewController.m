//
//  ViewController.m
//  SK_Timer2_Demo
//
//  Created by TrimbleZhang on 2018/12/6.
//  Copyright © 2018 AlexanderYeah. All rights reserved.
//

#import "ViewController.h"




#import "SecVC.h"
@interface ViewController ()



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"go next" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    btn.frame =CGRectMake(100, 200, 100, 50);
    
    
}

- (void)btnClick
{
    
    SecVC *vc = [[SecVC alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
    
}




@end
