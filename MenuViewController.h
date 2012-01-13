//
//  MenuViewController.h
//  Volcanic Panic
//
//  Created by Langford Thomas on 1/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController {
    UIView *mainMenuView;
    UIButton *playButton;
    
}

@property (nonatomic, retain) IBOutlet UIView *mainMenuView;
@property (nonatomic, retain) IBOutlet UIButton *playButton;

-(IBAction) playButtonTouchUpInside:(id)sender;


@end
