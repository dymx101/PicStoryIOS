//
//  TMDFrame.h
//  PicStoryIOS
//
//  Created by Dong Yiming on 9/2/13.
//  Copyright (c) 2013 ToMaDon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMDFrame : NSObject
@property (copy)    NSString            *imagePath;
@property (strong)  CAAnimationGroup    *animationGroup;
@property (strong)  CAAnimation         *inAnimation;
@property (strong)  CAAnimation         *outAnimation;

@end
