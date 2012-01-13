//
//  ViewController.h
//  Volcanic Panic
//
//  Created by Langford Thomas on 1/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MenuViewController.h"
#import "GameViewController.h"

@interface ViewController : UIViewController {
    MenuViewController *menuViewController;
    GameViewController *gameViewController;
}

@property (nonatomic, retain) MenuViewController *menuViewController;
@property (nonatomic, retain) GameViewController *gameViewController;


@end
