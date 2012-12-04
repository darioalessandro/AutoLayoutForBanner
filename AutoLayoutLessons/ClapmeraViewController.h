//
//  DetailViewController.h
//  AutoLayoutLessons
//
//  Created by Dario Lencina on 11/29/12.
//  Copyright (c) 2012 Dario Lencina. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface ClapmeraViewController : UIViewController <ADBannerViewDelegate>

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *verticalSpacingOfBanner;
@property (weak, nonatomic) IBOutlet UIView *bannerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bannerHeight;
@end
