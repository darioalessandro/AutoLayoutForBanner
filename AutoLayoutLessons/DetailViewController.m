//
//  DetailViewController.m
//  AutoLayoutLessons
//
//  Created by Dario Lencina on 11/29/12.
//  Copyright (c) 2012 Dario Lencina. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController{

}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Clapmera", @"Detail");
    }
    return self;
}

- (IBAction)shouldShowBanner:(UIButton *)sender {
    [UIView animateWithDuration:0.3 animations:^{
        [_verticalSpacingOfBanner setConstant:0];
        [self.view layoutSubviews];
    }];
}

- (IBAction)shouldHideBanner:(UIButton *)sender {
    [UIView animateWithDuration:0.3 animations:^{
        [_verticalSpacingOfBanner setConstant:40];
        [self.view layoutSubviews];
    }];
}
@end
