//
//  AOShopsViewController.h
//  AOCashBox
//
//  Created by Антон Огурцов on 26.10.2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkServiceProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface AOShopsViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, NetworkServiceOutputProtocol>

@property (nonatomic,strong)NSMutableArray<AOShopModel *> *shopModelArray;


@end

NS_ASSUME_NONNULL_END
