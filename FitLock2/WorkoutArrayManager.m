//
//  WorkoutArrayManager.m
//  FitLock
//
//  Created by Nolan Mattox on 3/26/13.
//  Copyright (c) 2013 CSCI477. All rights reserved.
//

#import "WorkoutArrayManager.h"

@implementation WorkoutArrayManager

-(NSMutableArray*)getWorkoutArrayFromDefaults
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    return [defaults objectForKey:@"workouts"]; // TODO: this might be sketch, what if it's called before array is initialized...
}

@end
