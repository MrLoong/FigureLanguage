//
//  OperationalCloud.h
//  FigureLanguage
//
//  Created by MrLoong on 15/8/27.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVOSCloud/AVOSCloud.h>
#import <UIKit/UIKit.h>
#import "FDFeedEntity.h"

@interface OperationalCloud : NSObject

@property(nonatomic,strong) NSArray *array;

+(void) saveCloud:(NSString *)content over:(NSString *)pubUser over:(NSString *)pubTimestamp over:(NSString *)title over:(UIImage *) imageName over:(NSString *)type;
+ (NSArray *) getCloud ;
+ (UIImage *) text:(AVFile *) imageFile;

@end
