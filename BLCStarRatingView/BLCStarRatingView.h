//
//  BLCStarRatingView.h
//  BLCStarRatingView
//
//  Created by Luca Bartoletti on 16/04/2014.
//  Copyright (c) 2014 Luca Bartoletti. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, BLCStarRatingViewState) {
    BLCStarRatingViewStateNormal,
    BLCStarRatingViewStateHighlighted
};

@interface BLCStarRatingView : UIView

/**
 *  The rating value. Default is 0
 */
@property (assign, nonatomic) NSUInteger rating;

/**
 *  The horizontal space between stars. Default is 5
 */
@property (assign, nonatomic) CGFloat starHorizontalSpace;

/**
 *  Set the star image for the state
 *
 *  @param image The image of the star
 *  @param state The state that will use the image
 */
- (void)setImage:(UIImage*)image forState:(BLCStarRatingViewState)state;

@end
