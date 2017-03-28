//
//  YYSpeechController.m
//  音频录制
//
//  Created by yzl on 17/3/25.
//  Copyright © 2017年 yzl. All rights reserved.
//

#import "YYSpeechController.h"

@interface YYSpeechController ()

//实例化
/** synthesizer*/
@property(nonatomic, strong) AVSpeechSynthesizer *synthesizer;

/** 语音设置器*/
@property(nonatomic, strong) NSArray *voice;

/** 需要转化的文本*/
@property(nonatomic, strong) NSArray *speechString;

@end

@implementation YYSpeechController

//类方法用来实例化语音合成控制器
+ (instancetype)speechController{
    return [[self alloc] init];
}

- (instancetype)init{
    self = [super init];
    if (self) {
        //初始化语音合成器
        _synthesizer = [[AVSpeechSynthesizer alloc] init];
        
        //设置我们需要发出的声音，比如说是英文还是中文，还是说亚麻跌
        _voice = @[[AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"], [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"]];
        
        //文本
        _speechString = [self buildString];
    
        
    }
    return self;
}
//是语音转文本的核心方法， 文本转语音完全是依靠这个方法
- (void)beginConversation{
    //给你的文本 ---->数组...
    for (NSInteger i = 0; i < _speechString.count; i++) {
        //去出我们的字符 --->转成语音
        
        //舌头
        AVSpeechUtterance *Utterance = [[AVSpeechUtterance alloc] initWithString:self.speechString[i]];
        //设置舌头
        Utterance.volume = 1;//音量
        Utterance.pitchMultiplier = 0.8; //音调
        Utterance.voice = self.voice[i%2];
        Utterance.rate = 1.2;//说话速度
        Utterance.postUtteranceDelay = 0.1; //延迟播放
        //给我说话
        [self.synthesizer speakUtterance:Utterance];
        
        
        
    }
}

- (NSArray *)buildString {
    return @[@"hello",
             @"你好"];
}
@end
