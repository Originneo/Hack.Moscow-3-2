//
//  LoginViewController.m
//  AOCashBox
//
//  Created by Камила Валиева on 29/06/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "LoginViewController.h"
#import "AOTextFieldView.h"
#import "AOButtonView.h"
#import "AOCoordinateViewController.h"
#import "AOShopModel.h"
#import "NetworkService.h"
#import "AOChangeModeViewController.h"

@interface LoginViewController () <UITextFieldDelegate>
@property(nonatomic,strong) AOTextFieldView *textFieldLogin;
@property(nonatomic,strong) AOTextFieldView *textFieldPassword;
@property(nonatomic,strong)AOCoordinateViewController *coord;
@property(nonatomic,strong)UIButton *loginButton;
@property (nonatomic,strong)NSMutableArray<AOShopModel *> *shopModelArray;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:247/255. green:235/255. blue:245/255. alpha:1];
    [self setupUI];
}

-(void)setupUI
{
    self.textFieldLogin = [[AOTextFieldView alloc]init];
    [self.view addSubview:self.textFieldLogin];
    self.textFieldPassword = [[AOTextFieldView alloc]init];
    [self.view addSubview:self.textFieldPassword];

    self.textFieldPassword.placeholder = @"Пароль";
    self.textFieldLogin.placeholder = @"Логин";
    self.textFieldPassword.secureTextEntry = YES;
    //LoginButton
    
    
    self.loginButton = [[AOButtonView alloc]initWithTitle:@"Войти"];
    [self.loginButton addTarget:self action:@selector(loginInHomePage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.loginButton];
    [self addConstraints];
}


#pragma mark -addConstraints

-(void)addConstraints
{
    
    [self.textFieldLogin.centerYAnchor constraintLessThanOrEqualToAnchor:self.view.centerYAnchor constant:-50].active = YES;
    [self.textFieldLogin.heightAnchor constraintEqualToConstant:35].active = YES;
    [self.textFieldLogin.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant: 50 ].active = YES;
    [self.textFieldLogin.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-50].active = YES;
    
    [self.textFieldPassword.topAnchor constraintLessThanOrEqualToAnchor:self.textFieldLogin.bottomAnchor constant:35].active = YES;
    [self.textFieldPassword.heightAnchor constraintEqualToAnchor:self.textFieldLogin.heightAnchor].active = YES;
    [self.textFieldPassword.leadingAnchor constraintEqualToAnchor:self.textFieldLogin.leadingAnchor].active = YES;
    [self.textFieldPassword.trailingAnchor constraintEqualToAnchor:self.textFieldLogin.trailingAnchor].active = YES;
    [self.loginButton.topAnchor constraintEqualToSystemSpacingBelowAnchor:self.textFieldPassword.bottomAnchor multiplier:7].active = YES;
    [self.loginButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:self.view.frame.size.width/3].active = YES;
       [self.loginButton.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-self.view.frame.size.width/3].active = YES;
    [self.loginButton.heightAnchor constraintEqualToAnchor:self.textFieldPassword.heightAnchor].active = YES;
    
}

#pragma mark -ButtonAction

-(void)loginInHomePage
{
    self.coord = [AOCoordinateViewController new];
    AOChangeModeViewController *changeVC = [AOChangeModeViewController new];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (self.textFieldLogin.text == [defaults objectForKey:@"login"] && self.textFieldPassword.text == [defaults objectForKey:@"password"]) {
        UIAlertController *alert = [UIAlertController
                                     alertControllerWithTitle:@"Correct Password"
                                     message:@"Correct Password!"
                                     preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
     
            
            [alert dismissViewControllerAnimated:YES completion:^{
            [defaults setObject:@(1) forKey:@"loggedin"];
                dispatch_async(dispatch_get_main_queue(), ^{
                
                
                [self.navigationController pushViewController:changeVC animated:YES];
                    });
            }];

    }
                       
    else
    {
        UIAlertController *alert = [UIAlertController
                                     alertControllerWithTitle:@"Bad Password"
                                     message:@"Bad Password!"
                                     preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelButton = [UIAlertAction
                                       actionWithTitle:@"Cancel"
                                       style:UIAlertActionStyleCancel
                                       handler:^(UIAlertAction * action) {
                                           self.textFieldLogin.text = @"";
                                           self.textFieldPassword.text = @"";
                                       }];
        [self presentViewController:alert animated:YES completion:nil];
        dispatch_async(dispatch_get_main_queue(), ^{
            [alert addAction:cancelButton];
        });
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    self.textFieldLogin.text = @"";
    self.textFieldPassword.text = @"";
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.textFieldPassword resignFirstResponder];
    [self.textFieldLogin resignFirstResponder];
    [self.view becomeFirstResponder];
}

@end
