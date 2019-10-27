//
//  AOHomeViewController.h
//  
//
//  Created by Камила Валиева on 18/07/2019.
//

#import <UIKit/UIKit.h>
#import "AOShopModel.h"
#import "NetworkServiceProtocol.h"
#import "AOCustomCollectionView.h"
NS_ASSUME_NONNULL_BEGIN

@interface AOHomeViewController : UITableViewController<UICollectionViewDelegate,UICollectionViewDataSource,NetworkServiceOutputProtocol>

@property(nonatomic,strong)AOCustomCollectionView *collectionView;
@property (nonatomic,strong)NSMutableArray<AOShopModel *> *shopModelArray;
@end

NS_ASSUME_NONNULL_END
