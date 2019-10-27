//
//  CoordinateViewController.m
//  AOCashBox
//
//  Created by Камила Валиева on 18/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "AOCoordinateViewController.h"
#import "AOHistoryViewController.h"
#import "AOSettingsViewController.h"
#import "AutorizationViewController.h"
#import "AOShopsViewController.h"

@interface AOCoordinateViewController () 
@property(nonatomic, strong) UITabBarController *tabBar;
@property(nonatomic,strong)UINavigationController *navcon;
@property(nonatomic,strong)LoginViewController *loginViewController;
@property(nonatomic,strong)NSMutableArray<AOShopModel *> *shopModelArray;
@property (nonatomic, strong)CAGradientLayer *backgroundView;
@end

@implementation AOCoordinateViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        AutorizationViewController *autorizationvc = [AutorizationViewController new];
        
        //Создаем вьюконтроллеры
        AOHistoryViewController *historyViewController = [AOHistoryViewController new];
        AOShopsViewController *shopsViewController = [AOShopsViewController new];
        AOSettingsViewController *settingsViewController = [AOSettingsViewController new];
        _navcon = [[UINavigationController alloc]initWithRootViewController:autorizationvc];
        [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:71/255. green:155/255. blue:112/255. alpha:1]];
        _navcon.navigationBar.barTintColor = [UIColor colorWithRed:247/255. green:235/255. blue:245/255. alpha:1];
        _tabBar = [[UITabBarController alloc]init];
        [_tabBar setViewControllers:(@[shopsViewController,historyViewController,settingsViewController])];
        _tabBar.tabBar.translucent = YES;
        [self viewWillLayoutSubviews];
        shopsViewController.tabBarItem.image = [UIImage imageNamed:@"home"];
        historyViewController.tabBarItem.image = [UIImage imageNamed:@"newspaper"];
        settingsViewController.tabBarItem.image = [UIImage imageNamed:@"settings"];
    }
    return self;
}

-(UINavigationController *)navcon
{
    if (_navcon == nil) {
        _navcon = [[UINavigationController alloc] init];
    }
    return _navcon;
}
-(UITabBarController *)tabBar
{
    if (_tabBar == nil) {
        _tabBar = [[UITabBarController alloc] init];
    }
    return _tabBar;
}
- (void)viewDidLoad {
    [super viewDidLoad];

}

-(UIViewController *)chooseRootController
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    if ([defaults objectForKey:@"loggedin"])
    {
        return self.tabBar;
    }
    else
    {
        return self.navcon;
    }
}
@end
