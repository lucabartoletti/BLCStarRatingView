//
//  BLCStarRatingView.h
//  BLCStarRatingView
//
//  Created by Luca Bartoletti on 16/04/2014.
//  Copyright (c) 2014 Luca Bartoletti. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BLCStarRatingView;

@protocol BLCStarRatingViewDelegate <NSObject>

@optional

- (void)starRatingViewUpdateBegan:(BLCStarRatingView*)ratingView;

- (void)starRatingView:(BLCStarRatingView*)starRatingView rateDidChange:(NSUInteger)value;

- (void)starRatingViewUpdateEnded:(BLCStarRatingView*)ratingView;

@end

@interface BLCStarRatingView : UIView

/**
 *  The rating value. Default is 0
 */
@property (assign, nonatomic) NSUInteger rating;

@property (weak, nonatomic) id<BLCStarRatingViewDelegate> delegate;

/**
 *  The horizontal space between stars. Default is 5
 */
@property (assign, nonatomic) CGFloat starHorizontalSpace;

/**
 *  The rated image
 */
@property (strong, nonatomic) UIImage *ratedImage;

/**
 *  The placeholder image.
 */
@property (strong, nonatomic) UIImage *placeholderImage;

@end
