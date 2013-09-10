//
//  TMDMovie.m
//  PicStoryIOS
//
//  Created by Dong Yiming on 9/2/13.
//  Copyright (c) 2013 ToMaDon. All rights reserved.
//

#import "TMDMovie.h"
#import "TMDFrame.h"
#import "TMDAnimation.h"

@implementation TMDMovie
{
    TMDStory                        *_story;
    NSUInteger                      _currentFrameIndex;
}

-(id)initWithStory:(TMDStory *)aStory delegate:(id)aDelegate
{
    self = [super init];
    if (self)
    {
        _delegate = aDelegate;
        _frames = [NSMutableArray array];
        _story = aStory;
        [self doInitFrames];
    }
    
    return self;
}

#define STAGE_TIME  (5.f)
-(CAAnimationGroup *)groupWithAnimations:(NSArray *)aAnimations
{
    if (aAnimations.count)
    {
        CAAnimationGroup *animGroup = [CAAnimationGroup animation];
        animGroup.animations = aAnimations;
        float duration = 0.f;
        for (CAAnimation *animation in aAnimations)
        {
            duration += animation.duration;
        }
        
        animGroup.duration = (duration ? duration : STAGE_TIME);
        animGroup.delegate = self;
        return animGroup;
    }
    
    return nil;
}

-(void)doInitFrames
{
    for (UIImage *pic in _story.pictures)
    {
        TMDFrame *frame = [TMDFrame new];
        frame.pic = [pic isKindOfClass:[UIImage class]] ? pic : nil;
        
//        CABasicAnimation *inAnimation = [TMDAnimation rotate:360];
//        inAnimation.duration = .3f;
        
        CAAnimation *anim = [CAAnimation animation];
        anim.duration = .1f;
        anim.delegate = self;
        frame.inAnimation = anim;//[self groupWithAnimations:@[anim]];
        
        
        CAAnimation *outAnimation = [[TMDAnimation sharedInstance] transitionRandom];
        outAnimation.duration = .5f;
        outAnimation.delegate = self;
        frame.outAnimation = outAnimation;//[self groupWithAnimations:@[outAnimation]];
        
        
        CAAnimation *stageAnim = [CAAnimation animation];
        stageAnim.duration = STAGE_TIME;
        stageAnim.delegate = self;
        frame.stageAnimation = stageAnim;//[self groupWithAnimations:@[[CAAnimation animation]]];
        
        [_frames addObject:frame];
    }
}

-(void)play
{
    [self _playCurrentFrame];
}

-(void)_playCurrentFrame
{
    if (_currentFrameIndex >= _frames.count)
    {
        _currentFrameIndex = 0;
    }
    
    TMDFrame *frame = _frames[_currentFrameIndex];
    
    CALayer *layer = [self _createLayer];
    layer.contents = (id)(frame.pic.CGImage);
    [layer addAnimation:frame.inAnimation forKey:@"in"];
    frame.layer = layer;
    
    [_delegate addLayer:layer];
}

-(CALayer *)_createLayer
{
    CALayer *layer = [CALayer layer];
    
    layer.bounds = _delegate.movieRect;
    layer.position = CGPointMake(layer.bounds.size.width / 2, layer.bounds.size.height / 2);
    layer.backgroundColor = [UIColor blackColor].CGColor;
    layer.opacity = 1.0f;
    
    return layer;
}

-(TMDFrame *)frameAt:(NSUInteger)aIndex
{
    if (aIndex < _frames.count)
    {
        return _frames[aIndex];
    }
    
    return nil;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    TMDFrame *frame = [self frameAt:_currentFrameIndex];
    //TMDFrame *framePrev = [self frameAt:_currentFrameIndex - 1];
    TMDFrame *frameNext = [self frameAt:_currentFrameIndex + 1];
    
    [CATransaction setDisableActions:YES];
    
    switch (frame.state)
    {
        case kTMDFrameAnimStateIn:
        {
            [frame.layer addAnimation:frame.stageAnimation forKey:@"anim"];
            frame.state = kTMDFrameAnimStateAnim;
        }
            break;
            
        case kTMDFrameAnimStateAnim:
        {
            [frame.layer addAnimation:frame.outAnimation forKey:@"out"];
            
            if (frameNext)
            {
                frame.layer.contents = (id)(frameNext.pic.CGImage);
            }
            else
            {
                TMDFrame *frameFirst = [self frameAt:0];
                if (frameFirst)
                {
                    frame.layer.contents = (id)(frameFirst.pic.CGImage);
                }
            }
            
            frame.state = kTMDFrameAnimStateOut;
        }
            break;
            
        case kTMDFrameAnimStateOut:
        {
            // change the transition animation
            CAAnimation *outAnimation = [[TMDAnimation sharedInstance] transitionRandom];
            outAnimation.duration = .5f;
            outAnimation.delegate = self;
            frame.outAnimation = outAnimation;
            
            //
            frame.layer.contents = (id)(frame.pic.CGImage);
            [frame.layer removeFromSuperlayer];
            frame.state = kTMDFrameAnimStateIn;
            
            _currentFrameIndex++;
            [self _playCurrentFrame];
        }
            break;
            
        default:
            break;
    }
}

@end
