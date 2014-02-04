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

//- (NSArray *)katzDeli
//{
//    if (!_katzDeli)
//    {
//        _katzDeli = @[@"John", @"Jess", @"Eric", @"Tom", @"Jacob"];
//    }
//    return _katzDeli;
//}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testTakeANumberWithLineAndNameReturnsNSNumber
{
    XCTAssertTrue([[appDelegate takeANumberWithLine:katzDeli name:@"Ada"] isKindOfClass:[NSNumber class]], @"Method should return an NSNumber");
}
- (void)testTakeANumberWithLineandNameReturnsPositionInLine
{
    NSNumber *position1 = [appDelegate takeANumberWithLine:katzDeli name:@"Ada"];
    XCTAssertEqualObjects(position1, @1, @"Test should return 1 when first in line");
    
    NSNumber *position2 = [appDelegate takeANumberWithLine:katzDeli name:@"Grace"];
    XCTAssertEqualObjects(position2, @2, @"Test should return 2 when second in line");
    
    NSNumber *position3 = [appDelegate takeANumberWithLine:katzDeli name:@"Kent"];
    XCTAssertEqualObjects(position3, @3, @"Test should return 3 when third in line");
}
- (void)testTakeANumberWithEmptyLineAndNameReturnsFirstPositionInLine
{
    NSNumber *position = [appDelegate takeANumberWithLine:@[] name:@"James"];
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
    [appDelegate takeANumberWithLine:katzDeli name:@"Ada"];
    [FISAppDelegate takeANumberWithLine:katzDeli name:@"Grace"];
    [FISAppDelegate takeANumberWithLine:katzDeli name:@"Kent"];
    
    XCTAssertEqualObjects([FISAppDelegate nowServing], @"Currently Serving Kent", @"Now Serving should return the current customer as a string");
    XCTAssertEqualObjects([FISAppDelegate nowServing], @"Currently Serving Grace", @"Now Serving should return the current customer as a string");
    XCTAssertEqualObjects([FISAppDelegate nowServing], @"Currently Serving Ada", @"Now Serving should return the current customer as a string");
}

- (void)testLineShowsCurrentLine
{
    [FISAppDelegate takeANumberWithLine:katzDeli name:@"Ada"]; //Returns @1
    XCTAssertEqualObjects([FISAppDelegate line:katzDeli], @"The line is currently: 1. Ada", @"The line should return the line of customers");
    [FISAppDelegate takeANumberWithLine:katzDeli name:@"Grace"]; //Returns @1
    XCTAssertEqualObjects([FISAppDelegate line:katzDeli], @"The line is currently: 1. Ada 2. Grace", @"The line should return the line of customers");
    [FISAppDelegate takeANumberWithLine:katzDeli name:@"Kent"]; //Returns @1
    XCTAssertEqualObjects([FISAppDelegate line:katzDeli], @"The line is currently: 1. Ada 2. Grace 3. Kent", @"The line should return the line of customers");
}


@end
