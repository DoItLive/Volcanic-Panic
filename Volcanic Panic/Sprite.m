//
//  Sprite.m
//  ZombieGame
//
//  Created by Langford Thomas on 12/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Sprite.h"

@implementation Sprite

@synthesize wrap,render,offScreen;
@synthesize x,y,alpha;
@synthesize speed,rotation;
@synthesize width,height,scale;
@synthesize box,frame;

- (id) init {
    self = [super init];
    if (self) {
        wrap = NO;
        x = y = 0.0;
        width = height = 1.0;
        scale = 1.0;
        speed = 0.0;
        rotation = 0;
        alpha = 1.0;
        offScreen = NO;
        box = CGRectMake(0, 0, 0, 0);
        frame = 0;
        render = YES;
    }
    return self;
}

- (void) updateBox {    
    CGFloat w = width*scale;
    CGFloat h = height*scale;
    CGFloat w2 = w*0.5;
    CGFloat h2 = h*0.5;
    CGPoint origin = box.origin;
    CGSize boxSize = box.size;
    CGFloat right = kScreenWidth;
    CGFloat left = 0;
    CGFloat top = kScreenHeight;
    CGFloat bottom = 0;
    
    offScreen = NO;
    
    if(wrap) {
        if((x+w2) < left) x = right + w2;
        else if((x-w2) > right) x = left - w2;
        else if((y+h2) < bottom) y = top + h2;
        else if((y-h2) > top) y = bottom - h2;
    } else {
        offScreen = ((w+w2)<left || (x-w2)>right || (y+h2)<bottom || (y-h2) > top);
    }
    
    origin.x = x-w2*scale;
    origin.y = y-h2*scale;
    boxSize.width = w;
    boxSize.height = h;
    box.origin = origin;
    box.size = boxSize;
}

- (void) tic:(NSTimeInterval)dt {
    if(!render) return;
    
    if(speed)
        [self updateBox];
}

//Draws the bounding box around a sprite
- (void) drawBoundingBox:(CGContextRef)context {
    CGContextSaveGState(context);
    
    CGAffineTransform t = CGAffineTransformIdentity;
    t = CGAffineTransformTranslate(t, x, y);
    t = CGAffineTransformRotate(t, rotation);
    t = CGAffineTransformScale(t, scale, scale);
    CGContextConcatCTM(context, t);
    
    CGContextSetRGBFillColor(context, 1.0, 0.0, 0.0, alpha);
    [self outlinePath:context];
    CGContextDrawPath(context, kCGPathStroke);
    
    CGContextRestoreGState(context);
}

@end
