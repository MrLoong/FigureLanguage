//
//  PopupView.h
//  FigureLanguage
//
//  Created by MrLoong on 15/8/23.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopupView : UIView

@property (nonatomic,strong) UILabel *textLabel;
@property (nonatomic,strong) UIView*  ParentView;
@property (nonatomic,assign) int queueCount;


/**
 初始popUpView
 ****/
- (id)initWithFrame:(CGRect)frame withParentView:(UIView*)view;


/**
 直接调用下面接口可以显示
 ****/
- (void)showText:(NSString *)text;


/**
 请不要使用下面接口
 ****/
- (void)setText:(NSString *) text;//deprecated..

@end
