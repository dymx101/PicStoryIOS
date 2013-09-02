//
//  TMDStory.h
//  PicStoryIOS
//
//  Created by Dong Yiming on 9/2/13.
//  Copyright (c) 2013 ToMaDon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMDStory : NSObject
@property (assign)      long long           ID;
@property (copy)        NSString            *title;
@property (assign)      long long           userID;
@property (copy)        NSString            *userName;
@property (strong)      NSDate              *publishDate;

@property (strong)      NSMutableArray      *pictures;

@property (copy)        NSString            *musicUrl;
@end
