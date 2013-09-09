//
//  TMDMovie.h
//  PicStoryIOS
//
//  Created by Dong Yiming on 9/2/13.
//  Copyright (c) 2013 ToMaDon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TMDStory.h"

@protocol TMDMovieDelegate
@required
-(CGRect)movieRect;
-(void)addLayer:(CALayer *)aLayer;
@end

@interface TMDMovie : NSObject

@property (strong) NSMutableArray           *frames;
@property (weak)    id<TMDMovieDelegate>    delegate;

-(id)initWithStory:(TMDStory *)aStory;
-(void)play;
@end
