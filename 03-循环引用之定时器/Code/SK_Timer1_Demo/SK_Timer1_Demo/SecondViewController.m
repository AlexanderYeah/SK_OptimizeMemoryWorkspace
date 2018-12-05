//
//  SecondViewController.m
//  SK_Timer1_Demo
//
//  Created by TrimbleZhang on 2018/12/5.
//  Copyright © 2018 AlexanderYeah. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
/** */
@property (nonatomic,strong)NSTimer *timer;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
        self.timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(addAction) userInfo:nil repeats:YES];
    
    
        [[NSRunLoop mainRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}


- (void)addAction{
    
    // MARK:解决方案1 在界面弹出之前进行手动释放定时器
   
    
    NSLog(@"%s",__func__);
    
}

- (IBAction)backVC:(id)sender {
    
    [self.timer invalidate];
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
    
}



/**
    vc 销毁
 */
- (void)dealloc
{
    
    [self.timer invalidate];
    NSLog(@"SecondViewController has been destroyed");
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
