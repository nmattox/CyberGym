//
//  FirstViewController.m
//  FitLock2
//
//  Created by Nolan Mattox on 11/20/12.
//  Copyright (c) 2012 CSCI477. All rights reserved.
//

#import "FirstViewController.h"
#include "MyLabel.h"
#include "UserData.h"
#include <QuartzCore/QuartzCore.h>

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize headerText = _headerText;

@synthesize profImageView = _profImageView;

@synthesize frequencySlider = _frequencySlider;

@synthesize frequencyValue = _frequencyValue;

@synthesize sliderOutput = _sliderOutput;

@synthesize nameText = _nameText;

@synthesize ageText = _ageText;

@synthesize lastWorkedOutText = _lastWorkedOutText;

@synthesize sunButton = _sunButton;

@synthesize monButton = _monButton;

@synthesize tuesButton = _tuesButton;

@synthesize wedButton = _wedButton;

@synthesize thursButton = _thursButton;

@synthesize friButton = _friButton;

@synthesize satButton = _satButton;

@synthesize updateButton = _updateButton;

@synthesize changePhotoButton = _changePhotoButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"got to view did load for first view controller");
    UIColor *background = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bg-2.png"]];
    self.view.backgroundColor = background;
    _headerText.font = [_headerText.font fontWithSize:35];
    [_updateButton setBackgroundImage:[UIImage imageNamed:@"pencil-1.png"] forState:UIControlStateNormal];
    [_changePhotoButton setBackgroundImage:[UIImage imageNamed:@"transparent.gif"] forState:UIControlStateNormal];
    
    // assign tags to buttons
    _monButton.tag = 0;
    _tuesButton.tag = 1;
    _wedButton.tag = 2;
    _thursButton.tag = 3;
    _friButton.tag = 4;
    _satButton.tag = 5;
    _sunButton.tag = 6;
    
    // set up notification function for updating "last workout" text
    [[NSNotificationCenter defaultCenter] addObserver: self selector: @selector(updateLastWorkout:) name: @"updateLastWorkoutNotification" object: nil];
    
    
    // Load user's default data
    
    // Get the stored data before the view loads 
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // update name
    if(![defaults objectForKey:@"userName"])
    {
        //TODO: This would be initial condition on first user login
        [self updateButtonClicked:_updateButton];
    }
    else
    {
        _nameText.text = [defaults objectForKey:@"userName"];
    }
    //update age
    if(![defaults integerForKey:@"userAge"])
    {
        // TODO: select birthday or something from somewhere
    }
    else
    {
        int userAge = [defaults integerForKey:@"userAge"];
        _ageText.text = [NSString stringWithFormat:@"%i",userAge];
    }
    // update frequency bar
    if(![defaults floatForKey:@"frequencyBarValue"])
    {
        [_frequencySlider setValue:.5];
    }
    else
    {
        [_frequencySlider setValue:[defaults floatForKey:@"frequencyBarValue"]];
        _sliderOutput.text = [NSString stringWithFormat:@"%.00f",[defaults floatForKey:@"frequencyBarValue"]*10];
    }
    
    // update selected days for workout
    
    // monday is selected day
    if([defaults boolForKey:@"monday"]) // monday selected
    {
        [_monButton setBackgroundImage:[UIImage imageNamed:@"MonBlue.png"] forState:UIControlStateNormal];
        NSLog(@"monday selected");
    }
    else // monday not selected
    {
        [_monButton setBackgroundImage:[UIImage imageNamed:@"MonWhite.png"] forState:UIControlStateNormal];
        NSLog(@"monday not selected");
        [defaults setBool:FALSE forKey:@"monday"];
    }
    
    if([defaults boolForKey:@"tuesday"])
    {
        [_tuesButton setBackgroundImage:[UIImage imageNamed:@"TueBlue.png"] forState:UIControlStateNormal];
        NSLog(@"tues selected");

    }
    else
    {
        [_tuesButton setBackgroundImage:[UIImage imageNamed:@"TueWhite.png"] forState:UIControlStateNormal];
        NSLog(@"tues not selected");
        [defaults setBool:FALSE forKey:@"tuesday"];

    }
    
    if([defaults boolForKey:@"wednesday"])
    {
        [_wedButton setBackgroundImage:[UIImage imageNamed:@"WedBlue.png"] forState:UIControlStateNormal];
        NSLog(@"wed selected");
        
    }
    else
    {
        [_wedButton setBackgroundImage:[UIImage imageNamed:@"WedWhite.png"] forState:UIControlStateNormal];
        NSLog(@"wed not selected");
        [defaults setBool:FALSE forKey:@"wednesday"];

    }
    
    if([defaults boolForKey:@"thursday"])
    {
        [_thursButton setBackgroundImage:[UIImage imageNamed:@"ThuBlue.png"] forState:UIControlStateNormal];
        NSLog(@"thurs selected");

    }
    else
    {
        [_thursButton setBackgroundImage:[UIImage imageNamed:@"ThuWhite.png"] forState:UIControlStateNormal];
        NSLog(@"thurs not selected");
        [defaults setBool:FALSE forKey:@"thursday"];

    }
    
    if([defaults boolForKey:@"friday"])
    {
        [_friButton setBackgroundImage:[UIImage imageNamed:@"FriBlue.png"] forState:UIControlStateNormal];
        NSLog(@"fri selected");


    }
    else
    {
        [_friButton setBackgroundImage:[UIImage imageNamed:@"FriWhite.png"] forState:UIControlStateNormal];
        NSLog(@"fri not selected");
        [defaults setBool:FALSE forKey:@"friday"];

    }
    
    if([defaults boolForKey:@"saturday"])
    {
        [_satButton setBackgroundImage:[UIImage imageNamed:@"SatBlue.png"] forState:UIControlStateNormal];
        NSLog(@"sat selected");

    }
    else
    {
        [_satButton setBackgroundImage:[UIImage imageNamed:@"SatWhite.png"] forState:UIControlStateNormal];
        NSLog(@"sat not selected");
        [defaults setBool:FALSE forKey:@"saturday"];

    }
    
    if([defaults boolForKey:@"sunday"])
    {
        [_sunButton setBackgroundImage:[UIImage imageNamed:@"SunBlue.png"] forState:UIControlStateNormal];
        NSLog(@"sun selected");

    }
    else
    {
        [_sunButton setBackgroundImage:[UIImage imageNamed:@"SunWhite.png"] forState:UIControlStateNormal];
        NSLog(@"sun not selected");
        [defaults setBool:FALSE forKey:@"sunday"];

    }
    if(![defaults dataForKey:@"userImage"])
    {
        // TODO: need a default "blank" image to be set
        _profImageView.image = [UIImage imageNamed:@"silhouette.png"];
    }
    else
    {
        _profImageView.image = [UIImage imageWithData:[defaults dataForKey:@"userImage"]];
    }
    
    // set last workout text
    _lastWorkedOutText.font = [UIFont systemFontOfSize:16.0];
    if([defaults objectForKey:@"lastWorkoutDate"]  == nil)
    {
        NSLog(@"object for key == nill %@", [defaults objectForKey:@"lastWorkoutDate"]);
        _lastWorkedOutText.text = @"N/A";
    }
    else
    {
        _lastWorkedOutText.text = [defaults objectForKey:@"lastWorkoutDate"];
    }
    
    
    // Update the UI elements with the saved data
    //_nameText.text = userName;
    //contactImageView.image = contactImage;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)adjustSlider:(id)sender
{
    //TODO: reset the reminder frequency
    NSString* val;
    float sliderValue = [_frequencySlider value];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setFloat:sliderValue forKey:@"frequencyBarValue"];
    val = [NSString stringWithFormat:@"%.00f", sliderValue*10];
    _sliderOutput.text = val;
    NSLog(@"changed value to %@", val); // debug

}

