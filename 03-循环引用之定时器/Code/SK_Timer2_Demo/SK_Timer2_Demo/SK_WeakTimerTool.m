//
//  SK_WeakTimerTool.m
//  SK_Timer2_Demo
//
//  Created by TrimbleZhang on 2018/12/6.
//  Copyright © 2018 AlexanderYeah. All rights reserved.
//

#import "SK_WeakTimerTool.h"

static NSInteger count = 0;
@implementation SK_WeakTimerTool


- (instancetype)initWithTimeInterval:(NSTimeInterval)interval target:(id)target selector:(SEL)selector
{
    if (self = [super init]) {
        
        self.target = target;
        self.selector = selector;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:interval target:self selector:@selector(update) userInfo:nil repeats:YES];
    }
    return self;
    
}

// 定时器更新方法
- (void)update{
    
    // 做一个自增的操作 传回到上个界面
    count ++;
    // 为了在块内使用weak
    // typeof(self)是获取到self的类型,这样定义的weakSelf就是和self一个类型的,加上__weak是建立一个弱引用,所以
    __weak typeof(self) weakSelf = self;
    
    // MARK: 在使用异步块时需要确保不会引入循环引用。我们在块方法内使用 __weak 引用    
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong typeof(self) strongSelf = weakSelf;
        if (!strongSelf) {
            return;
        }
        
        if (strongSelf.target == nil) {
            return;
        }
        
        id target = strongSelf.target;
        SEL selector = strongSelf.selector;
        
        if ([target respondsToSelector:selector]) {
            [target performSelector:selector withObject:@(count)];
        }
        
        
    });
}


// 手动释放定时器 紧接着就会调用 dealloc 方法
- (void)cleanTimer
{
    
    NSLog(@"%s",__func__);
    [self.timer invalidate];
    self.timer = nil;
    
    
}

-(void)dealloc
{
    
    NSLog(@"%s",__func__);
}

@end
