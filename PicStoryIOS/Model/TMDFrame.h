//
//  TMDFrame.h
//  PicStoryIOS
//
//  Created by Dong Yiming on 9/2/13.
//  Copyright (c) 2013 ToMaDon. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum
{
    kTMDFrameAnimStateIn = 0
    , kTMDFrameAnimStateAnim
    , kTMDFrameAnimStateOut
}ETMDFrameAnimState;

@interface TMDFrame : NSObject
@property (strong)    UIImage           *pic;

@property (strong)  CAAnimationGroup         *inAnimation;
@property (strong)  CAAnimationGroup         *stageAnimation;
@property (strong)  CAAnimationGroup         *outAnimation;

@property (strong) CALayer              *layer;
@property (assign)  ETMDFrameAnimState  state;

@end
