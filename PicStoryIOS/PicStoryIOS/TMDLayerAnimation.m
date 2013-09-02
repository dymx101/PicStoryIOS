//
//  TMDAnimation.m
//  PicStoryIOS
//
//  Created by Dong Yiming on 9/2/13.
//  Copyright (c) 2013 ToMaDon. All rights reserved.
//

#import "TMDLayerAnimation.h"

@implementation TMDLayerAnimation

+(void)pulse:(CALayer *)aLayer
{
    if (aLayer)
    {
        // Shrink down to 90% of its original value
        aLayer.transform = CATransform3DMakeScale(0.90, 0.90, 1);
        
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
        animation.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
        animation.autoreverses = YES;
        animation.duration = 0.35;
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
        animation.repeatCount = HUGE_VALF;
        [aLayer addAnimation:animation forKey:@"pulseAnimation"];
    }
}

@end
