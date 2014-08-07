//
//  BLCStarRatingView.h
//  BLCStarRatingView
//
//  Created by Luca Bartoletti on 16/04/2014.
//  Copyright (c) 2014 Luca Bartoletti. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BLCStarRatingView;

/**
 *  The BLCStarRatingViewDelegate defines the methods that informs you
 *  about the updates of the rating of a BLCStarRatingView
 *
 *  @see BLCStarRatingView
 */
@protocol BLCStarRatingViewDelegate <NSObject>

@optional

/**
 *  Called when the user start an update phase
 *
 *  @param ratingView The rating view in which the update occurs
 */
- (void)starRatingViewUpdateBegan:(BLCStarRatingView*)ratingView;

/**
 *  Called when the value of the rating is updated
 *
 *  @param ratingView The rating view in which the update occurs
 *  @param value The update value of the rating
 */
- (void)starRatingView:(BLCStarRatingView*)starRatingView rateDidChange:(NSUInteger)value;

/**
 *  Called when the user ends an update phase
 *
 *  @param ratingView The rating view in which the update occurred
 */
- (void)starRatingViewUpdateEnded:(BLCStarRatingView*)ratingView;

@end

/**
 *  A BLCStarRatingView is a view that allows the user to perform ratings
 *
 *  The properties ratedImage and placeholderImage must be setted
 *  to specify the images to use to render the view. The rating is the current rating value
 *  of the view
 *
 *  A delegate object should implement the methods defined in the BLCStarRatingViewDelegate protocol
 *  to receive notifications about the updates of the view.
 *
 *  @see BLCStarRatingViewDelegate
 */
@interface BLCStarRatingView : UIView

/**
 *  The rating value. Default is 0
 */
@property (assign, nonatomic) NSUInteger rating;

/**
 *  The delegate
 */
@property (weak, nonatomic) id<BLCStarRatingViewDelegate> delegate;

/**
 *  The horizontal space between stars. Default is 5.0f
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
