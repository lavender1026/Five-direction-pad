//
//  ViewController.m
//  自做九宫格解锁
//
//  Created by Lavender on 16/3/30.
//  Copyright © 2016年 lavender. All rights reserved.
//

#import "ViewController.h"
#import "TTView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"img-d7024fcceb34762454e2c6e73f285dec"]];
    TTView *drawView = [[TTView alloc]initWithFrame:CGRectMake(0, 120, 375, 447)];
    drawView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:drawView];
    
}

@end
