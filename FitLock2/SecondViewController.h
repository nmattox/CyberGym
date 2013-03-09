//
//  SecondViewController.h
//  FitLock2
//
//  Created by Nolan Mattox on 11/20/12.
//  Copyright (c) 2012 CSCI477. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate, UIAccelerometerDelegate>{
    UIPickerView *workoutPicker;
    NSMutableArray *workoutList;
    UILabel *workoutLabel;
    UILabel *repNumber;
    UIStepper *repStepper;
    UIButton *startButton;
    UIProgressView *workoutProgress;
    bool workingOut;
    
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
}

@property IBOutlet UIPickerView *workoutPicker;

@property IBOutlet UILabel *workoutLabel;

@property IBOutlet UILabel *repNumber;

@property IBOutlet UIStepper *repStepper;

@property IBOutlet UIButton *startButton;

@property IBOutlet UIProgressView *workoutProgress;

@property (nonatomic, retain) IBOutlet UIProgressView *progressX;

@property (nonatomic, retain) IBOutlet UIProgressView *progressY;

@property (nonatomic, retain) IBOutlet UIProgressView *progressZ;

@property (nonatomic, retain) IBOutlet UILabel *labelX;

@property (nonatomic, retain) IBOutlet UILabel *labelY;

@property (nonatomic, retain) IBOutlet UILabel *labelZ;

@property (nonatomic, retain) UIAccelerometer *accelerometer;

-(IBAction)plusButtonHit:(id)sender;

-(IBAction)startButtonHit:(id)sender;

-(void)workoutProgressThread:(double)sv;

@end
