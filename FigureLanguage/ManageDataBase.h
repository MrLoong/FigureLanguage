//
//  ManageDataBase.h
//  FigureLanguage
//
//  Created by MrLoong on 15/9/20.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Message.h"

@interface ManageDataBase : NSObject

+(void)LoadData;
+(void)addData :(NSString *)title withText:(NSString *)text;
+(NSArray *)searchdata;
+(void)UdataData;
+(void)deleteData;

@end
