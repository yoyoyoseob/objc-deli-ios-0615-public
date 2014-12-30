//
//  FISAppDelegateSpec.m
//  Objc-deli
//
//  Created by Joe Burgess on 5/29/14.
//  Copyright 2014 Flatiron School. All rights reserved.
//

#import "Specta.h"
#import "FISAppDelegate.h"
#define EXP_SHORTHAND
#import <Expecta.h>

SpecBegin(FISAppDelegate)

describe(@"FISAppDelegate", ^{

    __block FISAppDelegate *delegate;
    __block NSMutableArray *deliLine;
    beforeAll(^{
        delegate = [[FISAppDelegate alloc] init];
    });
    
    beforeEach(^{
        deliLine = [[NSMutableArray alloc] init];
    });

    describe(@"takeaNumberWithName method", ^{
        it(@"Should respond to the correct selector", ^{
            expect(delegate).to.respondTo(@selector(takeANumberWithDeliLine:Name:));
        });

        it(@"Should return a deli with another person", ^{
            expect([delegate takeANumberWithDeliLine:deliLine Name:@"Ada"]).to.equal(@[@"Ada"]);
        });
    });

    describe(@"nowServingWithDeli:", ^{
        it(@"Should respond to the correct selector", ^{
            expect(delegate).to.respondTo(@selector(nowServingWithDeliLine:));
        });

        it(@"Should remove the person from the deli", ^{
            [deliLine addObject:@"Ada"];
            [deliLine addObject:@"Al"];
            expect([delegate nowServingWithDeliLine:deliLine]).to.equal(@[@"Al"]);
        });

        it(@"Should return empty array for empty deli", ^{
            expect([delegate nowServingWithDeliLine:deliLine]).to.equal(@[]);
        });
    });

    describe(@"lineWithDeli: method", ^{
        it(@"Should respond to the correct selector", ^{
            expect(delegate).to.respondTo(@selector(deliLine:));
        });

        it(@"Should return the appropriate line", ^{
            [deliLine addObject:@"Ada"];
            [deliLine addObject:@"Al"];
            expect([delegate deliLine:deliLine]).to.equal(@"The line is currently: 1. Ada 2. Al");
        });

        it(@"Should return The line is empty if it's empty", ^{
            expect([delegate deliLine:deliLine]).to.equal(@"The line is empty");
        });
    });

    afterEach(^{

    });
    
    afterAll(^{

    });
});

SpecEnd
