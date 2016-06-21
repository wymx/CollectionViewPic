//
//  lineLayout.m
//  CollectionViewPic
//
//  Created by WEI on 15/8/23.
//  Copyright (c) 2015年 WEI. All rights reserved.
//

#import "lineLayout.h"

static const CGFloat cellItemWH = 100;


@implementation lineLayout


-(instancetype)init
{
	if (self = [super init]) {
		
		
		
	}
	
	return self;
}
/**
 *  边界发生改变就重新布局，内部调用layoutAttributesForElementsInRect:方法获得cell的新的属性
 *
 */
-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
	return YES;
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
	NSArray *array =[super layoutAttributesForElementsInRect:rect];
	
	CGFloat centerX = self.collectionView.center.x +self.collectionView.frame.size.width*0.5;/**< 屏幕中点X */
	
	
	for (UICollectionViewLayoutAttributes *attributes in array) {
		CGFloat itemCenterX = attributes.center.x;/**< 每一个item的中点X */
		ABS(centerX-itemCenterX);
		
		attributes.transform3D = CATransform3DMakeScale(1.5, 1.5, 1.0);
		
		
		
	}
	
	return array;
}
/**
 *  准备布局
 */
-(void)prepareLayout
{
	[super prepareLayout];
	self.itemSize = CGSizeMake(cellItemWH, cellItemWH);
	
	self.scrollDirection = UICollectionViewScrollDirectionHorizontal;/**< 设置为水平滚动 */
	self.minimumLineSpacing = 150;
	
	CGFloat LRBounds = (self.collectionView.frame.size.width - cellItemWH)*0.5;
	self.sectionInset = UIEdgeInsetsMake(0, LRBounds, 0, LRBounds);

	
}

@end
