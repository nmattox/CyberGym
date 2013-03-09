//
//  UserData.m
//  FitLock
//
//  Created by Nolan Mattox on 2/18/13.
//  Copyright (c) 2013 CSCI477. All rights reserved.
//

#import "UserData.h"

@implementation UserData

@synthesize imageData = _imageData;

@synthesize age = _age;

@synthesize birthDay = _birthDay;

@synthesize birthMonth =_birthMonth;

@synthesize birthYear = _birthYear;

@synthesize heightFt =_heightFt;

@synthesize heightIn =_heightIn;

@synthesize name =_name;

@synthesize reminderInterval = _reminderInterval;

@synthesize weight = _weight;

@synthesize workoutDays = _workoutDays;

@synthesize workouts = _workouts;

/*TODO: not sure if we need these functions yet...
- (void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeObject:self.question forKey:@"question"];
    [encoder encodeObject:self.categoryName forKey:@"category"];
    [encoder encodeObject:self.subCategoryName forKey:@"subcategory"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        self.question = [decoder decodeObjectForKey:@"question"];
        self.categoryName = [decoder decodeObjectForKey:@"category"];
        self.subCategoryName = [decoder decodeObjectForKey:@"subcategory"];
    }
    return self;
}
 */

@end
