//
//  WeekCell.m
//  TestCollectionView
//
//  Created by 徐继垚 on 15/1/15.
//  Copyright (c) 2015年 徐继垚. All rights reserved.
//


#import "CourceCell.h"

@implementation CourceCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel = [[UILabel alloc] initWithFrame:self.contentView.bounds];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:self.titleLabel];
        
        self.titleLabel.layer.borderWidth = 0.5f;
        self.titleLabel.layer.borderColor = [[UIColor grayColor] CGColor];
    }
    return self;
}
@end
