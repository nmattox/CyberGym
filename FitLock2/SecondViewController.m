//
//  SecondViewController.m
//  FitLock2
//
//  Created by Nolan Mattox on 11/20/12.
//  Copyright (c) 2012 CSCI477. All rights reserved.
//

#import "SecondViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface SecondViewController ()

@end

@implementation SecondViewController

@synthesize workoutPicker = _workoutPicker;

@synthesize workoutLabel = _workoutLabel;

@synthesize repNumber = _repNumber;

@synthesize repStepper = _repStepper;

@synthesize startButton = _startButton;

@synthesize workoutProgress = _workoutProgress;

//@synthesize workoutList = _workoutList;

- (void)viewDidLoad
{
    NSLog(@"got to view did load for second view controller");
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // set up background 
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bg-2.png"]];
    self.view.backgroundColor = background;
    
    // set up array of workouts
    [workoutList addObject:@"Pushups"];
    [workoutList addObject:@"Pull-Ups"];
    [workoutList addObject:@"Sit-Ups"];
    [workoutList addObject:@"Running"];
    [workoutList addObject:@"Squats"];
    
    // initialize progress bar
    progress = 0;
    [_workoutProgress setProgress:progress];
    
    // initialize rep number label and stepper
    [_repStepper setMinimumValue:1];
    [_repStepper setMaximumValue:100];
    stepVal = [_repStepper value];
    NSString *repString = [NSString stringWithFormat:@"%i",stepVal];
    [_repNumber setText:repString];
    
    workingOut = false;
    
    // initialize accelerometer
    self.accelerometer = [UIAccelerometer sharedAccelerometer];
    self.accelerometer.updateInterval = .1;
    self.accelerometer.delegate = self;
    currentAccelXval = 0;
    currentAccelYval = 0;
    currentAccelZval = 0;
    lastAccelXval = 0;
    lastAccelYval = 0;
    lastAccelZval = 0;
    
    // for workout thread - RIGHT NOW SPECIFIC FOR PUSHUPS
    workoutThreadCounter = 0;
    down = false;
    directionChangeCount = 0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)plusButtonHit:(id)sender
{
    stepVal = [_repStepper value];
    NSString *repString = [NSString stringWithFormat:@"%i",stepVal];
    [_repNumber setText:repString];
}

-(IBAction)startButtonHit:(id)sender
{
    _workoutProgress.progress = 0.0;
    workingOut = true;
    [self performSelectorOnMainThread:@selector(workoutProgressThread) withObject:nil waitUntilDone:NO];
    
}

-(void)workoutProgressThread
{
    if(workingOut)
    {
        //NSLog(@"workout counter = %d", workoutThreadCounter);
        if(workoutThreadCounter == 0) // TODO: change workoutThreadCounter to boolean
        {
            [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(workoutProgressThread) userInfo:nil repeats:NO];
            //NSLog(@"workout coutner is 0, Y and Z Values = %f %f ", currentAccelYval, currentAccelZval);
            if(fabsf(currentAccelYval) < 0.16 && fabsf(currentAccelXval) < 0.16)
            {
                NSLog(@"initial accel starting values set");
                firstValues[0] = currentAccelXval;
                firstValues[1] = currentAccelYval;
                firstValues[2] = currentAccelZval;
                workoutThreadCounter++;
                [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(workoutProgressThread) userInfo:nil repeats:NO];
            }
        }
        else
        {
            float actual = [_workoutProgress progress];
            float incrementValue = 1/(float)stepVal;
            if (actual < 1)
            {
                
                //TODO: the line below must be replaced with a pause until the correct accelerometer change is detected
                //NSLog(@"Accelerometer Y difference = %f",ABS(lastAccelYval - currentAccelYval));
                //NSLog(@"difference between first val and X Y Z = %f, %f, %f", fabsf(currentAccelXval - firstValues[0]), fabsf(currentAccelYval-firstValues[1]), fabsf(currentAccelZval-firstValues[2]));
                float xVariance = fabsf(currentAccelXval - firstValues[0]);
                float yVariance = fabsf(currentAccelYval - firstValues[1]);
                float zVariance = fabsf(currentAccelZval - firstValues[2]);
                [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(workoutProgressThread) userInfo:nil repeats:NO];
                if(!down)
                {
                    if(yVariance > .15)
                    {
                        down = true;
                        directionChangeCount = 0;
                        firstValues[0] = currentAccelXval;
                        firstValues[1] = currentAccelYval;
                        firstValues[2] = currentAccelZval;
                        NSLog(@"FINISHED THE DOWN PORTION");
                    }
                }
                else
                {
                    if(yVariance > .15)
                    {
                        down = false;
                        directionChangeCount = 0;
                        firstValues[0] = currentAccelXval;
                        firstValues[1] = currentAccelYval;
                        firstValues[2] = currentAccelZval;
                        NSLog(@"FINISHED THE UP PORTION");
                        _workoutProgress.progress = actual + incrementValue;
                        
                    }
                }
                /* below iff statement is the "flick" accelerometer test
                if(ABS(lastAccelYval - currentAccelYval) > .8)
                {
                    _workoutProgress.progress = actual + incrementValue;
                    workoutThreadCounter = 0;
                }
                 */
                workoutThreadCounter++;
            }
            else
            {
                workingOut = false;
                down = false;
                _workoutProgress.progress = 0;
                workoutThreadCounter = 0;
                //TODO: create and save a "workout object"
                AudioServicesPlaySystemSound (1005);
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
                UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Congratulations!" message:@"You've successfully reached your workout goal!" delegate:self cancelButtonTitle:@"Close" otherButtonTitles:@"Post to Facebook", nil];
                alert.alertViewStyle = UIAlertViewStyleDefault;
                [alert show];
               
            }
        }
        /*
        double progressIncrement = 1/(double)stepVal;
        progress = 0;
        
        /*
         below is a loop for prototype demo. This loop increments the
         progress bar per period of time for the number of reps. In actual
         app, the progress bar will imcrement for each workout rep
         detected by the accelerometer
         
        while(true)
        {
            // increment, set, check
            progress += progressIncrement;
            [_workoutProgress setProgress:progress];
            [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(workoutProgressThread) userInfo:nil repeats:NO];
            if(progress >= 1)
            {
                break;
            }
            NSLog(@"HERE, progress = %f", progress);
            // pause
            [NSThread sleepForTimeInterval:4.0];
        }*/
    }
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    lastAccelXval = currentAccelXval;
    lastAccelYval = currentAccelYval;
    lastAccelZval = currentAccelZval;
    
    currentAccelXval = ABS(acceleration.x);
    currentAccelYval = ABS(acceleration.y);
    currentAccelZval = ABS(acceleration.z);
    
    self.progressX.progress = ABS(acceleration.x);
    self.progressY.progress = ABS(acceleration.y);
    self.progressZ.progress = ABS(acceleration.z);
    
    self.labelX.text = [NSString stringWithFormat:@"%f", acceleration.x];
    self.labelY.text = [NSString stringWithFormat:@"%f", acceleration.y];
    self.labelZ.text = [NSString stringWithFormat:@"%f", acceleration.z];
}

/*
 * Below is code for managing the picker that doesn't yet work
 */

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView
{
    
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component
{
    
    return [workoutList count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [workoutList objectAtIndex:row];
}

@end
