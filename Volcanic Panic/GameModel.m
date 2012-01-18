//
//  GameModel.m
//  ZombieGame
//
//  Created by Langford Thomas on 12/21/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel 

@synthesize zombies,deadSprites,createdSprites,state,time;

- (id) init {
    self = [super init];
    if (self) {
        zombies = [[NSMutableArray alloc] init];
        deadSprites = [[NSMutableArray alloc] init];
        createdSprites = [[NSMutableArray alloc] init];
        time = 0;
    }
    return self;
}

+ (GameModel *) sharedModel {
    static GameModel *sharedGameModel;
    @synchronized(self) {
        if (!sharedGameModel) {
            sharedGameModel = [[GameModel alloc] init];
        }
        return sharedGameModel;
    }
    return sharedGameModel;
}

+ (int) getState:(NSString *)indicator {
    GameModel *game = [GameModel sharedModel];
    if(game.state == nil) {
        game.state = [[NSMutableDictionary alloc] init];
    }
    NSNumber *num = [game.state objectForKey:indicator];
    if(num) {
        return [num intValue];
    }
    return -1;
}

+ (void) setState:(NSString *)indicator to:(int)val {
    GameModel *game = [GameModel sharedModel];
    if(game.state == nil) {
        game.state = [[NSMutableDictionary alloc] init];
    }
    NSNumber *num = [NSNumber numberWithInt:val];
    [game.state setObject:num forKey:indicator];
}

- (void) initState {
    
}

- (void) addObjects {
    AtlasSprite *zom = [AtlasSprite fromFile:@"zombie.png" withRows:1 withColumns:1];
    zom.x = 0;
    zom.y = 160;
    zom.speed = 60;
    zom.rotation = 180;
    zom.scale = 2.0;
    zom.wrap = YES;
    [zombies addObject:zom];
    zom = [AtlasSprite fromFile:@"zombie.png" withRows:1 withColumns:1];
    zom.x = 10;
    zom.y = 240;
    zom.speed = 60;
    zom.rotation = 180;
    zom.wrap = NO;
    [zombies addObject:zom];
    zom = [AtlasSprite fromFile:@"zombie.png" withRows:1 withColumns:1];
    zom.x = 20;
    zom.y = 80;
    zom.speed = 60;
    zom.rotation = 180;
    zom.wrap = NO;
    [zombies addObject:zom];
}

- (void) addNewSprites {
    if ([createdSprites count] > 0) {
        [zombies addObjectsFromArray:createdSprites];
        [createdSprites removeAllObjects];
    }
}

- (void) kill:(Sprite *)sprite {
    [deadSprites addObject:sprite];
}

- (void) cleanUpArrays {
    if ([deadSprites count] > 0) {
        [zombies removeObjectsInArray:deadSprites];
        [deadSprites removeAllObjects];
    }
}

- (void) dumpArrays {
    ([createdSprites count] > 0)? NSLog(@"createdSprites: %d",[createdSprites count]): NSLog(@"Nothing in createdSprites array");
    ([deadSprites count] > 0)? NSLog(@"deadSprites: %d",[deadSprites count]): NSLog(@"Nothing in deadSprites array");
    ([zombies count] > 0)? NSLog(@"zombies: %d",[zombies count]): NSLog(@"Nothing in zombies array");
}

@end
