//
//  ViewController.m
//  AVplaydemo
//
//  Created by Lee on 2017/6/23.
//  Copyright © 2017年 Lee. All rights reserved.
//

//AVPlayerViewController
#import "ViewController.h"
#import<AVKit/AVKit.h>
#import<AVFoundation/AVFoundation.h>

//avplayer
//#import <AVFoundation/AVFoundation.h>
#import<MediaPlayer/MediaPlayer.h>
#import<CoreMedia/CoreMedia.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [self test]; //AVPlayerViewController
    //  [self test2];  //avplayer
}
    
//AVPlayerViewController
-(void)test
{
    NSURL*url = [NSURL URLWithString:@"http://live.hkstv.hk.lxdns.com/live/hks/playlist.m3u8"];
    
    AVPlayerViewController* play = [[AVPlayerViewController alloc]init];
    
    play.player= [[AVPlayer alloc]initWithURL:url];
    
    play.allowsPictureInPicturePlayback=YES;//这个是允许画中画的
    
    [play.player play]; //这里我设置直接播放,页面弹出后会直接播放,要不然还需要点击一下播放按钮
  
    [self presentViewController:play animated:YES completion:nil];
    
        
}
    
    
//avplayer
-(void)test2
{
    NSURL*liveURL = [NSURL URLWithString:@"http://live.hkstv.hk.lxdns.com/live/hks/playlist.m3u8"]; //这个地址是抓的战旗的直播地址,假如不能用的话可以自己抓一下战旗的videoID="18620_aVSpe",随便找一个在直播的房间抓就可以.
    
    AVAsset *liveAsset = [AVURLAsset URLAssetWithURL:liveURL options:nil];
    
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:liveAsset];
    
    AVPlayer *player = [AVPlayer playerWithPlayerItem:playerItem];
    
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    
    playerLayer.frame=self.view.layer.bounds;
    
    playerLayer.videoGravity=AVLayerVideoGravityResizeAspect;
    
    [self.view.layer addSublayer:playerLayer];
    
    [player play];
        
}
    
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
