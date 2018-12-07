### 循环引用场景



#### 情景1 在block 中使用 self 的变量或者方法  相互持有类型的

* 原因 ：相互持有

```objective-c
    // 相互持有形式的循环应用
    self.block = ^{
        // 在block 内部又去调用self 属性或者方法
        self.showStr = @"123";
    }
```

* 解决方案

```objective-c
    // weak 修饰self
    __weak typeof(self) weakSelf = self;
    
    self.block = ^{
        weakSelf.showStr = @"123";
    };
    
```



#### 情景2  不是所有在block 使用 self的属性 都会产生循环引用

* 系统block 内部调用block示例

```objective-c

    // 系统的Block 中使用slef 就不会产生循环引用
    [UIView animateWithDuration:2.0f animations:^{
      
        self.backBtn.transform =   CGAffineTransformMakeScale(1.0, 3.0) ;
    }];
    
```



* 原因：UIView的调用的是类方法，当前控制器不可能强引用一个类 ，所以循环无法形成 --> 动画block不会造成循环引用的原因。



#### 情景3  使用AFN的时候，在block 内部调用self 也不会产生循环引用 ,是因为你的网络类对象是不会被当前控制器引用的，这时就不会形成引用环。因为self不持有AFN的block，只是AFN的block持有self，仅仅是单向持有，并没有相互强引用~所以不会造成循环引用





#### 情景4 自己写的Block 也不一定会产生循环引用

```objective-c
    
// 这就是典型的参数回传 虽然在block 中使用了self ,但是slef 并没有去持有block，所以不会发生循环引用
FirstVC *vc = [[FirstVC alloc]init];
    
    vc.block = ^{
        self.showStr = @"143456";
    };
    
    [self presentViewController:vc animated:YES completion:nil];
```



#### 情景5 使用系统通知的Block 通知会产生循环引用

```objective-c
// 解决方案使用weak 修饰self
[[NSNotificationCenter defaultCenter]addObserverForName:@"IAMHERE" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        self.showStr = @"在这里了";
    }];
```

