//
//  YLayout.h
//  TestCollectionView
//
//  Created by 徐继垚 on 15/1/15.
//  Copyright (c) 2015年 徐继垚. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface YLayout : UICollectionViewLayout

@property (nonatomic, assign) CGSize weekSize;

@property (nonatomic, assign) CGSize courseSize;

@property (nonatomic, assign) CGSize itemSize;

@property (nonatomic, assign) NSInteger weekCount;
@property (nonatomic, assign) NSInteger courseCount;
@property (nonatomic, assign) NSInteger totalCount;
@property (nonatomic, assign) NSInteger weekCourseCount;

@end
