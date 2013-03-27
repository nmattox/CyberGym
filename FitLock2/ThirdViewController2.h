//
//  ThirdViewController2.h
//  FitLock
//
//  Created by Nolan Mattox on 3/26/13.
//  Copyright (c) 2013 CSCI477. All rights reserved.
//


//
//  ViewController.h
//  StoryboardTutorial
//
//  Created by Kurry Tran on 10/20/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
//@protocol ThirdViewController2Delegate; TODO: IMPLEMENT PROTOCOLS AND DELEGATES
@interface ThirdViewController2 : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    //id<ThirdViewController2Delegate> initDelegate; TODO: IMPLEMENT PROTOCOLS AND DELEGATES
}

@property(nonatomic, retain)NSMutableDictionary *states;
@property(nonatomic, retain)NSArray *datasource;
-(void)setupArray;

@end

/*TODO: want to implement something like this too
@protocol ViewControllerDelegate
-(void)setupArray;
@end
 */

/*
#import <UIKit/UIKit.h>

@interface ThirdViewController2 : UITableViewController

@end
*/