//
//  Message.m
//  FigureLanguage
//
//  Created by MrLoong on 15/9/20.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

#import "Message.h"


@implementation Message

-(void)setText:(NSString *)text{
    _text = text;
}

-(void)setTitle:(NSString *)title{
    _title = title;
}



-(NSString *)getText{
    return _text;
}
-(NSString *)getTitle{
    return _title;
}


@end
