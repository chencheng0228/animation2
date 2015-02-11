//
//  ViewController.m
//  TestAnimation_基础动画
//
//  Created by admin on 15-1-16.
//  Copyright (c) 2015年 ___CC___. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
 @property(nonatomic,strong)CALayer *myLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
         //创建layer
         CALayer *myLayer=[CALayer layer];
         //设置layer的属性
         myLayer.bounds = CGRectMake(0, 0, 50, 80);
         myLayer.backgroundColor = [UIColor yellowColor].CGColor;
         myLayer.position = CGPointMake(50, 50);
         myLayer.anchorPoint = CGPointMake(0, 0);
         myLayer.cornerRadius = 20;
    
         //添加layer
         [self.view.layer addSublayer:myLayer];
         self.myLayer=myLayer;
}


 //设置动画（基础动画）
 -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
 {
         //创建核心动画
         // CABasicAnimation *anima=[CABasicAnimation animationWithKeyPath:<#(NSString *)#>]
         CABasicAnimation *anima=[CABasicAnimation animation];
    
         //告诉系统要执行什么样的动画
         anima.keyPath=@"position";
         //设置通过动画，将layer从哪儿移动到哪儿
         anima.fromValue=[NSValue valueWithCGPoint:CGPointMake(0, 0)];
         anima.toValue=[NSValue valueWithCGPoint:CGPointMake(200, 300)];
    
         //设置动画执行完毕之后不删除动画
         anima.removedOnCompletion=NO;
     
         //设置保存动画的最新状态
         anima.fillMode=kCAFillModeForwards;
     
         //代理
         anima.delegate = self;
    
         //添加核心动画到layer
         [self.myLayer addAnimation:anima forKey:nil];
     
     
          //创建动画
          CABasicAnimation *anima2=[CABasicAnimation animationWithKeyPath:@"transform"];
          //设置动画执行时间
          anima2.duration=2.0;
          //修改属性，执行动画
          anima2.toValue=[NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 0, 1, 0)];
          //设置动画执行完毕后不删除动画
          anima2.removedOnCompletion=NO;
          //设置保存动画的最新状态
          anima2.fillMode=kCAFillModeForwards;
          //重复次数
          anima2.repeatCount = 100;
     
          //添加动画到layer
          [self.myLayer addAnimation:anima2 forKey:nil];
     
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
