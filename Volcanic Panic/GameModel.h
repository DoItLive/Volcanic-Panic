//
//  GameModel.h
//  ZombieGame
//
//  Created by Langford Thomas on 12/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AtlasSprite.h"
#import "Defs.h"

@interface GameModel : NSObject {
    NSMutableArray *zombies;
    NSMutableArray *deadSprites;
    NSMutableArray *createdSprites;
    
    NSMutableDictionary *state;
    CGFloat time;
}

@property(nonatomic, retain) NSMutableDictionary *state;
@property(nonatomic, retain) NSMutableArray *zombies;
@property(nonatomic, retain) NSMutableArray *deadSprites;
@property(nonatomic, retain) NSMutableArray *createdSprites;
@property(assign) CGFloat time;

+ (GameModel *) sharedModel;
+ (int) getState: (NSString *)indicator;
+ (void) setState: (NSString *)indicator to: (int)val;
- (void) initState;
- (void) addObjects;
- (void) addNewSprites;
- (void) kill: (Sprite *)sprite;
- (void) cleanUpArrays;
- (void) dumpArrays;

@end
