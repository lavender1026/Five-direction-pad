//
//  TTView.m
//  自做九宫格解锁
//
//  Created by Lavender on 16/3/30.
//  Copyright © 2016年 lavender. All rights reserved.
//

#import "TTView.h"
#define btnNum 9

@interface TTView ()
@property (nonatomic, strong) NSMutableArray *selectedBtns;
@end
@implementation TTView





#pragma mark 按钮方法们
//按钮开始点击
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    获取当前触摸点
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:touch.view];
//    遍历button如果触摸点在里面则使btn变成selected
    for (UIButton *btn in self.subviews) {
        if (CGRectContainsPoint(btn.frame, currentPoint)) {
            btn.selected = YES;
            [self.selectedBtns addObject:btn];
        }
    }
    [self setNeedsDisplay];
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    获取当前触摸点
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:touch.view];
    for (UIButton *btn in self.subviews) {
        if (CGRectContainsPoint(btn.frame, currentPoint)) {
            btn.selected = YES;
            [self.selectedBtns addObject:btn];
        }}
    [self setNeedsDisplay];
}
//
//-(void)test
//{
//    //    获取当前触摸点
//    UITouch *touch = [touch anyObject];
//    CGPoint currentPoint = [touch locationInView:touch.view];
//    for (UIButton *btn in self.subviews) {
//        if (CGRectContainsPoint(btn.frame, currentPoint)) {
//            btn.selected = YES;
//            [self.selectedBtns addObject:btn];
//        }}
//    [self setNeedsDisplay];
//}
//
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
 
    for (UIButton *btn in self.subviews) {
        btn.selected = NO;
    }
    [self setNeedsDisplay];
}
#pragma mark init
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
//        NSLog(@"%@",NSStringFromCGRect(frame));
        for (NSInteger i = 0; i < btnNum; ++i) {
//            创建按钮
            UIButton *btn = [[UIButton alloc]init];

//            设置颜色
//            btn.backgroundColor = [UIColor yellowColor];
//            设置背景图片
//            平常状态
            [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_normal-1"] forState:UIControlStateNormal];
//选中状态
            [btn setBackgroundImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
//            用户交互关闭，否则没法触发selected
            btn.userInteractionEnabled = NO;
            //            添加按钮
            [self addSubview:btn];
        }
    }
        return self;
}
#pragma mark 设置每个按钮的frame,绘制一个九宫格
-(void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat width = 80;
    CGFloat height = width;
//设置一行多少个按钮
    int colCount = 3;
//    间隔
    CGFloat margin = (self.bounds.size.width-width*colCount)/(colCount+1);
//    采用for循环设置九宫格
    for (NSInteger i = 0; i < btnNum; ++i) {
        CGFloat x = (i%colCount)*(margin+width)+margin;
        CGFloat y = (i/colCount)*(margin+height)+margin;
//        给每一个btn设置frame
        //这里为什么可以用subview，因为之前添加的9个button已经添加到subview中，而subview是一个只读数组，里面放了一个按钮
        UIButton *btn = self.subviews[i];
        btn.frame = CGRectMake(x, y, width, height);
    }
    
}

@end