-(IBAction)onDayClick:(id)sender
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSLog(@"day button clicked, button ID = %d", ((UIButton*)sender).tag);
    if(((UIButton*)sender).tag == 0)
    {
        if([defaults boolForKey:@"monday"] == FALSE) // TODO: check if this checks for both value == 0 and value == nil
        {
            [defaults setBool:TRUE forKey:@"monday"];
            [_monButton setBackgroundImage:[UIImage imageNamed:@"MonBlue.png"] forState:UIControlStateNormal];
            NSLog(@"change to blue");

        }
        else
        {
            [defaults setBool:FALSE forKey:@"monday"];
            [_monButton setBackgroundImage:[UIImage imageNamed:@"MonWhite.png"] forState:UIControlStateNormal];
            NSLog(@"change to white, value %@",[defaults objectForKey:@"monday"]);
        }
    }
    else if(((UIButton*)sender).tag == 1)
    {
        if([defaults boolForKey:@"tuesday"] == FALSE) // TODO: check if this checks for both value == 0 and value == nil
        {
            [defaults setBool:TRUE forKey:@"tuesday"];
            [_tuesButton setBackgroundImage:[UIImage imageNamed:@"TueBlue.png"] forState:UIControlStateNormal];
            NSLog(@"change to blue");
            
        }
        else
        {
            [defaults setBool:FALSE forKey:@"tuesday"];
            [_tuesButton setBackgroundImage:[UIImage imageNamed:@"TueWhite.png"] forState:UIControlStateNormal];
            NSLog(@"change to white, value %@",[defaults objectForKey:@"tuesday"]);
        }
    }
    else if(((UIButton*)sender).tag == 2)
    {
        if([defaults boolForKey:@"wednesday"] == FALSE) // TODO: check if this checks for both value == 0 and value == nil
        {
            [defaults setBool:TRUE forKey:@"wednesday"];
            [_wedButton setBackgroundImage:[UIImage imageNamed:@"WedBlue.png"] forState:UIControlStateNormal];
            NSLog(@"change to blue");
            
        }
        else
        {
            [defaults setBool:FALSE forKey:@"wednesday"];
            [_wedButton setBackgroundImage:[UIImage imageNamed:@"WedWhite.png"] forState:UIControlStateNormal];
            NSLog(@"change to white, value %@",[defaults objectForKey:@"wednesday"]);
        }
    }
    else if(((UIButton*)sender).tag == 3)
    {
        if([defaults boolForKey:@"thursday"] == FALSE) // TODO: check if this checks for both value == 0 and value == nil
        {
            [defaults setBool:TRUE forKey:@"thursday"];
            [_thursButton setBackgroundImage:[UIImage imageNamed:@"ThuBlue.png"] forState:UIControlStateNormal];
            NSLog(@"change to blue");
            
        }
        else
        {
            [defaults setBool:FALSE forKey:@"thursday"];
            [_thursButton setBackgroundImage:[UIImage imageNamed:@"ThuWhite.png"] forState:UIControlStateNormal];
            NSLog(@"change to white, value %@",[defaults objectForKey:@"thursday"]);
        }
    }
    else if(((UIButton*)sender).tag == 4)
    {
        if([defaults boolForKey:@"friday"] == FALSE) // TODO: check if this checks for both value == 0 and value == nil
        {
            [defaults setBool:TRUE forKey:@"friday"];
            [_friButton setBackgroundImage:[UIImage imageNamed:@"FriBlue.png"] forState:UIControlStateNormal];
            NSLog(@"change to blue");
            
        }
        else
        {
            [defaults setBool:FALSE forKey:@"friday"];
            [_friButton setBackgroundImage:[UIImage imageNamed:@"FriWhite.png"] forState:UIControlStateNormal];
            NSLog(@"change to white, value %@",[defaults objectForKey:@"friday"]);
        }
    }
    else if(((UIButton*)sender).tag == 5)
    {
        if([defaults boolForKey:@"saturday"] == FALSE) // TODO: check if this checks for both value == 0 and value == nil
        {
            [defaults setBool:TRUE forKey:@"saturday"];
            [_satButton setBackgroundImage:[UIImage imageNamed:@"SatBlue.png"] forState:UIControlStateNormal];
            NSLog(@"change to blue");
            
        }
        else
        {
            [defaults setBool:FALSE forKey:@"saturday"];
            [_satButton setBackgroundImage:[UIImage imageNamed:@"SatWhite.png"] forState:UIControlStateNormal];
            NSLog(@"change to white, value %@",[defaults objectForKey:@"saturday"]);
        }
    }
    else if(((UIButton*)sender).tag == 6)
    {
        if([defaults boolForKey:@"sunday"] == FALSE) // TODO: check if this checks for both value == 0 and value == nil
        {
            [defaults setBool:TRUE forKey:@"sunday"];
            [_sunButton setBackgroundImage:[UIImage imageNamed:@"SunBlue.png"] forState:UIControlStateNormal];
            NSLog(@"change to blue");
            
        }
        else
        {
            [defaults setBool:FALSE forKey:@"sunday"];
            [_sunButton setBackgroundImage:[UIImage imageNamed:@"SunWhite.png"] forState:UIControlStateNormal];
            NSLog(@"change to white, value %@",[defaults objectForKey:@"sunday"]);
        }
    }
    else
    {
        NSLog(@"ERROR OCCURRED!!! SHOULDNT GET HERE! this is the button clicked: %d", ((UIButton*)sender).tag);
    }
}

