//
//  FirstViewController.h
//  FitLock2
//
//  Created by Nolan Mattox on 11/20/12.
//  Copyright (c) 2012 CSCI477. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UIImagePickerControllerDelegate>{
    UILabel *headerText, *nameText, *ageText, *lastWorkedOutText;
    UIImageView *imageView;
    UISlider *frequencySlider;
    NSInteger *frequencyValue;
    UILabel *sliderOutput;
    UIButton *sunButton, *monButton, *tuesButton, *wedButton, *thursButton, *friButton, *satButton;
}

@property(nonatomic, retain) IBOutlet UILabel *headerText;
@property IBOutlet UIImageView *profImageView;
@property IBOutlet UISlider *frequencySlider;
@property float *frequencyValue;
@property IBOutlet UILabel *sliderOutput, *nameText, *ageText, *lastWorkedOutText;
@property IBOutlet UIButton *sunButton, *monButton, *tuesButton, *wedButton, *thursButton, *friButton, *satButton, *updateButton, *changePhotoButton;

-(IBAction)adjustSlider:(id)sender;
-(IBAction)onDayClick:(id)sender;
-(IBAction)updateButtonClicked:(id)sender;
-(IBAction)changePhotoButtonClicked:(id)sender;

@end
