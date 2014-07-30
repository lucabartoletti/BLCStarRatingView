//
//  ViewController.m
//  BLCStarRatingView
//
//  Created by Luca Bartoletti on 16/04/2014.
//  Copyright (c) 2014 Luca Bartoletti. All rights reserved.
//

#import "ViewController.h"
#import "BLCStarRatingView.h"

typedef NS_ENUM(NSUInteger, ImageType) {
    ImageTypeSmall  = 0,
    ImageTypeBig    = 1
};

@interface ViewController ()  <BLCStarRatingViewDelegate>

@property (weak, nonatomic) IBOutlet BLCStarRatingView *starRatingView;

@property (weak, nonatomic) IBOutlet UISegmentedControl *imageSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *rateSegmentedControl;

@end

@implementation ViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.starRatingView.delegate = self;
    
    [self p_updatedRatingViewWithImageType:self.imageSegmentedControl.selectedSegmentIndex];
}

- (IBAction)rateSegmentedControlValueChanged:(id)sender
{
    UISegmentedControl *segmentedControl = sender;
    self.starRatingView.rating = segmentedControl.selectedSegmentIndex;
}

- (IBAction)imageSegmentedControlValueChanged:(id)sender {
    UISegmentedControl *segmentedControl = sender;
    [self p_updatedRatingViewWithImageType:segmentedControl.selectedSegmentIndex];
}

- (IBAction)spaceSliderValueChanged:(id)sender {
    UISlider *slider = sender;
    self.starRatingView.starHorizontalSpace = slider.value;
}


- (void)p_updatedRatingViewWithImageType:(ImageType)type {
    
    //Updates the images to match the type
    if (type == ImageTypeSmall) {
        self.starRatingView.placeholderImage = [UIImage imageNamed:@"star"];
        self.starRatingView.ratedImage = [UIImage imageNamed:@"star_highlighted"];
    } else {
        self.starRatingView.placeholderImage = [UIImage imageNamed:@"star_big"];
        self.starRatingView.ratedImage = [UIImage imageNamed:@"star_highlighted_big"];
    }
}

#pragma mark - StarRatingView delegate

- (void)starRatingView:(BLCStarRatingView *)starRatingView rateDidChange:(NSUInteger)value
{
    NSLog(@"Delegate rating <%lu>", (unsigned long)value);
    
    if (value>5) {
        NSLog(@"");
    }
    
    self.rateSegmentedControl.selectedSegmentIndex = value;
}

- (void)starRatingViewUpdateBegan:(BLCStarRatingView *)ratingView
{
    NSLog(@"Delegate update began");
}

- (void)starRatingViewUpdateEnded:(BLCStarRatingView *)ratingView
{
    NSLog(@"Delegate update ended");
}

@end
