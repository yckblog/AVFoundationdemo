//
//  YYSpeechController.h
//  音频录制
//
//  Created by yzl on 17/3/25.
//  Copyright © 2017年 yzl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
@interface YYSpeechController : NSObject

/** 合成器*/
@property(nonatomic, strong, readonly) AVSpeechSynthesizer *synthesizer;
//类方法用来实例化语音合成控制器
+ (instancetype)speechController;

//
- (void)beginConversation;


@end
