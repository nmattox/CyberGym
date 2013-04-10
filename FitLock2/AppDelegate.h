//
//  AppDelegate.h
//  FitLock2
//
//  Created by Nolan Mattox on 11/20/12.
//  Copyright (c) 2012 CSCI477. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import "SecondViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) SecondViewController *secondView;
@property (strong, nonatomic) FBSession *session;


@end
