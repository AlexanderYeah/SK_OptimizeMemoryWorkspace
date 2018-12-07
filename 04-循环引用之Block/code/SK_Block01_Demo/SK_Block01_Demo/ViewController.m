//
//  ViewController.m
//  SK_Block01_Demo
//
//  Created by TrimbleZhang on 2018/12/7.
//  Copyright © 2018 AlexanderYeah. All rights reserved.
//

#import "ViewController.h"
#import "FirstVC.h"
@interface ViewController ()

/** */
@property (nonatomic,strong)NSString *showStr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
 

    
    
}

 

- (IBAction)goNext:(id)sender {
    
    FirstVC *vc = [[FirstVC alloc]init];
    
    vc.block = ^{
        self.showStr = @"143456";
    };
    
    [self presentViewController:vc animated:YES completion:nil];
    
    
}

@end
