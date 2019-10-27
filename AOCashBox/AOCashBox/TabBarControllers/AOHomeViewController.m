
//
//  AOHomeViewController.m
//
//
//  Created by Камила Валиева on 18/07/2019.
//

#import "AOHomeViewController.h"
#import "AOCustomHomeTableViewCell.h"
#import "AODetailsViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AOHistoryViewController.h"
#import "AOCustomCollectionViewCell.h"
#import "NetworkService.h"

static NSString * const AOCustomTableViewCellIdentifier = @"AOHomeTableViewCellIdentifier";
@interface AOHomeViewController ()
@property(nonatomic,copy)NSArray *arrayOfShops;
@property (nonatomic, strong) NSArray *colorArray;
@property(nonatomic,strong)NSArray *sectionNames;


@end

@implementation AOHomeViewController
-(void)loadView
{
    [super loadView];
    [self downloadHomeViewControllerData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.arrayOfShops = @[@"Супермаркет",@"Детский магазин",@"Магазин косметики",@"Алкогольные магазины"];
    
    
    
    
}
-(void)downloadHomeViewControllerData //Подписываемся на делегат и вызываем метод
{
    NetworkService *networkService = [NetworkService new];
    networkService.output = self;
    [networkService takeAllDataShops];
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.arrayOfShops.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    AOCustomHomeTableViewCell *cell = (AOCustomHomeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:AOCustomTableViewCellIdentifier];

    if (!cell)
    {
        cell = [[AOCustomHomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:AOCustomTableViewCellIdentifier];
    }

    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(AOCustomHomeTableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setCollectionViewDataSourceDelegate:self indexPath:indexPath];
}

#pragma mark - UITableViewDelegate Methods

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}

#pragma mark - UICollectionViewDataSource Methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 7;
}

//-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
//{
////    AOCustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CollectionViewCellIdentifier forIndexPath:indexPath];
//

//
//    if (indexPath.item < self.shopModelArray.count) //Заполняем ячейки Collection View и прописываем активацию спинера при загрузке фото
//    {
//        AOShopModel *shop = self.shopModelArray[indexPath.item];
//        UIImage *image = [UIImage imageWithData:shop.shopImage];
//        [UIView transitionWithView:cell.imageView
//                          duration:0.1f
//                           options:UIViewAnimationOptionTransitionCrossDissolve
//                        animations:^{
//                            [cell.imageView setImage:image];
//                        } completion:nil];
//
//        [cell.spinner stopAnimating];
//    } else {
//        [cell.spinner startAnimating];
//    }
//
//    return cell;
//}
//
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    UIView *headerView = [[UIView alloc]init];
//    headerView.backgroundColor =  UIColor.whiteColor;
//    headerView.tintColor = UIColor.blackColor;
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, tableView.frame.size.width, 18)];
//    [label setFont:[UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:23]];
//    NSString *string = self.arrayOfShops[section];
//    [label setText:string];
//    [headerView addSubview:label];
//    return headerView;
//}
//
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath //Обрабатываем переход по картинке
//{
//    AOCustomCollectionViewCell *cell = (AOCustomCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    if (cell.imageView.image != nil)
//    {
//        AODetailsViewController *detailsVC = [AODetailsViewController new];
//        detailsVC.imageView = [UIImageView new];
//        detailsVC.nameOfImage = [UILabel new];
//        AOShopModel *shop = self.shopModelArray[indexPath.item];
//        detailsVC.imageView.image = [UIImage imageWithData:shop.shopImage];
//        detailsVC.nameOfImage.text = self.shopModelArray[indexPath.item].shopName;
//        [self.navigationController pushViewController:detailsVC animated:YES];
//    }
//}
//-(void)loadingIsDoneWithDataRecieved:(AOShopModel *)dataRecieved //Загружаем данные из полученные данных
//{
//    if (!self.shopModelArray) {
//        self.shopModelArray = [NSMutableArray new];
//    }
//    if (dataRecieved)
//    {
//        [self.shopModelArray addObject:dataRecieved];
//    }
//    NSUInteger shop = self.shopModelArray.count - 1;
//    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:shop inSection:0];
//    [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
//    if (self.shopModelArray.count == 7)
//    {
//        NSMutableArray *mutableSectionNames  = [NSMutableArray new];
//        for (int i = 0 ; i<7; i++) {
//            [mutableSectionNames addObject:self.shopModelArray[i].typeOfShop];
//        }
//        self.sectionNames = [mutableSectionNames valueForKeyPath:@"@distinctUnionOfObjects.self"];
//        
//    }
//}

@end
