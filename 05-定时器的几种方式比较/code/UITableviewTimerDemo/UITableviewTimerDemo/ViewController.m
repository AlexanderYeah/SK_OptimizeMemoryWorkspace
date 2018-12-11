//
//  ViewController.m
//  UITableviewTimerDemo
//
//  Created by TrimbleZhang on 2018/12/10.
//  Copyright © 2018 AlexanderYeah. All rights reserved.
//

#import "ViewController.h"
#import "FirstVC.h"
@interface ViewController ()<UITabBarDelegate,UITableViewDataSource>

{
    
    dispatch_source_t _timer;
    
}

@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end

@implementation ViewController

#pragma mark - 0 LazyLoad

#pragma mark - 1 LifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableview.separatorInset = UIEdgeInsetsZero;
    
    
}
#pragma mark - 2 Create UI

#pragma mark - 3 LoadData

#pragma mark - 4 Delegate Method
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
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
    
    cell.layoutMargins = UIEdgeInsetsZero;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    // 0 获取全局队列，在全局队列中执行定时任务
    dispatch_queue_t queue = dispatch_get_main_queue();
    // 1 实例化timer
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    // 2 设置timer
    // 参数：开始时间 可以设置延时操作
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC));
    //参数： 每隔多长时间执行一次
    uint64_t interval = (uint64_t)(1.0 * NSEC_PER_SEC);
    // 进行设置
    dispatch_source_set_timer(_timer, start,interval, 0 * NSEC_PER_SEC);
    
    // 3 开启执行定时器
    dispatch_source_set_event_handler(_timer, ^{
        NSLog(@"来了老弟");
        // 手动去调用取消任务
        //        dispatch_source_cancel(_timer);
        // 去x主线程刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            NSDate* now = [NSDate date];
            NSDateFormatter* fmt = [[NSDateFormatter alloc] init];
            fmt.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
            fmt.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss";
            NSString* dateString = [fmt stringFromDate:now];
            cell.textLabel.text = dateString;
        });
    });
    
    // 4 定时器销毁的回调
    dispatch_source_set_cancel_handler(_timer, ^{
        NSLog(@"走了老弟");
    });
    // 5  启动计时器
    dispatch_resume(_timer);
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            {
                FirstVC *vc = [[FirstVC alloc]init];
                [self presentViewController:vc animated:YES completion:nil];
            }
            break;
            
            
        default:
            break;
    }
    
}


// 输出runloop mode






#pragma mark - 5 Action Response


#pragma mark - 6 Extract Method




@end
