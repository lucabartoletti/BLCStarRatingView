//
//  BLCStarRatingView.m
//  BLCStarRatingView
//
//  Created by Luca Bartoletti on 16/04/2014.
//  Copyright (c) 2014 Luca Bartoletti. All rights reserved.
//

#import "BLCStarRatingView.h"

#import <QuartzCore/QuartzCore.h>

static const NSInteger kBLCStarRatingViewNumberOfStar = 5;

@interface BLCStarRatingView ()

@property (strong, nonatomic) UIImage *starImage;
@property (strong, nonatomic) UIImage *highlightedStarImage;

- (void)p_initialize;
- (void)p_drawStarAtPosition:(NSInteger)position;
- (CGSize)p_starsIntrinsicSize;

- (void)p_updateStarsValueWithTouchAtPoint:(CGPoint)point;

@end

@implementation BLCStarRatingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self p_initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self p_initialize];
    }
    return self;
}

- (void)setContentMode:(UIViewContentMode)contentMode
{
    if (contentMode != UIViewContentModeRedraw) {
        NSLog(@"The BLCStarRatingView support only the UIViewContentModeRedraw");
    }
    
    [super setContentMode:UIViewContentModeRedraw];
}

- (CGSize)sizeThatFits:(CGSize)size
{
    return [self p_starsIntrinsicSize];
}

- (CGSize)intrinsicContentSize
{
    return [self p_starsIntrinsicSize];
}

#pragma mark - Setter/Getter

- (void)setRating:(NSUInteger)rating
{
    BOOL isUpdate = (_rating != rating);
    _rating = rating;
    
    if (isUpdate) {
        [self setNeedsDisplay];
    }
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect
{
    for (NSInteger i=0; i<kBLCStarRatingViewNumberOfStar; i++) {
        [self p_drawStarAtPosition:i];
    }
}

#pragma mark - Public methods

- (void)setImage:(UIImage *)image forState:(BLCStarRatingViewState)state
{
    if (state == BLCStarRatingViewStateNormal) {
        self.starImage = image;
    } else {
        self.highlightedStarImage = image;
    }
    
    [self setNeedsDisplay];
}

#pragma mark - Touches 

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    [self p_updateStarsValueWithTouchAtPoint:[touch locationInView:self]];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    [self p_updateStarsValueWithTouchAtPoint:[touch locationInView:self]];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    [self p_updateStarsValueWithTouchAtPoint:[touch locationInView:self]];
}

#pragma mark - Private methods

- (void)p_initialize
{
    self.starHorizontalSpace = 5;
    self.rating = 0;
}

- (void)p_updateStarsValueWithTouchAtPoint:(CGPoint)point
{
    CGSize starsSize = [self p_starsIntrinsicSize];
    
    CGFloat percentage = (point.x/starsSize.width);
    if (percentage>1) {
        percentage = 1;
    }
    NSUInteger rating = ceilf(percentage*kBLCStarRatingViewNumberOfStar);
    self.rating = rating;
}

- (void)p_drawStarAtPosition:(NSInteger)position
{
    CGSize starsSize = [self p_starsIntrinsicSize];
    CGFloat x = (floorf(starsSize.width/kBLCStarRatingViewNumberOfStar))*position;
    CGFloat y = floorf((CGRectGetHeight(self.frame)/2) - (starsSize.height/2));
    [_starImage drawAtPoint:CGPointMake(x, y)];
    if (position<self.rating) {
        [_highlightedStarImage drawAtPoint:CGPointMake(x,y)];
    }
}

- (CGSize)p_starsIntrinsicSize;
{
    CGFloat starWidth = 0;
    CGFloat starHeight = 0;
    
    if (_starImage.size.width>=_highlightedStarImage.size.width) {
        starWidth = _starImage.size.width;
    } else {
        starWidth = _highlightedStarImage.size.width;
    }
    
    if (_starImage.size.height>=_highlightedStarImage.size.height) {
        starHeight = _starImage.size.height;
    } else {
        starHeight = _highlightedStarImage.size.height;
    }
    
    starWidth *= kBLCStarRatingViewNumberOfStar;
    starWidth += self.starHorizontalSpace*(kBLCStarRatingViewNumberOfStar-2);
    
    return CGSizeMake(starWidth, starHeight);
}

@end
