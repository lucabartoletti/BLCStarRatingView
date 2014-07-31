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

- (void)p_initialize;
- (void)p_drawStarAtPosition:(NSInteger)position;
- (CGSize)p_intrinsicSize;
- (CGSize)p_starSize;
- (void)p_updateStarsValueWithTouchAtPoint:(CGPoint)point;

@end

@implementation BLCStarRatingView
{
    NSUInteger _touchBeganRating;
}

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

#pragma mark - Layout

- (CGSize)sizeThatFits:(CGSize)size
{
    return [self p_intrinsicSize];
}

- (CGSize)intrinsicContentSize
{
    return [self p_intrinsicSize];
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect
{
    for (NSInteger i=0; i<kBLCStarRatingViewNumberOfStar; i++) {
        [self p_drawStarAtPosition:i];
    }
}

#pragma mark - Public methods

- (void)setRating:(NSUInteger)rating
{
    BOOL isUpdated = (_rating != rating);
    
    _rating = rating;
    
    if (isUpdated) {
        [self setNeedsDisplay];
        [self p_delegateDidChangeRating:_rating];
    }
}

- (void)setRatedImage:(UIImage *)image
{
    _ratedImage = image;
    
    [self setNeedsDisplay];
    [self invalidateIntrinsicContentSize];
}

- (void)setPlaceholderImage:(UIImage *)image
{
    _placeholderImage = image;
    
    [self setNeedsDisplay];
    [self invalidateIntrinsicContentSize];
}

- (void)setStarHorizontalSpace:(CGFloat)starHorizontalSpace
{
    _starHorizontalSpace = starHorizontalSpace;
    
    [self setNeedsDisplay];
    [self invalidateIntrinsicContentSize];
}

#pragma mark - Touches 

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    _touchBeganRating = self.rating;
    
    UITouch *touch = [touches anyObject];
    
    [self p_updateStarsValueWithTouchAtPoint:[touch locationInView:self]];
    
    [self p_delegateUpdateBegan];
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
    
    [self p_delegateUpdateEnded];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self p_delegateUpdateEnded];
}

#pragma mark - Private methods

- (void)p_initialize
{
    self.starHorizontalSpace = 5;
    self.rating = 0;
    self.contentMode = UIViewContentModeRedraw;
}

- (void)p_updateStarsValueWithTouchAtPoint:(CGPoint)point
{
    CGSize starsSize = [self p_intrinsicSize];
    
    CGFloat percentage = (point.x/starsSize.width);
    if (percentage>1) {
        percentage = 1;
    } else if (percentage<0) {
        percentage = 0;
    }
    
    NSUInteger rating = ceilf(percentage*kBLCStarRatingViewNumberOfStar);
    
    self.rating = rating;
}

- (void)p_drawStarAtPosition:(NSInteger)position
{
    CGSize starSize = [self p_starSize];
    CGSize instrinsicSize = [self p_intrinsicSize];
    
    //Calculate position x
    CGFloat x = (round(starSize.width*position));
    x += (self.starHorizontalSpace*position);
    
    //Calculate position y
    CGFloat y = round((CGRectGetHeight(self.frame)/2) - (instrinsicSize.height/2));
    
    //Draw
    [_placeholderImage drawAtPoint:CGPointMake(x, y)];
    if (position<self.rating) {
        [_ratedImage drawAtPoint:CGPointMake(x,y)];
    }
}

- (CGSize)p_intrinsicSize;
{
    CGSize intrinsicSize = [self p_starSize];
    
    intrinsicSize.width *= kBLCStarRatingViewNumberOfStar;
    intrinsicSize.width += (self.starHorizontalSpace*(kBLCStarRatingViewNumberOfStar-1));
    
    return intrinsicSize;
}

- (CGSize)p_starSize;
{
    CGFloat starWidth = 0;
    CGFloat starHeight = 0;
    
    if (_placeholderImage.size.width>=_ratedImage.size.width) {
        starWidth = _placeholderImage.size.width;
    } else {
        starWidth = _ratedImage.size.width;
    }
    
    if (_placeholderImage.size.height>=_ratedImage.size.height) {
        starHeight = _placeholderImage.size.height;
    } else {
        starHeight = _ratedImage.size.height;
    }
    
    return CGSizeMake(starWidth, starHeight);
}

- (void)p_delegateDidChangeRating:(NSUInteger)rating;
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(starRatingView:rateDidChange:)]) {
        [self.delegate starRatingView:self rateDidChange:rating];
    }
}

- (void)p_delegateUpdateBegan;
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(starRatingViewUpdateBegan:)]) {
        [self.delegate starRatingViewUpdateBegan:self];
    }
}

- (void)p_delegateUpdateEnded;
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(starRatingViewUpdateEnded:)]) {
        [self.delegate starRatingViewUpdateEnded:self];
    }
}

@end