-(IBAction)updateButtonClicked:(id)sender
{
    UIAlertView *updateForm = [[UIAlertView alloc] initWithTitle:@"Update Name" message:@"Please enter the name you wish to associate with your FitLock." delegate:self cancelButtonTitle:@"Close" otherButtonTitles:@"Update", nil];
    updateForm.alertViewStyle = UIAlertViewStylePlainTextInput;
    [updateForm show];
}

-(void)updateLastWorkout:(NSNotification*)notification
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _lastWorkedOutText.text = [defaults objectForKey:@"lastWorkoutDate"];
}

/*
 Function goes through all fields in submitted alertView form. Once it finds the text field, it stores the updated name
 to the UserDefaults
 */
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"alert view index = %d",buttonIndex);
    if (buttonIndex != 0)  // 0 == the cancel button
    {
        for (UIView* view in alertView.subviews)
        {
            if ([view isKindOfClass:[UITextField class]])
            {
                UITextField* textField = (UITextField*)view;
                if([textField.text length] > 0)
                {
                    NSLog(@"This name stored to user defaults:[%@]", textField.text);
                    // Store the data
                    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                    [defaults setObject:textField.text forKey:@"userName"];
                    _nameText.text = textField.text;
                }
                break;
            }
        }
    }
}

// Below image chosing stuff should probably be in its own class
-(IBAction)changePhotoButtonClicked:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init] ;
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentModalViewController:picker animated:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [picker dismissModalViewControllerAnimated:YES];
    _profImageView.image = image;
    [defaults setObject: UIImageJPEGRepresentation(_profImageView.image, 100) forKey:@"userImage"];
    NSLog(@"image selected and saved to defaults");
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
	[picker dismissModalViewControllerAnimated:YES];
    NSLog(@"image selection canceled");
}


@end
