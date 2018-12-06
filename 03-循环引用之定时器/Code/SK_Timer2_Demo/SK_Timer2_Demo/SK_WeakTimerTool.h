//
//  SK_WeakTimerTool.h
//  SK_Timer2_Demo
//
//  Created by TrimbleZhang on 2018/12/6.
//  Copyright © 2018 AlexanderYeah. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SK_WeakTimerTool : NSObject



@property (nonatomic,weak)id target;

@property (nonatomic,assign)SEL selector;

/** */
@property (nonatomic,strong)NSTimer *timer;


- (instancetype)initWithTimeInterval:(NSTimeInterval)interval target:(id)target selector:(SEL)selector;

- (void)cleanTimer;

@end

NS_ASSUME_NONNULL_END
