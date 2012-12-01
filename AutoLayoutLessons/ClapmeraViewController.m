//
//  DetailViewController.m
//  AutoLayoutLessons
//
//  Created by Dario Lencina on 11/29/12.
//  Copyright (c) 2012 Dario Lencina. All rights reserved.
//

#import "ClapmeraViewController.h"

@interface ClapmeraViewController ()

@end

@implementation ClapmeraViewController{
    ADBannerView *_iAdsBanner;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Clapmera", @"Detail");
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self setupiAdNetwork];
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation{
    [self layoutBanners];
}

#pragma mark -
#pragma mark iAds

-(void)setupiAdNetwork{
    _iAdsBanner = [[ADBannerView alloc] init];
    _iAdsBanner.delegate = self;
    [_iAdsBanner setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.bannerView addSubview:_iAdsBanner];
    
    NSLayoutConstraint * leading=[NSLayoutConstraint constraintWithItem:_iAdsBanner attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.bannerView attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    
    NSLayoutConstraint * top=[NSLayoutConstraint constraintWithItem:_iAdsBanner attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.bannerView attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    
    NSLayoutConstraint * width=[NSLayoutConstraint constraintWithItem:_iAdsBanner attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.bannerView attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    
    NSLayoutConstraint * height=[NSLayoutConstraint constraintWithItem:_iAdsBanner attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.bannerView attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    
    [self.bannerView addConstraints:@[top, width, height, leading]];
    [self layoutBanners];
}

#pragma mark iADs delegate

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error{
    [self layoutBanners];
    NSLog(@"didFailToReceiveAdWithError");
}

- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave{
    return YES;
}

- (void)bannerViewActionDidFinish:(ADBannerView *)banner{
    NSLog(@"bannerViewActionDidFinish");
    [self layoutBanners];
}

-(void)bannerViewDidLoadAd:(ADBannerView *)banner{
    NSLog(@"didLoad");
    [self layoutBanners];
}

-(void)layoutBanners{
    if (_iAdsBanner.bannerLoaded) {
        [self shouldShowBanner:nil];
        [self shouldShowBanner:nil];
    }else{
        [self shouldHideBanner:nil];
        [self shouldHideBanner:nil];
    }
}

- (IBAction)shouldShowBanner:(UIButton *)sender {
    [UIView animateWithDuration:0.3 animations:^{
        [self.bannerHeight setConstant:(_iAdsBanner.bannerLoaded)?_iAdsBanner.frame.size.height:40];
        [_verticalSpacingOfBanner setConstant:0];
        [self.view layoutSubviews];
    }];
}

- (IBAction)shouldHideBanner:(UIButton *)sender {
    [UIView animateWithDuration:0.3 animations:^{
        [self.bannerHeight setConstant:(_iAdsBanner.bannerLoaded)?_iAdsBanner.frame.size.height:40];
        [_verticalSpacingOfBanner setConstant:(_iAdsBanner.bannerLoaded)?_iAdsBanner.frame.size.height:40];
        [self.view layoutSubviews];
    }];
}
@end
