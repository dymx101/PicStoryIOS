//
//  TMDMovie.m
//  PicStoryIOS
//
//  Created by Dong Yiming on 9/2/13.
//  Copyright (c) 2013 ToMaDon. All rights reserved.
//

#import "TMDMovie.h"
#import "TMDFrame.h"

@implementation TMDMovie
{
    TMDStory                        *_story;
    NSUInteger                      _currentFrameIndex;
}

-(id)initWithStory:(TMDStory *)aStory
{
    self = [super init];
    if (self)
    {
        _frames = [NSMutableArray array];
        _story = aStory;
        [self doInitFrames];
    }
    
    return self;
}

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
        
        animGroup.duration = (duration ? duration : 2.f);
        animGroup.delegate = self;
        return animGroup;
    }
    
    return nil;
}

-(void)doInitFrames
{
    //NSUInteger picCount = _story.pictures.count;
    for (UIImage *pic in _story.pictures)
    {
        TMDFrame *frame = [TMDFrame new];
        frame.pic = pic;
        
        CABasicAnimation *inAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        inAnimation.toValue = @(2 * M_PI);
        inAnimation.duration = .3f;
        frame.inAnimation = [self groupWithAnimations:@[inAnimation]];
        
        CABasicAnimation *outAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        outAnimation.toValue = @(2 * M_PI);
        outAnimation.duration = .3f;
        frame.outAnimation = [self groupWithAnimations:@[outAnimation]];
        
        
        CABasicAnimation *animationStep1 = [CABasicAnimation animationWithKeyPath:@"opacity"];
        animationStep1.fromValue = @(1.f);
        animationStep1.toValue = @(1.f);
        animationStep1.duration = 1.f;
        
//        CABasicAnimation *animationStep2 = [CABasicAnimation animationWithKeyPath:frame.animationKey];
//        animationStep2.fromValue = @(1.f);
//        animationStep2.toValue = @(0.f);
//        animationStep2.duration = 1.f;
        CAAnimationGroup *animGroup = [CAAnimationGroup animation];
        animGroup.animations = @[animationStep1];
        animGroup.duration = 2.f;
        animGroup.delegate = self;
        frame.stageAnimation = animGroup;
        
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

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    TMDFrame *frame = _frames[_currentFrameIndex];
    [CATransaction setDisableActions:YES];
    
    switch (frame.state)
    {
        case kTMDFrameAnimStateIn:
        {
            [frame.layer addAnimation:frame.stageAnimation forKey:@"anim"];
            frame.state = kTMDFrameAnimStateAnim;
            //[frame.layer setValue:frame.animation.fromValue forKey:frame.animationKey];
        }
            break;
            
        case kTMDFrameAnimStateAnim:
        {
            [frame.layer addAnimation:frame.outAnimation forKey:@"out"];
            frame.state = kTMDFrameAnimStateOut;
            //[frame.layer setValue:frame.animation.toValue forKey:frame.animationKey];
        }
            break;
            
        case kTMDFrameAnimStateOut:
        {
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
