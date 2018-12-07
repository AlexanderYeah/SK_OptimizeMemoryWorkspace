//
//  FirstVC.m
//  SK_Block01_Demo
//
//  Created by TrimbleZhang on 2018/12/7.
//  Copyright © 2018 AlexanderYeah. All rights reserved.
//

#import "FirstVC.h"

#import "Person.h"


#import "SecVC.h"

@interface FirstVC ()



/** */
@property (nonatomic,strong)NSString *showStr;

/** */
@property (nonatomic,strong)Person *person;


@property (weak, nonatomic) IBOutlet UIButton *backBtn;


@end

@implementation FirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [[NSNotificationCenter defaultCenter]addObserverForName:@"IAMHERE" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        self.showStr = @"在这里了";
    }];
    
    

}




// 发送通知引循环引用
- (void)ex3
{
    
    
    
}

/**
 系统block
 */
- (void)ex2
{
    
    // 系统的Block 中使用slef 就不会产生循环引用
    [UIView animateWithDuration:2.0f animations:^{
        
        self.backBtn.transform =   CGAffineTransformMakeScale(1.0, 3.0) ;
    }];
}

/**
  相互持有形式的循环应用系统block
 */
- (void)ex1
{
    
    // 相互持有形式的循环应用
    // weak 修饰self
    __weak typeof(self) weakSelf = self;
    
    self.block = ^{
        weakSelf.showStr = @"123";
    };
    
    
}



- (IBAction)nextVC:(id)sender {
    
    SecVC *sec = [[SecVC alloc]init];
    [self presentViewController:sec animated:YES completion:nil];
    
    
    
}


// 释放了
- (void)dealloc
{
    NSLog(@"%s",__func__);
}

- (IBAction)backTo:(id)sender {
    
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
