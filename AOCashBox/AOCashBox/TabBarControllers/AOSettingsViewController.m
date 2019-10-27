//
//  AOSettingsViewController.m
//  AOCashBox
//
//  Created by Камила Валиева on 18/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "AOSettingsViewController.h"
#import "AOButtonView.h"
#import "AOCoordinateViewController.h"
#import "AOChangeModeViewController.h"
@interface AOSettingsViewController ()
@property(nonatomic,strong)AOButtonView *buttonLogOut;
@property(nonatomic,strong)AOButtonView *switchButton;

@end

@implementation AOSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.clearColor;
    self.backgroundView = [CAGradientLayer layer];
    self.backgroundView.frame = self.view.bounds;
    self.backgroundView.colors = @[(id)[UIColor colorWithRed:205./255 green:166./255 blue:253./255 alpha:1].CGColor,(id)[UIColor colorWithRed:255./255 green:222./255 blue:166./255 alpha:1].CGColor];
    [self.view.layer insertSublayer:self.backgroundView atIndex:0];
    self.buttonLogOut = [[AOButtonView alloc]initWithTitle:@"Выйти из аккаунта"];
    [self.view addSubview:self.buttonLogOut];
    [self.buttonLogOut addTarget:self action:@selector(AObuttonLogOut) forControlEvents:UIControlEventTouchUpInside];
    self.switchButton = [[AOButtonView alloc]initWithTitle:@"Сменить режим пользователя"];
    [self.view addSubview:self.switchButton];
    [self makeConstraints];
    [self.switchButton addTarget:self action:@selector(AOswitchStates) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark -makeConstraints

-(void)makeConstraints
{
    [self.buttonLogOut.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor].active = YES;
    [self.buttonLogOut.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor].active = YES;
    [self.buttonLogOut.widthAnchor constraintEqualToConstant:250].active = YES;
    [self.buttonLogOut.heightAnchor constraintEqualToConstant:40].active = YES;
    
    [self.switchButton.centerXAnchor constraintEqualToAnchor:self.buttonLogOut.centerXAnchor].active = YES;
    [self.switchButton.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor constant:79].active = YES;
    [self.switchButton.widthAnchor constraintEqualToConstant:350].active = YES;
    [self.switchButton.heightAnchor constraintEqualToConstant:40].active = YES;
}

-(void)AObuttonLogOut /*Выход из приложения*/
{   AOCoordinateViewController *coord = [AOCoordinateViewController new];
    NSUserDefaults *defaults = [NSUserDefaults new];
        [defaults removeObjectForKey:@"loggedin"];
    [self dismissViewControllerAnimated:YES completion:nil];
    [self presentViewController:coord.navcon animated:YES completion:nil];
}

- (void) AOswitchStates
{
    AOChangeModeViewController *changeModeVC = [AOChangeModeViewController new];
    [self.navigationController pushViewController:changeModeVC animated:YES];    
}

@end
