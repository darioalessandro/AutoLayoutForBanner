//
//  GalleryCell.m
//  AutoLayoutLessons
//
//  Created by Dario Lencina on 12/4/12.
//  Copyright (c) 2012 Dario Lencina. All rights reserved.
//

#import "GalleryCell.h"

@implementation GalleryCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
