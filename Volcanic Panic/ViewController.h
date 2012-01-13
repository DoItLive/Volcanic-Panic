//
//  ViewController.h
//  Volcanic Panic
//
//  Created by Langford Thomas on 1/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "GameViewController.h"

@interface ViewController : UIViewController {
    GameViewController *gameViewController;
    
    UIButton *playButton;
}

@property (nonatomic, retain) GameViewController *gameViewController;
@property (nonatomic, retain) IBOutlet UIButton *playButton;

-(IBAction) playButtonTouchUpInside:(id)sender;

@end
