#### GCD dispatch_source_t 定时器

GCD 中的定时器是一种高精度的定时器。使用方法。



* 1 需要将dispatch_source_t 设置为成员变量，不然会立即释放

```objective-c
@interface ViewController ()<UITabBarDelegate,UITableViewDataSource>

{
    // 设置为成员变量 
    dispatch_source_t _timer;
    
}

@property (weak, nonatomic) IBOutlet UITableView *tableview;

@end
```



* 代码实现

```objective-c
    // 0 获取全局队列，在全局队列中执行定时任务
    dispatch_queue_t queue = dispatch_queue_create(DISPATCH_QUEUE_PRIORITY_DEFAULT
                                                   , 0);
    // 1 实例化timer
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    // 2 设置timer
    // 参数 1：开始时间 可以设置延时操作
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC));
    //参数2 ： 每隔多长时间执行一次
    uint64_t interval = (uint64_t)(1.0 * NSEC_PER_SEC);
	// 参数3：相隔的时间 0 * NSEC_PER_SEC 
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
```

