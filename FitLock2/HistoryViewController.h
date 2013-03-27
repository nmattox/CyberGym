//
//  DetailViewController.h
//  MasterDetailTest
//
//  Created by Nolan Mattox on 3/11/13.
//  Copyright (c) 2013 Mattox Software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Workout.h"

@interface HistoryViewController : UIViewController{
    Workout *workout;
    NSString *workoutDate;
    IBOutlet UILabel *dateLabel;
    IBOutlet UILabel *typeLabel;
    IBOutlet UILabel *repsLabel;
    IBOutlet UILabel *goalReachedLabel;
}
@property (nonatomic, retain)Workout *workout;
@property (nonatomic, retain)NSString *workoutDate;
@property (nonatomic, retain)IBOutlet UILabel *dateLabel, *typeLabel, *repsLabel, *goalReachedLabel;
@end


/*
#import <UIKit/UIKit.h>

@interface HistoryViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
*/