---
  tags: methods, arrays, iteration
  languages: objc
---

# Deli Counter - Take a Number

## Instructions

A pretty important deli needs somebody to program the "Take a Number" feature for their counter.

At the beginning of the day, the deli is empty and is represented by an empty array.  Create the NSMutable array as an instance variable in your implementation.  Name the instance variable your array whatever you want.  

Write all of your code in `FISAppDelegate.m`.  All method signatures should be added to 'FISAppDelegate.h'.

1. Build a method that a new customer will use when entering the deli. The method, `takeANumberWithLine:name:`, should accept the current line of people, `katzDeli`, along with the new person's name, and tell them their position in line (as an NSNumber). And don't go being too programmer-y and give them their index. These are normal people. If they are 7th in line, tell them that. Don't get their hopes up by telling them they are number 6 in line.

2. Build a method `nowServing`. This method should return (as an NSString) the name of the next person in line and then remove them from the line. If there is nobody in line, it should say that "There is nobody waiting to be served!"

3. Build a method `line:` that shows people their current place in line (returned as an NSString). If there is nobody in line, it should say "The line is currently empty."

Example usage:
	
```objc
NSMutableArray *katzDeli = [[NSMutableArray alloc] init];

[self takeANumberWithLine:katzDeli name:@"Ada"]; //Returns @1
[self takeANumberWithLine:katzDeli name:@"Grace"]; //Returns @2
[self takeANumberWithLine:katzDeli name:@"Kent"]; //Returns @3

[self line:katzDeli]; // "The line is currently: 1. Ada 2. Grace 3. Kent"

[self nowServing:katzDeli]; // "Currently Serving Ada"

[self line:katzDeli]; // "The line is currently: 1. Grace 2. Kent"

[self takeANumberWithLine:katzDeli name: @"Steve"]; //Returns @3

[self line:katzDeli]; // "The line is currently: 1. Grace 2. Kent 3. Steve"

[self nowServing:katzDeli] // "Currently Serving Grace"

[self line:katzDeli]; // "The line is currently: 1. Kent 2. Steve"
```
