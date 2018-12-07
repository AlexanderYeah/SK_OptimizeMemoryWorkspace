//
//  SecVC.m
//  SK_Block01_Demo
//
//  Created by TrimbleZhang on 2018/12/7.
//  Copyright © 2018 AlexanderYeah. All rights reserved.
//

#import "SecVC.h"

@interface SecVC ()

@end

@implementation SecVC


- (void)viewWillAppear:(BOOL)animated
{
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"IAMHERE" object:nil];
    
}


// 释放了
- (void)dealloc
{
    NSLog(@"%s",__func__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)goBack:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion: nil];
        
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
