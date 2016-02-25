//
//  AlertView.h
//  FigureLanguage
//
//  Created by MrLoong on 15/8/23.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AlertView : UIView

@property (nonatomic, strong) UILabel *textLabel;
@property (nonatomic, strong) UIActivityIndicatorView *aiv;
@property (nonatomic, strong) UIView*  ParentView;
@property (nonatomic, assign) int queueCount;

- (instancetype)initWithFrame:(CGRect)frame;

- (void)setText:(NSString *) text;

- (void)show;

- (void)hide;

@end
