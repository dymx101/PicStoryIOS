//
//  TMDMovie.h
//  PicStoryIOS
//
//  Created by Dong Yiming on 9/2/13.
//  Copyright (c) 2013 ToMaDon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMDStory.h"

@interface TMDMovie : NSObject
@property (strong) TMDStory             *story;
@property (strong) NSMutableArray       *frames;

-(id)initWithStory:(TMDStory *)aStory;
@end
