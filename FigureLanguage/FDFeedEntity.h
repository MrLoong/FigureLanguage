//
//  FDFeedEntity.h
//  FigureLanguage
//
//  Created by MrLoong on 15/8/22.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVOSCloud/AVOSCloud.h>

@interface FDFeedEntity : NSObject

- (FDFeedEntity *)initWithDictionary:(AVObject *)dictionary;


@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, strong) AVFile *imageName;

@end





