//
//  AppDelegate.h
//  FitLock2
//
//  Created by Nolan Mattox on 11/20/12.
//  Copyright (c) 2012 CSCI477. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SecondViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    SecondViewController *secondView;
}

@property (strong, nonatomic) UIWindow *window;

@end
