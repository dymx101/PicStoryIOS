//
//  TMDAnimation.m
//  PicStoryIOS
//
//  Created by Dong Yiming on 9/10/13.
//  Copyright (c) 2013 ToMaDon. All rights reserved.
//

#import "TMDAnimation.h"

#define DEGREE_TO_RADIAN(x)     (x) * M_PI / 180.f


#define TRANS_TYPE_FLIP             @"flip"
#define TRANS_TYPE_CUBE             @"cube"
#define TRANS_TYPE_PAGE_CURL        @"pageCurl"
#define TRANS_TYPE_SUCK             @"suckEffect"
#define TRANS_TYPE_RIPPLE           @"rippleEffect"
#define TRANS_TYPE_PAGE_UN_CURL     @"pageUnCurl"

#define TRANS_TYPE_CAMERA_OPEN      @"cameraIrisHollowOpen"
#define TRANS_TYPE_CAMERA_CLOSE     @"cameraIrisHollowClose"


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

#pragma mark - transitions
+(CATransition *)transitionPushFromLeft
{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromLeft;
    
    return transition;
}

+(CATransition *)transitionPushFromRight
{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromRight;
    
    return transition;
}

+(CATransition *)transitionPushFromBottom
{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromBottom;
    
    return transition;
}

+(CATransition *)transitionPushFromTop
{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionPush;
    transition.subtype = kCATransitionFromTop;
    
    return transition;
}

//////////
+(CATransition *)transitionMoveInFromTop
{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromTop;
    
    return transition;
}

+(CATransition *)transitionMoveInFromBottom
{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromBottom;
    
    return transition;
}

+(CATransition *)transitionMoveInFromLeft
{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromLeft;
    
    return transition;
}

+(CATransition *)transitionMoveInFromRight
{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionMoveIn;
    transition.subtype = kCATransitionFromRight;
    
    return transition;
}


////
+(CATransition *)transitionRevalFromTop
{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromTop;
    
    return transition;
}

+(CATransition *)transitionRevalFromBottom
{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromBottom;
    
    return transition;
}

+(CATransition *)transitionRevalFromLeft
{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromLeft;
    
    return transition;
}

+(CATransition *)transitionRevalFromRight
{
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromRight;
    
    return transition;
}

///////


+(CATransition *)transitionFlipFromTop
{
    CATransition *transition = [CATransition animation];
    transition.type = TRANS_TYPE_FLIP;
    transition.subtype = kCATransitionFromTop;//@"fromTop";
    
    return transition;
}

+(CATransition *)transitionFlipFromBottom
{
    CATransition *transition = [CATransition animation];
    transition.type = TRANS_TYPE_FLIP;
    transition.subtype = kCATransitionFromBottom;//@"fromBottom";
    
    return transition;
}

+(CATransition *)transitionFlipFromLeft
{
    CATransition *transition = [CATransition animation];
    transition.type = TRANS_TYPE_FLIP;
    transition.subtype = kCATransitionFromLeft;//@"fromLeft";
    
    return transition;
}

+(CATransition *)transitionFlipFromRight
{
    CATransition *transition = [CATransition animation];
    transition.type = TRANS_TYPE_FLIP;
    transition.subtype = kCATransitionFromRight;//@"fromRight";
    
    return transition;
}

/////////////
+(CATransition *)transitionCubeFromTop
{
    CATransition *transition = [CATransition animation];
    transition.type = TRANS_TYPE_CUBE;
    transition.subtype = kCATransitionFromTop;//@"fromTop";
    
    return transition;
}

+(CATransition *)transitionCubeFromBottom
{
    CATransition *transition = [CATransition animation];
    transition.type = TRANS_TYPE_CUBE;
    transition.subtype = kCATransitionFromBottom;//@"fromBottom";
    
    return transition;
}

+(CATransition *)transitionCubeFromLeft
{
    CATransition *transition = [CATransition animation];
    transition.type = TRANS_TYPE_CUBE;
    transition.subtype = kCATransitionFromLeft;//@"fromLeft";
    
    return transition;
}

+(CATransition *)transitionCubeFromRight
{
    CATransition *transition = [CATransition animation];
    transition.type = TRANS_TYPE_CUBE;
    transition.subtype = kCATransitionFromRight;//@"fromRight";
    
    return transition;
}

///////
+(CATransition *)transitionPageCurlFromTop
{
    CATransition *transition = [CATransition animation];
    transition.type = TRANS_TYPE_PAGE_CURL;
    transition.subtype = kCATransitionFromTop;
    
    return transition;
}

+(CATransition *)transitionPageCurlFromBottom
{
    CATransition *transition = [CATransition animation];
    transition.type = TRANS_TYPE_PAGE_CURL;
    transition.subtype = kCATransitionFromBottom;
    
    return transition;
}

+(CATransition *)transitionPageCurlFromLeft
{
    CATransition *transition = [CATransition animation];
    transition.type = TRANS_TYPE_PAGE_CURL;
    transition.subtype = kCATransitionFromLeft;
    
    return transition;
}

+(CATransition *)transitionPageCurlFromRight
{
    CATransition *transition = [CATransition animation];
    transition.type = TRANS_TYPE_PAGE_CURL;
    transition.subtype = kCATransitionFromRight;
    
    return transition;
}

/////////////////////
+(CATransition *)transitionFade
{
    CATransition *trans = [CATransition animation];
    trans.type = kCATransitionFade;
    
    return trans;
}

+(CATransition *)transitionSuck
{
    CATransition *trans = [CATransition animation];
    trans.type = TRANS_TYPE_SUCK;
    
    return trans;
}

@end



///* 过渡效果
// fade     //交叉淡化过渡(不支持过渡方向)
// push     //新视图把旧视图推出去
// moveIn   //新视图移到旧视图上面
// reveal   //将旧视图移开,显示下面的新视图
// cube     //立方体翻滚效果
// oglFlip  //上下左右翻转效果
// suckEffect   //收缩效果，如一块布被抽走(不支持过渡方向)
// rippleEffect //滴水效果(不支持过渡方向)
// pageCurl     //向上翻页效果
// pageUnCurl   //向下翻页效果
// cameraIrisHollowOpen  //相机镜头打开效果(不支持过渡方向)
// cameraIrisHollowClose //相机镜头关上效果(不支持过渡方向)
// */
//
///* 过渡方向
// fromRight;
// fromLeft;
// fromTop;
// fromBottom;
// */
//CATransition *animation = [CATransition animation];
//animation.delegate = self;
//animation.duration = 0.5f; //动画时长
//animation.timingFunction = UIViewAnimationCurveEaseInOut;
//animation.fillMode = kCAFillModeForwards;
//animation.type = @"cube"; //过度效果
//animation.subtype = @"formLeft"; //过渡方向
//animation.startProgress = 0.0 //动画开始起点(在整体动画的百分比)
//animation.endProgress = 1.0;  //动画停止终点(在整体动画的百分比)
//animation.removedOnCompletion = NO;
//[self.view.layer addAnimation:animation forKey:@"animation"];
