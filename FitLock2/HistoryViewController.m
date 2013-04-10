//
//  DetailViewController.m
//  MasterDetailTest
//
//  Created by Nolan Mattox on 3/11/13.
//  Copyright (c) 2013 Mattox Software. All rights reserved.
//


#import "HistoryViewController.h"

@implementation HistoryViewController

@synthesize workout = _workout;

@synthesize workoutDate = _workoutDate;

@synthesize dateLabel = _dateLabel;

@synthesize typeLabel = _typeLabel;

@synthesize repsLabel = _repsLabel;

@synthesize goalReachedLabel = _goalReachedLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView
 {
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    _dateLabel.text = _workoutDate;
    _typeLabel.text = _workout.type;
    _repsLabel.text = [NSString stringWithFormat:@"%d", _workout.repNumber];
    if(_workout.completed)
    {
        _goalReachedLabel.text = @"Yes!";
    }
    else
    {
        _goalReachedLabel.text = @"No";
    }
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end


/*

#import "HistoryViewController.h"

@interface HistoryViewController ()
- (void)configureView;
@end

@implementation HistoryViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
*/