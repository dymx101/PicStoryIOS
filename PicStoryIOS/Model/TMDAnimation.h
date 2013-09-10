//
//  TMDAnimation.h
//  PicStoryIOS
//
//  Created by Dong Yiming on 9/10/13.
//  Copyright (c) 2013 ToMaDon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMDAnimation : NSObject
AS_SINGLETON(TMDAnimation)

-(CABasicAnimation *)rotate:(int)aDegree;
-(CABasicAnimation *)opacityFrom:(float)aFrom to:(float)aTo;
-(CABasicAnimation *)translateFrom:(CGPoint)aFrom to:(CGPoint)aTo;

#pragma mark -

-(CATransition *)transitionPushFromLeft;
-(CATransition *)transitionPushFromRight;
-(CATransition *)transitionPushFromBottom;
-(CATransition *)transitionPushFromTop;

-(CATransition *)transitionMoveInFromTop;
-(CATransition *)transitionMoveInFromBottom;
-(CATransition *)transitionMoveInFromLeft;
-(CATransition *)transitionMoveInFromRight;

-(CATransition *)transitionRevalFromTop;
-(CATransition *)transitionRevalFromBottom;
-(CATransition *)transitionRevalFromLeft;
-(CATransition *)transitionRevalFromRight;

-(CATransition *)transitionFlipFromTop;
-(CATransition *)transitionFlipFromBottom;
-(CATransition *)transitionFlipFromLeft;
-(CATransition *)transitionFlipFromRight;

-(CATransition *)transitionCubeFromTop;
-(CATransition *)transitionCubeFromBottom;
-(CATransition *)transitionCubeFromLeft;
-(CATransition *)transitionCubeFromRight;

-(CATransition *)transitionPageCurlFromTop;
-(CATransition *)transitionPageCurlFromBottom;
-(CATransition *)transitionPageCurlFromLeft;
-(CATransition *)transitionPageCurlFromRight;

-(CATransition *)transitionPageUnCurlFromTop;
-(CATransition *)transitionPageUnCurlFromBottom;
-(CATransition *)transitionPageUnCurlFromLeft;
-(CATransition *)transitionPageUnCurlFromRight;


-(CATransition *)transitionFade;
-(CATransition *)transitionSuck;
-(CATransition *)transitionRipple;
-(CATransition *)transitionCameraOpen;
-(CATransition *)transitionCameraClose;
-(CATransition *)transitionRotate;

-(CATransition *)transitionRandom;

@end
