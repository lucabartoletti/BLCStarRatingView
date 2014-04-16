//
//  ViewController.m
//  BLCStarRatingView
//
//  Created by Luca Bartoletti on 16/04/2014.
//  Copyright (c) 2014 Luca Bartoletti. All rights reserved.
//

#import "ViewController.h"
#import "BLCStarRatingView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet BLCStarRatingView *starRatingView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *starRatingViewWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *starRatingViewHeightConstraint;

@property (assign, nonatomic) CGFloat defaultStarRatingViewWidthConstraint;
@property (assign, nonatomic) CGFloat defaultStarRatingViewHeightConstraint;

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
    
    [self.starRatingView setImage:[UIImage imageNamed:@"star"] forState:BLCStarRatingViewStateNormal];
    [self.starRatingView setImage:[UIImage imageNamed:@"star_highlighted"] forState:BLCStarRatingViewStateHighlighted];
    
    self.defaultStarRatingViewHeightConstraint = self.starRatingViewHeightConstraint.constant;
    self.defaultStarRatingViewWidthConstraint = self.starRatingViewWidthConstraint.constant;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)heighValueChanged:(id)sender
{
    UISlider *slider = sender;
    self.starRatingViewHeightConstraint.constant = self.defaultStarRatingViewHeightConstraint * slider.value;
}

- (IBAction)widthValueChanged:(id)sender
{
    UISlider *slider = sender;
    self.starRatingViewWidthConstraint.constant = self.defaultStarRatingViewWidthConstraint * slider.value;
}

- (IBAction)rateSegmentedControlValueChanged:(id)sender
{
    UISegmentedControl *segmentedControl = sender;
    self.starRatingView.rating = segmentedControl.selectedSegmentIndex;
}


- (IBAction)sizeToFitAction:(id)sender
{
    [self.starRatingView sizeToFit];
}

@end
