//
//  Objc_deliTests.m
//  Objc-deliTests
//
//  Created by Al Tyus on 2/3/14.
//  Copyright (c) 2014 Flatiron School. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FISAppDelegate.h"

@interface Objc_deliTests : XCTestCase

@property (strong, nonatomic) NSArray *katzDeli;
@property (strong, nonatomic) FISAppDelegate *appdelegate;
@end

@implementation Objc_deliTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
}

- (NSArray *)katzDeli
{
    if (!_katzDeli)
    {
        _katzDeli = @[@"John", @"Jess", @"Eric", @"Tom", @"Jacob"];
    }
    return _katzDeli;
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


- (void)testTakeANumberWithLineAndNameReturnsNSNumber
{
    XCTAssertTrue([[FISAppDelegate takeANumberWithLine:self.katzDeli name:@"James"] isKindOfClass:[NSNumber class]], @"Method should return an NSNumber");
}
- (void)testTakeANumberWithLineandNameReturnsPositionInLine
{
    NSNumber *position = [FISAppDelegate takeANumberWithLine:self.katzDeli name:@"James"];
    XCTAssertEqualObjects(position, @6, @"Test should return 6 when lined up behind 5 others");
}
- (void)testTakeANumberWithEmptyLineAndNameReturnsFirstPositionInLine
{
    NSNumber *position = [FISAppDelegate takeANumberWithLine:@[] name:@"James"];
    XCTAssertEqualObjects(position, @1, @"Test should return 1 when lined up first");
}


@end
