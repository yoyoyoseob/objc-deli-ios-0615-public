//
//  FISAppDelegate.h
//  Objc-deli
//
//  Created by Al Tyus on 2/3/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
-(NSString *)deliLine:(NSMutableArray *)deliLine;
-(NSMutableArray *)nowServingWithDeliLine:(NSMutableArray *)deliLine;
-(NSMutableArray *)takeANumberWithDeliLine:(NSMutableArray *)deliLine Name:(NSString *)newName;

@end
