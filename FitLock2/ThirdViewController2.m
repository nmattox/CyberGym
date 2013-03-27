//
//  MasterViewController.m
//  MasterDetailTest
//
//  Created by Nolan Mattox on 3/11/13.
//  Copyright (c) 2013 Mattox Software. All rights reserved.
//

#import "ThirdViewController2.h"

#import "HistoryViewController.h"


@implementation ThirdViewController2
@synthesize states,datasource;
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [self setupArray];
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)setupArray{
    
    states = [[NSMutableDictionary alloc]init];
    
    // test code that makes a few workouts
    Workout *w1 = [[Workout alloc] init];
    w1.date = [NSDate date];
    w1.type = @"Pushups";
    w1.repNumber = 15;
    w1.completed = TRUE;
    Workout *w2 = [[Workout alloc] init];
    w2.date = [NSDate date];
    w2.type = @"Sit-Ups";
    w2.repNumber = 30;
    w2.completed = false;
    Workout *w3 = [[Workout alloc] init];
    w3.date = [NSDate date];
    w3.type = @"Pull-Ups";
    w3.repNumber = 8;
    w3.completed = TRUE;
    Workout *w4 = [[Workout alloc] init];
    w4.date = [NSDate date];
    w4.type = @"Pushups";
    w4.repNumber = 17;
    w4.completed = false;
    Workout *w5 = [[Workout alloc] init];
    w5.date = [NSDate date];
    w5.type = @"Squats";
    w5.repNumber = 15;
    w5.completed = TRUE;
    // end test code
    
    [states setObject:w1 forKey:@"03/26/2013 - 12:46pm"];
    [states setObject:w2 forKey:@"03/26/2013 - 1:55pm"];
    [states setObject:w3 forKey:@"03/26/2013 - 2:51pm"];
    [states setObject:w4 forKey:@"03/26/2013 - 4:01pm"];
    [states setObject:w5 forKey:@"03/26/2013 - 4:46pm"];
    
    datasource = [states allKeys];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        
    }
    // Configure the cell...
    
    cell.textLabel.text = [datasource objectAtIndex:indexPath.row];
    
    //Arrow
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HistoryViewController *detail = [self.storyboard instantiateViewControllerWithIdentifier:@"workout"];
    //NSLog(@"workout name = %@", [datasource objectAtIndex:indexPath.row]);
    //NSLog(@"the row = %d", indexPath.row);
    detail.workoutDate = [datasource objectAtIndex:indexPath.row];
    detail.workout = [states objectForKey:detail.workoutDate];
    [self.navigationController pushViewController:detail animated:YES];
    
}

//----------------------TABLEVIEWCELL HEIGHT -------------------------------------------

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end


/*

@interface ThirdViewController2 () {
    NSMutableArray *_objects;
}
@end

@implementation ThirdViewController2

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDate *object = _objects[indexPath.row];
    cell.textLabel.text = [object description];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
*/