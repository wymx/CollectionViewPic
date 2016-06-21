//
//  ViewController.m
//  CollectionViewPic
//
//  Created by WEI on 15/8/23.
//  Copyright (c) 2015年 WEI. All rights reserved.
//

#import "ViewController.h"
#import "imageCollectionCell.h"
#import "lineLayout.h"
#define mainW self.view.frame.size.width
#define mainH self.view.frame.size.height

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong) NSMutableArray *images;/**< 存放图片数组模型 */

@end

@implementation ViewController

static NSString *const ID = @"imageCell";

-(NSMutableArray *)images
{
	if (_images ==nil) {
		self.images = [[NSMutableArray alloc]init];
		for (int i=0; i<20; i++) {
			[self.images addObject:[NSString stringWithFormat:@"%d",i+1]];
		}
	}
	return _images;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	CGRect rect = CGRectMake(0,20, mainW,200);
	UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:rect collectionViewLayout:[[lineLayout alloc]init]];
	collectionView.dataSource = self;
	collectionView.delegate = self;

	[collectionView registerNib:[UINib nibWithNibName:@"imageCollectionCell" bundle:nil] forCellWithReuseIdentifier:ID];
	
	[self.view addSubview:collectionView];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return self.images.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	imageCollectionCell	*cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
	cell.image = self.images[indexPath.row];
	
	return cell;
}
- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
