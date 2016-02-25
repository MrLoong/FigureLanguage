//
//  Long.m
//  FigureLanguage
//
//  Created by MrLoong on 15/8/23.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

#import "Long.h"
#import "iflyMSC/IFlyMSC.h"
#import "Definition.h"
#import "IFlyFlowerCollector.h"

@implementation Long

+(void) initXunFei{
    //设置sdk的log等级，log保存在下面设置的工作路径中
    [IFlySetting setLogFile:LVL_ALL];
    
    //打开输出在console的log开关
    [IFlySetting showLogcat:YES];
    
    //设置sdk的工作路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [paths objectAtIndex:0];
    [IFlySetting setLogFilePath:cachePath];
    
    //创建语音配置,appid必须要传入，仅执行一次则可
    NSString *initString = [[NSString alloc] initWithFormat:@"appid=%@",APPID_VALUE];
    
    //所有服务启动前，需要确保执行createUtility
    [IFlySpeechUtility createUtility:initString];
    
    //科大讯飞数据统计分析功能，开启，详细情况可以参照doc下的数据分析集成指南
    [IFlyFlowerCollector SetDebugMode:YES];
    [IFlyFlowerCollector SetCaptureUncaughtException:YES];
    [IFlyFlowerCollector SetAppid:APPID_VALUE];
    [IFlyFlowerCollector SetAutoLocation:YES];
}

@end
