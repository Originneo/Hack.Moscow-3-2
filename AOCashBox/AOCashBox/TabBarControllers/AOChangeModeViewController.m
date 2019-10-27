//
//  AOChangeModeViewController.m
//  AOCashBox
//
//  Created by Антон Огурцов on 27.10.2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "AOChangeModeViewController.h"
#import "AOCircleView.h"

@interface AOChangeModeViewController ()
@property (nonatomic, strong) UILabel *chooseModeLabel;
@property (nonatomic, strong) UIView *courierView;
@property (nonatomic, strong) UIView *clientView;
@property (nonatomic, strong) UIView *shopView;

@end

@implementation AOChangeModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self createLabel];
    [self createModes];
    [self makeConstraints];
}

- (void)createLabel
{
    self.chooseModeLabel = [UILabel new];
    self.chooseModeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.chooseModeLabel setFont:[UIFont fontWithName:@"AppleSDGothicNeo-Bold" size:23]];
    NSString *string = @"Кто вы сегодня?";
    [self.chooseModeLabel setText:string];
    [self.view addSubview:self.chooseModeLabel];
    
}

- (void)createModes
{
    NSURL  *url = [NSURL URLWithString:@"https://sun9-19.userapi.com/c844617/v844617819/15b0ed/ETg2VPVJOaU.jpg?ava=1"];
    
    NSData *urlData = [NSData dataWithContentsOfURL:url];
    
    UIImage *courierImage = [UIImage imageWithData:urlData];
    
    url = [NSURL URLWithString:@"https://www.ipm.by/webroot/delivery/images/client.png"];
    
    urlData = [NSData dataWithContentsOfURL:url];
    
    UIImage *clientImage = [UIImage imageWithData:urlData];
    
    url = [NSURL URLWithString:@"https://fruitnews.ru/images/2016/logo_LENTA1.jpg"];
    
    urlData = [NSData dataWithContentsOfURL:url];
    
    UIImage *shopImage = [UIImage imageWithData:urlData];
    
    self.courierView = [[AOCircleView alloc]initWithImage:courierImage description:@"Курьер"];
    self.clientView = [[AOCircleView alloc]initWithImage:clientImage description:@"Покупатель"];
    self.shopView = [[AOCircleView alloc]initWithImage:shopImage description:@"Магазин"];
//    self.courierView.backgroundColor = UIColor.redColor;
//    self.clientView.backgroundColor = UIColor.redColor;
//    self.shopView.backgroundColor = UIColor.redColor;

    [self.view addSubview:self.courierView];
    [self.view addSubview:self.clientView];
    [self.view addSubview:self.shopView];


}

- (void) makeConstraints
{
    self.chooseModeLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.courierView.translatesAutoresizingMaskIntoConstraints = NO;

    self.clientView.translatesAutoresizingMaskIntoConstraints = NO;
    self.shopView.translatesAutoresizingMaskIntoConstraints = NO;
    
    [self.chooseModeLabel.centerYAnchor constraintEqualToAnchor:self.view.topAnchor constant:90].active = YES;
    [self.chooseModeLabel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor constant:-25].active = YES;
    [self.chooseModeLabel.heightAnchor constraintEqualToConstant:40].active = YES;
    [self.chooseModeLabel.widthAnchor constraintEqualToConstant:250].active = YES;

    [self.courierView.topAnchor constraintEqualToAnchor:self.chooseModeLabel.bottomAnchor constant:50].active = YES;
    [self.courierView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.courierView.heightAnchor constraintEqualToConstant:154].active = YES;
    [self.courierView.widthAnchor constraintEqualToConstant:154].active = YES;

    [self.clientView.topAnchor constraintEqualToAnchor:self.courierView.bottomAnchor constant:40].active = YES;
    [self.clientView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.clientView.heightAnchor constraintEqualToAnchor:self.courierView.heightAnchor].active = YES;
    [self.clientView.widthAnchor constraintEqualToAnchor:self.courierView.widthAnchor].active = YES;

    [self.shopView.topAnchor constraintEqualToAnchor:self.clientView.bottomAnchor constant:40].active = YES;
    [self.shopView.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.shopView.heightAnchor constraintEqualToAnchor:self.courierView.heightAnchor].active = YES;
    [self.shopView.widthAnchor constraintEqualToAnchor:self.courierView.widthAnchor].active = YES;

}

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBar.hidden = YES;
}

@end
