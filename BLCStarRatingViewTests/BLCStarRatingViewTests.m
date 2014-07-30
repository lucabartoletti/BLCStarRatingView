//
//  BLCStarRatingViewTests.m
//  BLCStarRatingViewTests
//
//  Created by Luca Bartoletti on 16/04/2014.
//  Copyright (c) 2014 Luca Bartoletti. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BLCStarRatingView.h"

@interface BLCStarRatingViewTests : XCTestCase

@end

@implementation BLCStarRatingViewTests
{
    BLCStarRatingView *_ratingView;
}

- (void)setUp
{
    [super setUp];
    
    _ratingView = [BLCStarRatingView new];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testThatExists
{
    XCTAssertNotNil([BLCStarRatingView new], @"The BLCStarRatingView should be instantiable");
}

#pragma mark - setter

- (void)testThatRatingIsSettable
{
    _ratingView.rating = 1;
    
    XCTAssertTrue(_ratingView.rating == 1, @"The rating should be setted to 1");
}

- (void)testThatDelegateIsSettable
{
    id<BLCStarRatingViewDelegate> obj = (id<BLCStarRatingViewDelegate>)[NSObject new];
    
    _ratingView.delegate = obj;
    XCTAssertTrue([obj isEqual:_ratingView.delegate], @"The delegate method should be settable");
}

@end
