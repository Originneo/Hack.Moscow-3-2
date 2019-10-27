//
//  AOCustomHomeTableViewCell.m
//  AOCashBox
//
//  Created by Камила Валиева on 20/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "AOCustomHomeTableViewCell.h"
#import "AOCustomCollectionView.h"
#import "AOCustomCollectionViewCell.h"

@implementation AOCustomHomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 10, 10);
        layout.itemSize = CGSizeMake(150, 150);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[AOCustomCollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        [self.contentView addSubview:_collectionView];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.collectionView.frame = self.contentView.bounds;
}

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath
{
    self.collectionView.dataSource = dataSourceDelegate;
    self.collectionView.delegate = dataSourceDelegate;
//    self.collectionView.indexPath = indexPath;
    [self.collectionView reloadData];
}

@end
 
