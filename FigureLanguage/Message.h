//
//  Message.h
//  FigureLanguage
//
//  Created by MrLoong on 15/9/20.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Message : NSObject

@property(nonatomic) NSString *title;
@property(nonatomic) NSString *text;

-(void)setText:(NSString *)text;
-(void)setTitle:(NSString *)title;

-(NSString *)getText;
-(NSString *)getTitle;

@end
