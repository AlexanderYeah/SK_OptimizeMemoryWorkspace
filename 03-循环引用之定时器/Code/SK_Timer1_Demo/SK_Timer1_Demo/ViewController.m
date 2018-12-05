//
//  ViewController.m
//  SK_Timer1_Demo
//
//  Created by TrimbleZhang on 2018/12/5.
//  Copyright © 2018 AlexanderYeah. All rights reserved.
//

#import "ViewController.h"

#import "SecondViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)goNext:(id)sender {
    
    SecondViewController *vc = [[SecondViewController alloc]init];
    
    [self presentViewController:vc animated:YES completion:^{
        
    }];
    
    
}

@end
