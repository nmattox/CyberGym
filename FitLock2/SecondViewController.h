//
//  SecondViewController.h
//  FitLock2
//
//  Created by Nolan Mattox on 11/20/12.
//  Copyright (c) 2012 CSCI477. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThirdViewController2.h"
#import <FacebookSDK/FacebookSDK.h>
#import "Workout.h"

@interface SecondViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UIAccelerometerDelegate, FBLoginViewDelegate>{
    //UIPickerView *workoutPicker;
    //NSMutableArray *workoutList;
    UILabel *workoutLabel;
    UILabel *repNumber;
    UIStepper *repStepper;
    UIButton *startButton;
    UIButton *cancelButton;
    UIProgressView *workoutProgress;
    bool workingOut;
    Workout *lastWorkout;
    
    // below are some variables specific to the workout thread process
    double progress;
    int stepVal;
    UIAccelerometer *accelerometer;
    float currentAccelXval, currentAccelYval, currentAccelZval, lastAccelXval, lastAccelYval, lastAccelZval;
    bool *workoutThreadCounter;
    float firstValues[3];
    // below are vars for pushups
    bool *down;
    int directionChangeCount;
    IBOutlet ThirdViewController2* historyView; // TODO: this should be the exact same class as the visible view
    
    // picker stuff below
    IBOutlet UIPickerView *workoutPicker;
    NSMutableArray *workoutList;
    IBOutlet UIToolbar *workoutPickerToolbar;
    IBOutlet UIBarButtonItem *workoutPickerDoneButton;
    NSString *workoutSelection;
}

//@property IBOutlet UIPickerView *workoutPicker;

@property IBOutlet UILabel *workoutLabel;

@property IBOutlet UILabel *repNumber;

@property IBOutlet UIStepper *repStepper;

@property IBOutlet UIButton *startButton;

@property IBOutlet UIButton *cancelButton;

@property IBOutlet UIProgressView *workoutProgress;

@property IBOutlet UIViewController *thirdView;

@property (nonatomic, retain) IBOutlet UIProgressView *progressX;

@property (nonatomic, retain) IBOutlet UIProgressView *progressY;

@property (nonatomic, retain) IBOutlet UIProgressView *progressZ;

@property (nonatomic, retain) IBOutlet UILabel *labelX;

@property (nonatomic, retain) IBOutlet UILabel *labelY;

@property (nonatomic, retain) IBOutlet UILabel *labelZ;

@property (nonatomic, retain) UIAccelerometer *accelerometer;

@property Workout *lastWorkout;

// below are facebook properties

@property (strong, nonatomic) id<FBGraphUser> loggedInUser;

-(IBAction)plusButtonHit:(id)sender;

-(IBAction)startButtonHit:(id)sender;

-(IBAction)cancelButtonHit:(id)sender;

-(IBAction)showWorkoutSelector:(id)sender;

-(IBAction)hideWorkoutSelector:(id)sender;

-(void)workoutProgressThread:(double)sv;

// below are added facebook functions
-(void)facebookPost;

@end
