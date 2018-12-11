#### NSTimer 

NSTimer使用方式有很多种,但是都必须依托RunLoop 运行循环

```objective-c
// 这种方式创建的定时器需要手动的自己讲定时器加入到runloop当中去
+ (NSTimer *)timerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

//  scheduled 开头的创建方法系统默认的将创建的定时器加入到当前的Runloop

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;
// runloop运行循环模式，NSDefaultRunLoopMode、NSEventTrackingRunLoopMode，scheduled生成的timer会默认添加到NSDefaultRunLoopMode，当某些UI事件发生时，如页面滑动RunLoop切换到NSEventTrackingRunLoopMode运行，我们会发现定时器失效，为了解决timer失效的问题，我们需要在scheduled一个定时器的时候，设置它的运行模式为：
// NSRunLoopCommonModes 就包括了以上的两种模式
[[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];

```



#### 使用NSTimer 的缺点

* 1 就是强烈依赖于运行循环

* 2 timer的创建和撤销必须在同一个线程操作,不能够跨越线操作

* 3 有内存泄漏的风险。
