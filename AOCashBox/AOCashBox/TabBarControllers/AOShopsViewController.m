//
//  AOShopsViewController.m
//  AOCashBox
//
//  Created by Антон Огурцов on 26.10.2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "AOShopsViewController.h"
#import "AOCustomCollectionViewCell.h"
#import "NetworkService.h"

static NSString* const AOCustomCollectionViewCellIdentifier = @"AOHomeTableViewCellIdentifier";
@interface AOShopsViewController ()

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, copy)NSArray *arrayOfShops;
@property (nonatomic, strong) UILabel *collectionViewLabel;
@property (nonatomic, strong) CAGradientLayer *backgroundView;

@end

@implementation AOShopsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self downloadHomeViewControllerData];
    self.view.backgroundColor = UIColor.clearColor;
    self.backgroundView = [CAGradientLayer layer];
    self.backgroundView.frame = self.view.bounds;
    self.backgroundView.colors = @[(id)[UIColor colorWithRed:205./255 green:166./255 blue:253./255 alpha:1].CGColor,(id)[UIColor colorWithRed:255./255 green:222./255 blue:166./255 alpha:1].CGColor];
    [self.view.layer insertSublayer:self.backgroundView atIndex:0];
    [self createCollectionView];
    [self createLabel];
}

-(void)downloadHomeViewControllerData //Подписываемся на делегат и вызываем метод
{
    NetworkService *networkService = [NetworkService new];
    networkService.output = self;
    [networkService takeAllDataShops];
}

- (void)createCollectionView
{
    UICollectionViewFlowLayout *collectionViewLayout = [UICollectionViewFlowLayout new];
    collectionViewLayout.sectionInset = UIEdgeInsetsMake(5, 5, 10, 10);
    collectionViewLayout.itemSize = CGSizeMake(150, 150);
    collectionViewLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 160, self.view.bounds.size.width,160) collectionViewLayout:collectionViewLayout];
    self.collectionView.backgroundColor = UIColor.clearColor;
    [self.collectionView registerClass:[AOCustomCollectionViewCell class] forCellWithReuseIdentifier:AOCustomCollectionViewCellIdentifier];
    [self.collectionView setShowsHorizontalScrollIndicator:NO];
    

    
    [self.view addSubview:self.collectionView];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

- (void)createLabel
{
    self.collectionViewLabel = [UILabel new];
    self.collectionViewLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.collectionViewLabel setFont:[UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:23]];
    NSString *string = @"Куда вы поедете?";
    [self.collectionViewLabel setText:string];
    [self.view addSubview:self.collectionViewLabel];
    [self makeConstraints];
}


#pragma mark -Constraints

- (void)makeConstraints
{
    [self.collectionViewLabel.bottomAnchor constraintEqualToAnchor:self.collectionView.topAnchor].active = YES;
    [self.collectionViewLabel.leftAnchor constraintEqualToAnchor:self.view.leftAnchor constant:15].active = YES;
    [self.collectionViewLabel.rightAnchor constraintEqualToAnchor:self.view.rightAnchor].active = YES;
    [self.collectionViewLabel.heightAnchor  constraintEqualToConstant:50].active = YES;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    AOCustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:AOCustomCollectionViewCellIdentifier forIndexPath:indexPath];
    if (indexPath.item < self.shopModelArray.count) //Заполняем ячейки Collection View и прописываем активацию спинера при загрузке фото
            {
                AOShopModel *shop = self.shopModelArray[indexPath.item];
                UIImage *image = [UIImage imageWithData:shop.shopImage];
                [UIView transitionWithView:cell.imageView
                                  duration:0.1f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    [cell.imageView setImage:image];
                                    [cell.title setText:shop.shopName];
                                    
                                } completion:nil];
        
                [cell.spinner stopAnimating];
            } else {
                [cell.spinner startAnimating];
            }
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 7;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(void)loadingIsDoneWithDataRecieved:(AOShopModel *)dataRecieved //Загружаем данные из полученные данных
{
    if (!self.shopModelArray) {
        self.shopModelArray = [NSMutableArray new];
    }
    if (dataRecieved)
    {
        [self.shopModelArray addObject:dataRecieved];
    }
    NSUInteger shop = self.shopModelArray.count - 1;
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:shop inSection:0];
    [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
}

@end
