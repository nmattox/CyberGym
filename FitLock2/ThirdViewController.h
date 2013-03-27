//
//  CountriesTableViewController.h
//  UITableView-Tutorial
//
//  Created by Costa Walcott on 9/28/11.
//  Copyright 2011 Draconis Software. All rights reserved.
//

/* NOTE: CURRENTLY NOT USED!! */

#import <UIKit/UIKit.h>

@interface ThirdViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>{
	NSDictionary *countries;
}


-(IBAction)editClicked:(id)sender;

@end
