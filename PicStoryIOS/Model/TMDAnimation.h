//
//  TMDAnimation.h
//  PicStoryIOS
//
//  Created by Dong Yiming on 9/10/13.
//  Copyright (c) 2013 ToMaDon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMDAnimation : NSObject

+(CABasicAnimation *)rotate:(int)aDegree;
+(CABasicAnimation *)opacityFrom:(float)aFrom to:(float)aTo;
+(CABasicAnimation *)translateFrom:(CGPoint)aFrom to:(CGPoint)aTo;

#pragma mark -
+(CATransition *)transitionFade;
+(CATransition *)transitionPushFromLeft;
@end
