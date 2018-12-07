//
//  FirstVC.h
//  SK_Block01_Demo
//
//  Created by TrimbleZhang on 2018/12/7.
//  Copyright © 2018 AlexanderYeah. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^myBlock)();

@interface FirstVC : UIViewController

/** */
@property (nonatomic,copy)myBlock block;

@end

NS_ASSUME_NONNULL_END
