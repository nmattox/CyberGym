//
//  Workout.m
//  FitLock
//
//  Created by Nolan Mattox on 3/26/13.
//  Copyright (c) 2013 CSCI477. All rights reserved.
//

#import "Workout.h"

@implementation Workout

@synthesize completed = _completed;

@synthesize date = _date;

@synthesize repNumber = _repNumber;

@synthesize type = _type;

-(void)encodeWithCoder:(NSCoder *)encoder {
    //Encode properties, other class variables, etc
    [encoder encodeBool:_completed forKey:@"completed"];
    [encoder encodeObject:_date forKey:@"date"];
    [encoder encodeObject:_type forKey:@"type"];
    [encoder encodeInt:_repNumber forKey:@"repNumber"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if((self = [super init])) {
        //decode properties, other class vars
        _completed = [decoder decodeBoolForKey:@"completed"];
        _date = [decoder decodeObjectForKey:@"date"];
        _type = [decoder decodeObjectForKey:@"type"];
        _repNumber = [decoder decodeIntForKey:@"repNumber"];
    }
    return self;
}

@end
