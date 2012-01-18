//
//  Sprite.h
//  ZombieGame
//
//  Created by Langford Thomas on 12/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Defs.h"

@interface Sprite : NSObject {
    CGFloat x;
    CGFloat y;
    CGFloat alpha;
    CGFloat speed;
    CGFloat rotation;
    CGFloat width;
    CGFloat height;
    CGFloat scale;
    int frame;
    
    CGRect box;
    
    BOOL render;
    BOOL offScreen;
    BOOL wrap;
}

@property (assign) BOOL wrap, render, offScreen;
@property (assign) CGFloat x, y, alpha;
@property (assign) CGFloat speed, rotation;
@property (assign) CGFloat width, height, scale;
@property (assign) CGRect box;
@property (assign) int frame;

- (void) outlinePath: (CGContextRef) context;
- (void) drawBody: (CGContextRef) context;
- (void) draw: (CGContextRef) context;
- (void) updateBox;
- (void) drawBoundingBox: (CGContextRef) context;
- (void) tic: (NSTimeInterval) dt;

@end
