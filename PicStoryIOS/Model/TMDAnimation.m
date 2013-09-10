//
//  TMDAnimation.m
//  PicStoryIOS
//
//  Created by Dong Yiming on 9/10/13.
//  Copyright (c) 2013 ToMaDon. All rights reserved.
//

#import "TMDAnimation.h"

#define DEGREE_TO_RADIAN(x)     (x) * M_PI / 180.f

@implementation TMDAnimation

+(CABasicAnimation *)rotate:(int)aDegree
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.toValue = @(DEGREE_TO_RADIAN(aDegree));
    
    return animation;
}

+(CABasicAnimation *)opacityFrom:(float)aFrom to:(float)aTo
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = @(aFrom);
    animation.toValue = @(aTo);
    
    return animation;
}

+(CABasicAnimation *)translateFrom:(CGPoint)aFrom to:(CGPoint)aTo
{
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.fromValue = [NSValue valueWithCGPoint:aFrom];
    animation.toValue = [NSValue valueWithCGPoint:aTo];
    
    return animation;
}

#pragma mark -
+(CATransition *)transitionPushFromLeft
{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    
    return transition;
}

+(CATransition *)transitionFade
{
    CATransition *trans = [CATransition animation];
    trans.type = kCATransitionFade;
    
    return trans;
}

@end
