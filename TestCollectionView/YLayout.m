//
//  YLayout.m
//  TestCollectionView
//
//  Created by 徐继垚 on 15/1/15.
//  Copyright (c) 2015年 徐继垚. All rights reserved.
//


#import "YLayout.h"

@implementation YLayout

- (void)prepareLayout
{
    [super prepareLayout];
}

- (CGSize)collectionViewContentSize
{
    //指定整个contentSize
    CGFloat width = self.weekSize.width * self.weekCount + self.courseSize.width;
    CGFloat height = self.weekSize.height + self.itemSize.height * self.courseCount;
    return CGSizeMake(width, height);
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    //返回cell属性数组
    NSMutableArray *array = [NSMutableArray array];
    for (int i=0; i<self.totalCount; i++)
    {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:indexPath];
        
        [array addObject:attributes];
    }
    return array;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    if (indexPath.row < self.weekCount) {
        //计算星期cell的位置
        CGFloat orginx = self.courseSize.width + indexPath.row * self.weekSize.width;
        CGFloat orginy = 0;
        attributes.frame = CGRectMake(orginx, orginy, self.weekSize.width, self.weekSize.height);
    }else if (indexPath.row >= self.weekCount && indexPath.row < self.weekCourseCount) {
        NSInteger index = indexPath.row - self.weekCount;
        //计算左边竖排第几节课的cell位置
        CGFloat topHeight = self.itemSize.height + self.weekSize.height;
        
        if (index == 0) {
            //第一个cell高度高一点
            attributes.frame =  CGRectMake(0, 0, self.courseSize.width, topHeight);
        }else {
            attributes.frame = CGRectMake(0, topHeight + (index - 1) * self.courseSize.height, self.courseSize.width, self.courseSize.height);
        }
    }else {
        //计算课程cell的位置
        CGFloat orginx = self.courseSize.width;
        CGFloat orginy = self.weekSize.height;
        NSInteger indexx = (indexPath.row - self.weekCourseCount)%self.weekCount;
        NSInteger indexy = (indexPath.row - self.weekCourseCount)/self.weekCount;
        
        attributes.frame = CGRectMake(orginx + indexx * self.itemSize.width, orginy + indexy * self.itemSize.height, self.itemSize.width, self.itemSize.height);
    }
    return attributes;
}
@end
