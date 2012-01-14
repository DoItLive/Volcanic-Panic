//
//  AtlasSprite.h
//  ZombieGame
//
//  Created by Langford Thomas on 12/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sprite.h"

@interface AtlasSprite : Sprite {
    CGFloat w2;
    CGFloat h2;
    CGFloat atlasWidth;
    CGFloat atlasHeight;
    UIImage *atlas;
    CGImageRef image;
    CGRect clipRect;
    int rows;
    int columns;
}

@property (assign) CGFloat w2,h2,atlasWidth,atlasHeight;
@property (assign) CGRect clipRect;
@property (assign) int rows, columns;
@property (retain, nonatomic) UIImage *atlas;
@property (assign) CGImageRef image;

+ (AtlasSprite *) fromFile: (NSString *)fname withRows: (int)rows withColumns: (int)columns;
+ (NSMutableDictionary *) sharedSpriteAtlas;
+ (UIImage *) getSpriteAtlas: (NSString *)name;

@end
