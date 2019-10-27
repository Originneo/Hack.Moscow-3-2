//
//  AOCustomCollectionView.m
//  AOCashBox
//
//  Created by Камила Валиева on 21/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "AOCustomCollectionView.h"
#import "AOCustomCollectionViewCell.h"


@implementation AOCustomCollectionView


- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 9;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

@end
