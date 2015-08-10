//
//  ViewController.m
//  TestCollectionView
//
//  Created by 徐继垚 on 15/1/15.
//  Copyright (c) 2015年 徐继垚. All rights reserved.
//


#import "ViewController.h"
#import "YLayout.h"
#import "CourceCell.h"

@interface ViewController () <UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collection;
@property (nonatomic, strong) YLayout *ylayout;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ylayout = [[YLayout alloc] init];
    self.ylayout.weekSize = CGSizeMake(80, 30);
    self.ylayout.itemSize = CGSizeMake(80, 100);
    self.ylayout.courseSize = CGSizeMake(40, 100);
    self.ylayout.weekCount = 7;
    self.ylayout.courseCount = 6;
    self.ylayout.totalCount = 7 * 7 + 6;
    self.ylayout.weekCourseCount = 7 + 6;
    
    CGRect rect = self.view.bounds;
    rect.origin.y = 40;
    rect.size.height -= 80;
    self.collection = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:self.ylayout];
    self.collection.delegate = self;
    self.collection.dataSource = self;
    [self.collection registerClass:[CourceCell class] forCellWithReuseIdentifier:@"abc"];
    self.collection.backgroundColor = [UIColor whiteColor];
    self.collection.alwaysBounceHorizontal = NO;
    self.collection.alwaysBounceVertical = NO;
    self.collection.directionalLockEnabled = YES;
    [self.view addSubview:self.collection];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.ylayout.totalCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CourceCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"abc" forIndexPath:indexPath];
    if (indexPath.row < self.ylayout.weekCount) {
        //星期cell
        cell.titleLabel.text = [[NSString alloc] initWithFormat:@"星期%ld",indexPath.row + 1];
        cell.contentView.backgroundColor = [UIColor greenColor];
    }else if (indexPath.row >= self.ylayout.weekCount && indexPath.row < self.ylayout.weekCourseCount){
        //第几节cell
        NSInteger course = (indexPath.row - self.ylayout.weekCount) * 2 + 1;
        cell.titleLabel.text = [[NSString alloc] initWithFormat:@"%ld - %ld",course,course + 1];
        cell.contentView.backgroundColor = [UIColor cyanColor];
    }else {
        //课程cell
        NSInteger index = indexPath.row - self.ylayout.weekCourseCount;

        NSInteger week = index % self.ylayout.weekCount + 1;
        NSInteger course = index / self.ylayout.weekCount + 1;
        cell.titleLabel.text = [[NSString alloc] initWithFormat:@"星期%ld \n第%ld - %ld节",week,course,course + 1];
        cell.contentView.backgroundColor = [UIColor yellowColor];
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
