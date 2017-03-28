//
//  ViewController.m
//  音频录制
//
//  Created by yzl on 17/3/25.
//  Copyright © 2017年 yzl. All rights reserved.
//

#import "ViewController.h"

#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

/** 录制*/
@property(nonatomic, strong) AVAudioRecorder *recorder;
@end

@implementation ViewController

//用到的最伟大的方法

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSLog(@"开始录制");
    //对录制音频的文件进行一个保存 .caf格式  ---》如果想转换成mp3  需要用到lame3
    NSURL *url = [NSURL URLWithString:@"/Users/yzlMACAIR/Desktop/record.caf"];
    //url :录制文件保存的绝对路径
    //setting: 字典
    
    NSDictionary *recordSetting = [NSDictionary dictionaryWithObjectsAndKeys:[NSNumber numberWithInt:AVAudioQualityLow], AVEncoderAudioQualityKey,[NSNumber numberWithInt:16], AVEncoderBitRateKey, [NSNumber numberWithInt:2], AVNumberOfChannelsKey, [NSNumber numberWithFloat:44100.0], AVSampleRateKey, nil];
    
    self.recorder = [[AVAudioRecorder alloc] initWithURL:url settings:recordSetting error:nil];
    
    if (self.recorder) {
        [self.recorder prepareToRecord];
        [self.recorder record];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.recorder stop];
    NSLog(@"录制完成");
}


- (void)viewDidLoad {
    [super viewDidLoad];

    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
