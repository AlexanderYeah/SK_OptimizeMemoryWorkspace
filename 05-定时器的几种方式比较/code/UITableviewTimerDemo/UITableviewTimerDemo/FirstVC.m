//
//  FirstVC.m
//  UITableviewTimerDemo
//
//  Created by TrimbleZhang on 2018/12/10.
//  Copyright © 2018 AlexanderYeah. All rights reserved.
//

#import "FirstVC.h"

@interface FirstVC ()<UITableViewDataSource,UITableViewDelegate>

{
    
    dispatch_source_t _timer;
    
    
}

@end

@implementation FirstVC


#pragma mark - 0 LazyLoad


#pragma mark - 1 LifeCycle
- (void)viewWillAppear:(BOOL)animated
{
    
    
    NSLog(@"%s-%@",__func__,[NSRunLoop mainRunLoop].currentMode);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 初始化 UI的时候 runloop mode为  kCFRunLoopDefaultMode
    
    NSLog(@"%s-%@",__func__,[NSRunLoop mainRunLoop].currentMode);
   
    
}
#pragma mark - 2 Create UI


#pragma mark - 3 LoadData

#pragma mark - 4 Delegate Method


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 15;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 80;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIView new];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [UIView new];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIDA = @"CellIDA";
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIDA];
    }
    

     // 在每一个cell 上创建一个定时器 显示当前的时间到秒的单位

//    NSTimer *timer = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//
//        NSDate* now = [NSDate date];
//        NSDateFormatter* fmt = [[NSDateFormatter alloc] init];
//        fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
//        fmt.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss";
//        NSString* dateString = [fmt stringFromDate:now];
//        cell.textLabel.text =  dateString;
//
//    }];
    
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//
//    dispatch_async(queue, ^{
//            NSTimer *timer = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//
//                NSDate* now = [NSDate date];
//                NSDateFormatter* fmt = [[NSDateFormatter alloc] init];
//                fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
//                fmt.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss";
//
//
//                NSString* dateString = [fmt stringFromDate:now];
//
//                dispatch_async(dispatch_get_main_queue(), ^{
//                      cell.textLabel.text =  dateString;
//                });
//
//            }];
//
//            //  加入运行循环
//            [[NSRunLoop currentRunLoop]addTimer:timer forMode:NSDefaultRunLoopMode];
//            // 手动开启当前子线程的运行循环
//            [[NSRunLoop currentRunLoop] run];
//
//    });
    
    
    // dispatch_Timer_Source
    
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    

    
    

    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
}



#pragma mark - 5 Action Response

#pragma mark - 6 Extract Method



@end
