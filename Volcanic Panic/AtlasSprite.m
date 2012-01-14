//
//  AtlasSprite.m
//  ZombieGame
//
//  Created by Langford Thomas on 12/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AtlasSprite.h"

@implementation AtlasSprite 

@synthesize w2,h2,rows,columns;
@synthesize image,atlas,atlasWidth,atlasHeight,clipRect;

- (id) init {
    self = [super init];
    if(self) {
        rows = 0;
        columns = 0;
    }
    return self;
}

+ (NSMutableDictionary *) sharedSpriteAtlas {
    static NSMutableDictionary *sharedSpriteDictionary;
    @synchronized(self) {
        if (!sharedSpriteDictionary) {
            sharedSpriteDictionary = [[NSMutableDictionary alloc] init];
            return sharedSpriteDictionary;
        }
    }
    return sharedSpriteDictionary;
}

+ (UIImage *) getSpriteAtlas:(NSString *)name {
    NSMutableDictionary *dict = [AtlasSprite sharedSpriteAtlas];
    UIImage *img = [dict objectForKey:name];
    if (!img) {
        img = [[UIImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:nil]];
        [dict setObject:img forKey:name];
    }
    return img;
}

+ (AtlasSprite *) fromFile:(NSString *)fname withRows:(int)rows withColumns:(int)columns {
    AtlasSprite *sprite = [[AtlasSprite alloc] init];
    sprite.atlas = [AtlasSprite getSpriteAtlas:fname];
    CGImageRef img = [sprite.atlas CGImage];
    sprite.image = img;
    
    int width = CGImageGetWidth(sprite.image);
    int height = CGImageGetHeight(sprite.image);
    sprite.atlasWidth = width;
    sprite.atlasHeight = height;
    if(rows < 1) rows=1;
    if(columns < 1) columns=1;
    sprite.rows = rows;
    sprite.columns = columns;
    sprite.width = round(width/sprite.columns);
    sprite.height = round(height/sprite.rows);
    sprite.w2 = sprite.width*0.5;
    sprite.h2 = sprite.height*0.5;
    sprite.clipRect = CGRectMake(-sprite.w2, -sprite.h2, sprite.width, sprite.height);
    return sprite;
}

- (void) drawBody:(CGContextRef)context {
    int row0 = floor(frame/columns);
    int column0 = frame - columns * row0;
    CGFloat u = column0 * width + w2;
    CGFloat v = atlasHeight - (row0 * height + h2);
    
    CGContextBeginPath(context);
    CGContextAddRect(context, clipRect);
    CGContextClip(context);
    
    CGContextDrawImage(context, CGRectMake(-u, -v, atlasWidth, atlasHeight), image);
}

@end
