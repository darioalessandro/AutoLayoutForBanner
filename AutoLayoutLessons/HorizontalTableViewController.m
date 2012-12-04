//
//  HorizontalTableViewController.m
//  AutoLayoutLessons
//
//  Created by Dario Lencina on 12/4/12.
//  Copyright (c) 2012 Dario Lencina. All rights reserved.
//

#import "HorizontalTableViewController.h"
#define kTagToGetCustomImageView 656

@interface HorizontalTableViewController ()

@end

@implementation HorizontalTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    [self initializeTableView];
    self.view.backgroundColor=[UIColor greenColor];
}

-(void)initializeTableView{
    self.tableView=[[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.tableView.pagingEnabled=TRUE;
    [self.view addSubview:self.tableView];
    [self.view addConstraints:[self tableViewLayoutConstrains]];
    self.tableView.transform=CGAffineTransformMakeRotation(M_PI/2);
}

-(void)viewDidAppear:(BOOL)animated{
    [self.tableView reloadData];
}

-(NSArray *)tableViewLayoutConstrains{
    NSLayoutConstraint * leading=[NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    
    NSLayoutConstraint * top=[NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    
    NSLayoutConstraint * width=[NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    
    NSLayoutConstraint * height=[NSLayoutConstraint constraintWithItem:_tableView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    return @[top, width, height, leading];
}

#pragma mark - TableViewStuff

-(void)initializeCell:(UITableViewCell *)cell{
    cell.backgroundView=[[UIView alloc] initWithFrame:cell.frame];
    cell.backgroundView.backgroundColor=[UIColor greenColor];
    [cell setClipsToBounds:TRUE];
    UIImage * image=[UIImage imageNamed:@"chevrolet_volt06.jpg"];
    UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
    [imageView setBackgroundColor:[UIColor greenColor]];
    imageView.tag=kTagToGetCustomImageView;
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    [cell addSubview:imageView];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * reuseIdentifier=@"galleryCell";
    UITableViewCell * cell= [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if(!cell){
        cell= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
        [self initializeCell:cell];
    }
    if(indexPath.row%2==0){
        cell.backgroundView.backgroundColor=[UIColor greenColor];
    }else{
        cell.backgroundView.backgroundColor=[UIColor blueColor];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.transform=CGAffineTransformMakeRotation(-M_PI/2);
    UIImageView * imageView=(UIImageView *)[cell viewWithTag:kTagToGetCustomImageView];
    [imageView setFrame:cell.bounds];
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.tableView.frame.size.width;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:TRUE];
}

@end
