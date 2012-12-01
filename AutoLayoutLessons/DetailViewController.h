//
//  DetailViewController.h
//  AutoLayoutLessons
//
//  Created by Dario Lencina on 11/29/12.
//  Copyright (c) 2012 Dario Lencina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

- (IBAction)shouldShowBanner:(UIButton *)sender;
- (IBAction)shouldHideBanner:(UIButton *)sender;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *verticalSpacingOfBanner;
@property (weak, nonatomic) IBOutlet UIView *bannerView;
@end
