//
//  ViewController.m
//  HHPopMenuDemo
//
//  Created by chh on 2017/11/2.
//  Copyright © 2017年 chh. All rights reserved.
//

#import "ViewController.h"
#import "HHPopMenu.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)buttonAction:(UIButton *)sender {
    switch (sender.tag) {
        case 1001://按钮1
        {
            CGPoint point = CGPointMake(sender.center.x, CGRectGetMaxY(sender.frame));
            HHPopMenu *popMenu = [[HHPopMenu alloc] initWithOrigin:point Width:150 Height:200];
            [popMenu popView];
        }
            break;
        case 1002://按钮2
        {
            CGPoint point = CGPointMake(sender.center.x, CGRectGetMaxY(sender.frame));
            HHPopMenu *popMenu = [[HHPopMenu alloc] initWithOrigin:point Width:150 Height:200];
            [popMenu popView];
        }
            break;
        case 1003://按钮3
        {
            CGPoint point = CGPointMake(sender.center.x, CGRectGetMaxY(sender.frame));
            HHPopMenu *popMenu = [[HHPopMenu alloc] initWithOrigin:point Width:150 Height:200];
            [popMenu popView];
        }
            break;
        case 1004://按钮4
        {
            CGPoint point = CGPointMake(sender.center.x, CGRectGetMaxY(sender.frame));
            HHPopMenu *popMenu = [[HHPopMenu alloc] initWithOrigin:point Width:150 Height:200];
            [popMenu popView];
        }
            break;
        case 1005://按钮5
        {
            CGPoint point = CGPointMake(sender.center.x, CGRectGetMaxY(sender.frame));
            HHPopMenu *popMenu = [[HHPopMenu alloc] initWithOrigin:point Width:150 Height:200];
            [popMenu popView];
        }
            
            break;
        case 1006://按钮6
        {
            CGPoint point = CGPointMake(sender.center.x, CGRectGetMaxY(sender.frame));
            HHPopMenu *popMenu = [[HHPopMenu alloc] initWithOrigin:point Width:150 Height:200];
            [popMenu popView];
        }
            break;
        default:
            break;
    }
}

@end
