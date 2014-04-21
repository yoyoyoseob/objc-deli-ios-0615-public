---
  tags: methods, arrays, iteration
  languages: objc
---

# Deli Counter - Take a Number

## Instructions

A pretty important deli needs somebody to program the "Take a Number" feature for their counter.

At the beginning of the day, the deli is empty and is represented by an empty array.  Create the NSMutable array as an instance variable in your implementation.  Name the instance variable your array whatever you want.

Example: 

 ```objc 

//
//  FISAppDelegate.m
//  Objc-deli
//
//  Created by Al Tyus on 2/3/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import "FISAppDelegate.h"

@implementation FISAppDelegate{
    NSMutableArray *katzDeli;
}

 ```

Write all of your code in `FISAppDelegate.m`.  All method signatures should be added to 'FISAppDelegate.h'.

1. Write a setter and getter method for the `katzDeli` instance variable

2. Build a method that a new customer will use when entering the deli. The method, `takeANumberWithName:`, should accept the new person's name, and tell them their position in line (as an NSNumber). And don't go being too programmer-y and give them their index. These are normal people. If they are 7th in line, tell them that. Don't get their hopes up by telling them they are number 6 in line.

3. Build a method `nowServing`. This method should return (as an NSString) the name of the next person in line and then remove them from the line. If there is nobody in line, it should say that "There is nobody waiting to be served!"

4. Build a method `line` that shows people their current place in line (returned as an NSString). If there is nobody in line, it should say "The line is currently empty."

Example usage:
	
```objc

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.


katzDeli = [[NSMutableArray alloc] init];

[self takeANumberWithName:@"Ada"]; //Returns @1
[self takeANumberWithName:@"Grace"]; //Returns @2
[self takeANumberWithName:@"Kent"]; //Returns @3

[self line]; // "The line is currently: 1. Ada 2. Grace 3. Kent"

[self nowServing]; // "Currently Serving Ada"

[self line]; // "The line is currently: 1. Grace 2. Kent"

[self takeANumberWithName: @"Steve"]; //Returns @3

[self line]; // "The line is currently: 1. Grace 2. Kent 3. Steve"

[self nowServing] // "Currently Serving Grace"

[self line]; // "The line is currently: 1. Kent 2. Steve"
 


return YES;
}
```
