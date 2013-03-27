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
    if([defaults objectForKey:@"monday"])
    {
        
    }
    else
    {
        
    }
    if([defaults objectForKey:@"tuesday"])
    {
        
    }
    else
    {
        
    }
    if([defaults objectForKey:@"wednesday"])
    {
        
    }
    else
    {
        
    }
    if([defaults objectForKey:@"thursday"])
    {
        
    }
    else
    {
        
    }
    if([defaults objectForKey:@"friday"])
    {
        
    }
    else
    {
        
    }
    if([defaults objectForKey:@"saturday"])
    {
        
    }
    else
    {
        
    }
    if([defaults objectForKey:@"sunday"])
    {
        
    }
    else
    {
        
    }
    if(![defaults dataForKey:@"userImage"])
    {
        // TODO: need a default "blank" image to be set
        _profImageView.image = [UIImage imageNamed:@"me.png"];
    }
    else
    {
        _profImageView.image = [UIImage imageWithData:[defaults dataForKey:@"userImage"]];
    }
    if(![defaults objectForKey:@"workouts"])
    {
        [defaults setObject:[[NSArray alloc] init] forKey:@"workouts"];
    }
    else
    {
        // TODO: don't think we really need to load the array from defaults here
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
    NSString *buttonString = [sender currentTitle];
    if([buttonString isEqualToString:@"Mon"])
    {
        if(![defaults objectForKey:@"monday"]) // TODO: check if this checks for both value == 0 and value == nil
        {
            [defaults setBool:TRUE forKey:@"monday"];
        }
        else
        {
            [defaults setBool:FALSE forKey:@"monday"];
        }
    }
    else if([buttonString isEqualToString:@"Tue"])
    {
        if(![defaults objectForKey:@"tuesday"]) // TODO: check if this checks for both value == 0 and value == nil
        {
            [defaults setBool:TRUE forKey:@"tuesday"];
        }
        else
        {
            [defaults setBool:FALSE forKey:@"tuesday"];
        }
    }
    else if([buttonString isEqualToString:@"Wed"])
    {
        if(![defaults objectForKey:@"wednesday"]) // TODO: check if this checks for both value == 0 and value == nil
        {
            [defaults setBool:TRUE forKey:@"wednesday"];
        }
        else
        {
            [defaults setBool:FALSE forKey:@"wednesday"];
        }
    }
    else if([buttonString isEqualToString:@"Thu"])
    {
        if(![defaults objectForKey:@"monday"]) // TODO: check if this checks for both value == 0 and value == nil
        {
            [defaults setBool:TRUE forKey:@"monday"];
        }
        else
        {
            [defaults setBool:FALSE forKey:@"monday"];
        }
    }
    else if([buttonString isEqualToString:@"Fri"])
    {
        if(![defaults objectForKey:@"monday"]) // TODO: check if this checks for both value == 0 and value == nil
        {
            [defaults setBool:TRUE forKey:@"monday"];
        }
        else
        {
            [defaults setBool:FALSE forKey:@"monday"];
        }
    }
    else if([buttonString isEqualToString:@"Sat"])
    {
        if(![defaults objectForKey:@"monday"]) // TODO: check if this checks for both value == 0 and value == nil
        {
            [defaults setBool:TRUE forKey:@"monday"];
        }
        else
        {
            [defaults setBool:FALSE forKey:@"monday"];
        }
    }
    else if([buttonString isEqualToString:@"Sun"])
    {
        if(![defaults objectForKey:@"monday"]) // TODO: check if this checks for both value == 0 and value == nil
        {
            [defaults setBool:TRUE forKey:@"monday"];
        }
        else
        {
            [defaults setBool:FALSE forKey:@"monday"];
        }
    }
    else
    {
        NSLog(@"ERROR OCCURRED!!! SHOULDNT GET HERE!");
    }
}

-(IBAction)updateButtonClicked:(id)sender
{
    UIAlertView *updateForm = [[UIAlertView alloc] initWithTitle:@"Update Name" message:@"Please enter the name you wish to associate with your FitLock." delegate:self cancelButtonTitle:@"Close" otherButtonTitles:@"Update", nil];
    updateForm.alertViewStyle = UIAlertViewStylePlainTextInput;
    [updateForm show];
}

/*
 Function goes through all fields in submitted alertView form. Once it finds the text field, it stores the updated name
 to the UserDefaults
 */
- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != 0)  // 0 == the cancel button
    {
        for (UIView* view in alertView.subviews)
        {
            if ([view isKindOfClass:[UITextField class]])
            {
                UITextField* textField = (UITextField*)view;
                NSLog(@"This name stored to user defaults:[%@]", textField.text);
                // Store the data
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                [defaults setObject:textField.text forKey:@"userName"];
                _nameText.text = textField.text;
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
