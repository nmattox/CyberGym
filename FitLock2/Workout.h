//
//  Workout.h
//  FitLock
//
//  Created by Nolan Mattox on 3/26/13.
//  Copyright (c) 2013 CSCI477. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Workout : NSObject{
    NSDate *date;
    NSString *type;
    int *repNumber;
    bool *completed;
}

@property NSDate *date;

@property NSString *type;

@property int *repNumber;

@property bool *completed;

@end
