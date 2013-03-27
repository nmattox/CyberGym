//
//  UserData.h
//  FitLock
//
//  Created by Nolan Mattox on 2/18/13.
//  Copyright (c) 2013 CSCI477. All rights reserved.
//

/* NOTE: CURRENTLY NOT USED!! */

#import <Foundation/Foundation.h>

@interface UserData : NSObject{
    NSData *imageData;
    NSString *name;
    int age;
    int birthMonth;
    int birthDay;
    int birthYear;
    int weight;
    int heightIn;
    int heightFt;
    //TODO: do we want a timestamp for the "last workout" or do we want to grab it from workout data? prob timestamp
    NSMutableArray *workouts;
    NSMutableDictionary *workoutDays;
    int reminderInterval;
}

@property NSData *imageData;

@property NSString *name;

@property int age;

@property int birthMonth;

@property int birthDay;

@property int birthYear;

@property int weight;

@property int heightIn;

@property int heightFt;

@property NSMutableArray *workouts;

@property NSMutableDictionary *workoutDays;

@property int reminderInterval;

@end
