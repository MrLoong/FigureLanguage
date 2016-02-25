//
//  TTSUIController.m
//  FigureLanguage
//
//  Created by MrLoong on 15/8/23.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

#import "TTSUIController.h"
#import <QuartzCore/QuartzCore.h>
#import <AVFoundation/AVAudioSession.h>
#import <AudioToolbox/AudioSession.h>
#import "Definition.h"
#import "PopupView.h"
#import "AlertView.h"
#import "TTSConfig.h"
#import "FigureLanguage-Swift.h"
#import "EYPopupViewHeader.h"
#import "ManageDataBase.h"




@interface TTSUIController ()<IFlySpeechSynthesizerDelegate,UIActionSheetDelegate>
@property (weak, nonatomic) IBOutlet UITextView *showTextField;

@end

@implementation TTSUIController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self getText];
    [SetBackGround setBack:@"ba" ui:self];
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStyleDone  target:self action:@selector(goBack)];
    self.navigationItem.rightBarButtonItem = button;
    // Do any additional setup after loading the view.
}

-(void )goBack{
    
    [EYInputPopupView popViewWithTitle:@"标题" contentText:@""
                                  type:EYInputPopupView_Type_multi_line
                           cancelBlock:^{
                               
                           } confirmBlock:^(UIView *view, NSString *text) {
                               NSLog(@"%@",text);
                               
                               [ManageDataBase addData:text withText:_showTextField.text];
                               
                               
                               
                           } dismissBlock:^{
                               
                           }];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self initSynthesizer];
}
- (IBAction)start:(UIButton *)sender {
    [self speakTalk:_showTextField.text];
}

-(void) getText{
    
    if(_imageString!=nil){

        [LinkHTTP getText:_showTextField imageString:_imageString];
        
    }else{
        
        NSLog(@"%@",_text);
        _showTextField.text = _text;
    }

    
   
}

-(void) speakTalk:(NSString*)text{
    if ([text isEqualToString:@""]) {
        
        [_popUpView showText:@"无效的文本信息"];
        return;
    }
    if (_audioPlayer != nil && _audioPlayer.isPlaying == YES) {
        [_audioPlayer stop];
    }
    
    _synType = NomalType;
    
    self.hasError = NO;
    [NSThread sleepForTimeInterval:0.05];
    
    [_inidicateView setText: @"正在缓冲..."];
    [_inidicateView show];
    
    [_popUpView removeFromSuperview];
    self.isCanceled = NO;
    
    _iFlySpeechSynthesizer.delegate = self;
    [_iFlySpeechSynthesizer startSpeaking:text];
    if (_iFlySpeechSynthesizer.isSpeaking) {
        _state = Playing;
    }
    
}

- (void)onCompleted:(IFlySpeechError *) error
{
    
    if (error.errorCode != 0) {
        [_inidicateView hide];
        [_popUpView showText:[NSString stringWithFormat:@"错误码:%d",error.errorCode]];
        return;
    }
    NSString *text ;
    if (self.isCanceled) {
        text = @"合成已取消";
    }else if (error.errorCode == 0) {
        text = @"合成结束";
    }else {
        text = [NSString stringWithFormat:@"发生错误：%d %@",error.errorCode,error.errorDesc];
        self.hasError = YES;
        NSLog(@"%@",text);
    }
    
    [_inidicateView hide];
    [_popUpView showText:text];
    
    _state = NotStart;
    
    if (_synType == UriType) {//Uri合成类型
        
        NSFileManager *fm = [NSFileManager defaultManager];
        if ([fm fileExistsAtPath:_uriPath]) {
            [self playUriAudio];//播放合成的音频
        }
    }
}

#pragma mark - 设置合成参数
- (void)initSynthesizer
{
    TTSConfig *instance = [TTSConfig sharedInstance];
    if (instance == nil) {
        return;
    }
    
    //合成服务单例
    if (_iFlySpeechSynthesizer == nil) {
        _iFlySpeechSynthesizer = [IFlySpeechSynthesizer sharedInstance];
    }
    
    _iFlySpeechSynthesizer.delegate = self;
    
    //设置语速1-100
    [_iFlySpeechSynthesizer setParameter:instance.speed forKey:[IFlySpeechConstant SPEED]];
    
    //设置音量1-100
    [_iFlySpeechSynthesizer setParameter:instance.volume forKey:[IFlySpeechConstant VOLUME]];
    
    //设置音调1-100
    [_iFlySpeechSynthesizer setParameter:instance.pitch forKey:[IFlySpeechConstant PITCH]];
    
    //设置采样率
    [_iFlySpeechSynthesizer setParameter:instance.sampleRate forKey:[IFlySpeechConstant SAMPLE_RATE]];
    
    
    //设置发音人
    [_iFlySpeechSynthesizer setParameter:instance.vcnName forKey:[IFlySpeechConstant VOICE_NAME]];
    
}
#pragma mark - 播放uri合成音频

- (void)playUriAudio
{
    TTSConfig *instance = [TTSConfig sharedInstance];
    [_popUpView showText:@"uri合成完毕，即将开始播放"];
    NSError *error = [[NSError alloc] init];
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:&error];
    _audioPlayer = [[PcmPlayer alloc] initWithFilePath:_uriPath sampleRate:[instance.sampleRate integerValue]];
    [_audioPlayer play];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
