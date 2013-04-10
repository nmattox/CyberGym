//
//  UserWorkoutHistory.m
//  FitLock
//
//  Created by Nolan Mattox on 4/9/13.
//  Copyright (c) 2013 CSCI477. All rights reserved.
//

#import "UserWorkoutHistory.h"

@implementation UserWorkoutHistory

@synthesize workouts;

-(void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeObject:workouts forKey:@"workouts" ];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        workouts = [decoder decodeObjectForKey:@"workouts"];
    }
    return self;
}

@end
