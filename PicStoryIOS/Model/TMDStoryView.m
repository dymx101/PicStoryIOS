//
//  TMDStoryView.m
//  PicStoryIOS
//
//  Created by Dong Yiming on 9/9/13.
//  Copyright (c) 2013 ToMaDon. All rights reserved.
//

#import "TMDStoryView.h"
#import "TMDMovie.h"

@interface TMDStoryView () <TMDMovieDelegate>

@end

@implementation TMDStoryView
{
    TMDStory    *_story;
    TMDMovie    *_movie;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self doInit];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self doInit];
    }
    return self;
}

-(void)doInit
{
    self.backgroundColor = [UIColor clearColor];
    self.clipsToBounds = YES;
    self.layer.masksToBounds = YES;
    
    [self emitSnows];
}


-(void)setStory:(TMDStory *)aStory
{
    _story = aStory;
    _movie = [[TMDMovie alloc] initWithStory:_story delegate:self];
    _movie.delegate = self;
}

-(void)play
{
    [_movie play];
}

#pragma mark -
-(CGRect)movieRect
{
    return self.bounds;
}

-(void)addLayer:(CALayer *)aLayer
{
    [self.layer addSublayer:aLayer];
}

-(void)emitSnows
{
    // Configure the particle emitter to the top edge of the screen
	CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    snowEmitter.zPosition = 1000;
	snowEmitter.emitterPosition = CGPointMake(self.bounds.size.width / 2.0, -30);
	snowEmitter.emitterSize		= CGSizeMake(self.bounds.size.width * 2.0, 0.0);;
	
	// Spawn points for the flakes are within on the outline of the line
	snowEmitter.emitterMode		= kCAEmitterLayerOutline;
	snowEmitter.emitterShape	= kCAEmitterLayerLine;
	
	// Configure the snowflake emitter cell
	CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
	
	snowflake.birthRate		= 1.0;
	snowflake.lifetime		= 120.0;
	
	snowflake.velocity		= -10;				// falling down slowly
	snowflake.velocityRange = 10;
	snowflake.yAcceleration = 2;
	snowflake.emissionRange = 0.5 * M_PI;		// some variation in angle
	snowflake.spinRange		= 0.25 * M_PI;		// slow spin
	
	snowflake.contents		= (id) [[UIImage imageNamed:@"DazFlake"] CGImage];
	snowflake.color			= [[UIColor colorWithRed:0.600 green:0.658 blue:0.743 alpha:1.000] CGColor];
    
	// Make the flakes seem inset in the background
	snowEmitter.shadowOpacity = 1.0;
	snowEmitter.shadowRadius  = 0.0;
	snowEmitter.shadowOffset  = CGSizeMake(0.0, 1.0);
	snowEmitter.shadowColor   = [[UIColor whiteColor] CGColor];
	
	// Add everything to our backing layer below the UIContol defined in the storyboard
	snowEmitter.emitterCells = [NSArray arrayWithObject:snowflake];
	[self.layer insertSublayer:snowEmitter atIndex:0];
}

@end
