//
//  SecVC.m
//  SK_Timer2_Demo
//
//  Created by TrimbleZhang on 2018/12/6.
//  Copyright © 2018 AlexanderYeah. All rights reserved.
//

#import "SecVC.h"
#import "SK_WeakTimerTool.h"

@interface SecVC ()

/** */
@property (nonatomic,strong)SK_WeakTimerTool *weakTimerTool;
@end

@implementation SecVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 中间的类
    self.weakTimerTool = [[SK_WeakTimerTool alloc]initWithTimeInterval:1 target:self selector:@selector(logInfo:)];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"back" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor cyanColor];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    btn.frame =CGRectMake(100, 200, 100, 50);
}
    
    
 
// 接受SK_WeakTimerTool传递过来的值
- (void)logInfo:(NSNumber *)num
{
    NSLog(@"num--%d",[num intValue]);
    
}
-(void)dealloc
{
    // 销毁的时候进行清除定时器
    [self.weakTimerTool cleanTimer];
    NSLog(@"%s",__func__);
}


- (void)btnClick
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
