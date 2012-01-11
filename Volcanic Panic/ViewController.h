//
//  ViewController.h
//  Volcanic Panic
//
//  Created by Langford Thomas on 1/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    UIView *menuView;
    UIView *gameView;
}

@property (strong, nonatomic) IBOutlet UIView *menuView;
@property (strong, nonatomic) IBOutlet UIView *gameView;

@end
