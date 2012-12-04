//
//  HorizontalTableViewController.h
//  AutoLayoutLessons
//
//  Created by Dario Lencina on 12/4/12.
//  Copyright (c) 2012 Dario Lencina. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HorizontalTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) UITableView * tableView;

@end
