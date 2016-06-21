//
//  imageCollectionCell.m
//  CollectionViewPic
//
//  Created by WEI on 15/8/23.
//  Copyright (c) 2015年 WEI. All rights reserved.
//

#import "imageCollectionCell.h"

@interface imageCollectionCell()
@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;

@end

@implementation imageCollectionCell

- (void)awakeFromNib {
    // Initialization code
	self.cellImageView.layer.borderColor = [UIColor whiteColor].CGColor;
	self.cellImageView.layer.borderWidth = 3;
	self.cellImageView.layer.cornerRadius = 5;
	self.cellImageView.clipsToBounds = YES;
	
}
-(void)setImage:(NSString *)image
{
	_image = [image copy];
	
	self.cellImageView.image = [UIImage imageNamed:_image];
}

@end
