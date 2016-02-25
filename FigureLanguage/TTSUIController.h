//
//  TTSUIController.h
//  FigureLanguage
//
//  Created by MrLoong on 15/8/23.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "iflyMSC/iflyMSC.h"
#import "PcmPlayer.h"


@class AlertView;
@class PopupView;
@class IFlySpeechSynthesizer;

typedef NS_OPTIONS(NSInteger, SynthesizeType) {
    NomalType           = 5,//普通合成
    UriType             = 6, //uri合成
};


typedef NS_OPTIONS(NSInteger, Status) {
    NotStart            = 0,
    Playing             = 2, //高异常分析需要的级别
    Paused              = 4,
};



@interface TTSUIController : UIViewController

@property (nonatomic,strong) NSString *imageString;
@property (nonatomic,strong)NSString *text;


@property (nonatomic, strong) IFlySpeechSynthesizer * iFlySpeechSynthesizer;

@property (nonatomic, strong) PopupView *popUpView;
@property (nonatomic, strong) AlertView *inidicateView;



@property (nonatomic, assign) BOOL isCanceled;
@property (nonatomic, assign) BOOL hasError;
@property (nonatomic, assign) BOOL isViewDidDisappear;


@property (nonatomic, strong) NSString *uriPath;
@property (nonatomic, strong) PcmPlayer *audioPlayer;

@property (nonatomic, assign) Status state;
@property (nonatomic, assign) SynthesizeType synType;

@end
