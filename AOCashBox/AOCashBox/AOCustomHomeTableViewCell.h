//
//  AOCustomHomeTableViewCell.h
//  AOCashBox
//
//  Created by Камила Валиева on 20/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AOCustomCollectionView.h"
NS_ASSUME_NONNULL_BEGIN

@interface AOCustomHomeTableViewCell : UITableViewCell

@property (nonatomic, strong)AOCustomCollectionView *collectionView;

-(void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
