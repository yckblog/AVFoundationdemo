//
//  YuyinzhuanhuanViewController.m
//  音频录制
//
//  Created by yzl on 17/3/25.
//  Copyright © 2017年 yzl. All rights reserved.
//

#import "YuyinzhuanhuanViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "YYSpeechController.h"
@interface YuyinzhuanhuanViewController ()<AVSpeechSynthesizerDelegate>

/** 转换器*/
@property(nonatomic, strong) YYSpeechController *speechController;

/** speechArray*/
@property(nonatomic, strong) NSMutableArray *speechArray;

/** table*/
@property(nonatomic, strong) UITableView *tableView;
@end

@implementation YuyinzhuanhuanViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.speechController = [YYSpeechController speechController];
    self.speechController.synthesizer.delegate = self;
    
    
    //那么我们的可变数组永远为空
    
    //还没开口说
    [self.speechController beginConversation];
    
}

- (void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance{
    [self.speechArray addObject:utterance.speechString];
    
//    [self.tableView reloadData];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.speechArray.count - 1 inSection:0];
    
    
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
    
}

- (NSMutableArray *)speechArray{
    if (!_speechArray) {
        _speechArray = [NSMutableArray array];
    }
    return _speechArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
