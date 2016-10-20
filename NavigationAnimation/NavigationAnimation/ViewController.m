//
//  ViewController.m
//  NavigationAnimation
//
//  Created by 王宝 on 16/10/20.
//  Copyright © 2016年 鸿天融达. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"

#define KWIDTH self.view.bounds.size.width
#define KHEIGHT self.view.bounds.size.height
@interface ViewController ()
{
    UIView *view;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(nextAction)];
    
    self.navigationItem.rightBarButtonItem = next;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initViews];
}

- (void)initViews
{
    view = [[UIView alloc] initWithFrame:CGRectMake(40, 40, KWIDTH-80, KHEIGHT-80-64)];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    
    UIView *cent = [[UIView alloc] initWithFrame:CGRectMake(0, 0, view.frame.size.width, 40)];
    cent.backgroundColor = [UIColor redColor];
    cent.center = CGPointMake(view.frame.size.width/2, view.frame.size.height/2);
    [view addSubview:cent];
    //自动布局子试图。该试图宽度可以改变，就是可以根据父试图的大小改变自己的宽度
    cent.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    UIView *one = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    one.backgroundColor = [UIColor yellowColor];
    [view addSubview:one];
    //该试图距父试图的右侧和底部可以改变
    one.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    UIView *two = [[UIView alloc] initWithFrame:CGRectMake(view.frame.size.width-40, 0, 40, 40)];
    two.backgroundColor = one.backgroundColor;
    [view addSubview:two];
    two.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static BOOL t = YES;
    
    if (t) {
        [UIView animateWithDuration:1 animations:^{
            view.frame = CGRectMake(10, 10, KWIDTH-20, KHEIGHT-20-64);
        }];
    }
    else {
        [UIView animateWithDuration:1 animations:^{
            view.frame = CGRectMake(40, 40, KWIDTH-80, KHEIGHT-80-64);
        }];
    }
    
    t = !t;
}

- (void)nextAction
{
    //定义一个动画变换对象，层动画对象
    //获取动画对象
    CATransition *amin = [CATransition animation];
    //动画时间
    amin.duration = 3;
    //动画类型，决定动画效果类型
    /*
     fade,                   //淡入淡出
     push,                       //推挤
     reveal,                     //揭开
     moveIn,                     //覆盖
     cube,                       //立方体
     suckEffect,                 //吮吸
     oglFlip,                    //翻转
     rippleEffect,               //波纹
     pageCurl,                   //翻页
     pageUnCurl,                 //反翻页
     cameraIrisHollowOpen,       //开镜头
     cameraIrisHollowClose,      //关镜头
     curlDown,                   //下翻页
     curlUp,                     //上翻页
     flipFromLeft,               //左翻转
     flipFromRight,              //右翻转
     */
    amin.type = @"fade";
    //动画子类型，例如动画方向
    amin.subtype = kCATransitionFromLeft;
    //动画轨迹sudu
    amin.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //将动画设置到页面上
    //[self.navigationController.view.layer addAnimation:amin forKey:nil];
    [[UIApplication sharedApplication].keyWindow.layer addAnimation:amin forKey:nil];
    
    FirstViewController *firstVC = [[FirstViewController alloc] init];
    
    [self.navigationController pushViewController:firstVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
