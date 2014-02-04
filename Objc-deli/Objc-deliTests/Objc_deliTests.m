//
//  Objc_deliTests.m
//  Objc-deliTests
//
//  Created by Al Tyus on 2/3/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FISAppDelegate.h"

@interface Objc_deliTests : XCTestCase{
    NSMutableArray *katzDeli;
    FISAppDelegate *appDelegate;
}

@end

@implementation Objc_deliTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    katzDeli = [[NSMutableArray alloc] init];
    appDelegate = [[FISAppDelegate alloc] init];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFISAppDelegateDefaulInitializer
{
    XCTAssertNotNil(appDelegate, @"FIS AppDelegate should be able to be initilized");
}

- (void)testTakeANumberWithLineAndNameReturnsNSNumber
{
    XCTAssertTrue([[appDelegate takeANumberWithName:@"Ada"] isKindOfClass:[NSNumber class]], @"Method should return an NSNumber");
}
- (void)testTakeANumberWithLineandNameReturnsPositionInLine
{
    NSNumber *position1 = [appDelegate takeANumberWithName:@"Ada"];
    XCTAssertEqualObjects(position1, @1, @"Test should return 1 when first in line");
    
    NSNumber *position2 = [appDelegate takeANumberWithName:@"Grace"];
    XCTAssertEqualObjects(position2, @2, @"Test should return 2 when second in line");
    
    NSNumber *position3 = [appDelegate takeANumberWithName:@"Kent"];
    XCTAssertEqualObjects(position3, @3, @"Test should return 3 when third in line");
}
- (void)testTakeANumberWithEmptyLineAndNameReturnsFirstPositionInLine
{
    NSNumber *position = [appDelegate takeANumberWithName:@"James"];
    XCTAssertEqualObjects(position, @1, @"Test should return 1 when lined up first");
}

- (void)testNowServingReturnsString
{
    XCTAssertTrue([[appDelegate nowServing] isKindOfClass:[NSString class]], @"Now Serving should return a String");
}

- (void)testNowServingEmptyLineReturnsEmptyMessage
{
    XCTAssertEqualObjects([appDelegate nowServing], @"There is nobody waiting to be served!", @"When line is empty now serving should tell us that nobody is waiting to be served");
}

- (void)testNowServingReturnsCurrentCustomer
{
    [appDelegate takeANumberWithName:@"Ada"];
    [appDelegate takeANumberWithName:@"Grace"];
    [appDelegate takeANumberWithName:@"Kent"];
    
    XCTAssertEqualObjects([appDelegate nowServing], @"Currently Serving Kent", @"Now Serving should return the current customer as a string");
    XCTAssertEqualObjects([appDelegate nowServing], @"Currently Serving Grace", @"Now Serving should return the current customer as a string");
    XCTAssertEqualObjects([appDelegate nowServing], @"Currently Serving Ada", @"Now Serving should return the current customer as a string");
}

- (void)testLineReturnsString
{
    XCTAssertTrue([[appDelegate line] isKindOfClass:[NSString class]], @"Line should return a string");
}
- (void)testLineShowsCurrentLine
{
    [appDelegate takeANumberWithName:@"Ada"]; //Returns @1
    XCTAssertEqualObjects([appDelegate line], @"The line is currently: 1. Ada", @"The line should return the line of customers");
    [appDelegate takeANumberWithName:@"Grace"]; //Returns @1
    XCTAssertEqualObjects([appDelegate line], @"The line is currently: 1. Ada 2. Grace", @"The line should return the line of customers");
    [appDelegate takeANumberWithName:@"Kent"]; //Returns @1
    XCTAssertEqualObjects([appDelegate line], @"The line is currently: 1. Ada 2. Grace 3. Kent", @"The line should return the line of customers");
}


@end
