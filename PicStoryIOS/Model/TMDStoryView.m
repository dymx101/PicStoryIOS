//
//  TMDStoryView.m
//  PicStoryIOS
//
//  Created by Dong Yiming on 9/9/13.
//  Copyright (c) 2013 ToMaDon. All rights reserved.
//

#import "TMDStoryView.h"

@implementation TMDStoryView
{
    TMDStory    *_story;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor cyanColor];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [UIColor cyanColor];
    }
    return self;
}


-(void)setStory:(TMDStory *)aStory
{
    _story = aStory;
}

@end
