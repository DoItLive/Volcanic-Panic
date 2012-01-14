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
    CGFloat r;
    CGFloat g;
    CGFloat b;
    CGFloat alpha;
    CGFloat speed;
    CGFloat angle;
    CGFloat rotation;
    CGFloat width;
    CGFloat height;
    CGFloat scale;
    int frame;
    
    CGFloat cosTheta;
    CGFloat sinTheta;
    CGRect box;
    
    BOOL render;
    BOOL offScreen;
    BOOL wrap;
}

@property (assign) BOOL wrap, render, offScreen;
@property (assign) CGFloat x, y, r, g, b, alpha;
@property (assign) CGFloat speed, angle, rotation;
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
