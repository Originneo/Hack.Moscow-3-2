//
//  RegistrationViewController.m
//  AOCashBox
//
//  Created by Камила Валиева on 17/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import "RegistrationViewController.h"
#import "LoginViewController.h"
#import "AOButtonView.h"
#import "AOCoordinateViewController.h"

@interface RegistrationViewController ()<UITextFieldDelegate>
@property(nonatomic,strong) AOTextFieldView *textFieldLogin;
@property(nonatomic,strong)AOCoordinateViewController *coord;
@property(nonatomic,strong)UIButton *loginButton;
@end

@implementation RegistrationViewController

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
    self.textFieldRepeatPassword = [[AOTextFieldView alloc]init];
    [self.view addSubview:self.textFieldRepeatPassword];
    
    self.textFieldPassword.placeholder = @"Пароль";
    self.textFieldLogin.placeholder = @"Логин";
    self.textFieldRepeatPassword.placeholder = @"Повторите пароль";
    self.textFieldPassword.secureTextEntry = YES;
    self.textFieldRepeatPassword.secureTextEntry = YES;
    [self.view endEditing:YES];

    //LoginButton
    
    self.loginButton = [[AOButtonView alloc]initWithTitle:@"Зарегистрироваться"];
    [self.loginButton addTarget:self action:@selector(moveToLogin) forControlEvents:UIControlEventTouchUpInside];
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
    
    [self.textFieldRepeatPassword.topAnchor constraintLessThanOrEqualToAnchor:self.textFieldPassword.bottomAnchor constant:35].active = YES;
    [self.textFieldRepeatPassword.heightAnchor constraintEqualToAnchor:self.textFieldLogin.heightAnchor].active = YES;
    [self.textFieldRepeatPassword.leadingAnchor constraintEqualToAnchor:self.textFieldLogin.leadingAnchor].active = YES;
    [self.textFieldRepeatPassword.trailingAnchor constraintEqualToAnchor:self.textFieldLogin.trailingAnchor].active = YES;
    
    [self.loginButton.topAnchor constraintEqualToSystemSpacingBelowAnchor:self.textFieldRepeatPassword.bottomAnchor multiplier:7].active = YES;
    [self.loginButton.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor constant:self.view.frame.size.width/4].active = YES;
    [self.loginButton.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor constant:-self.view.frame.size.width/4].active = YES;
    [self.loginButton.heightAnchor constraintEqualToAnchor:self.textFieldPassword.heightAnchor].active = YES;
    
}
-(void)moveToLogin
{
    if (self.textFieldPassword.text == self.textFieldRepeatPassword.text && ![self.textFieldLogin.text isEqualToString: @""]) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:self.textFieldLogin.text forKey:@"login"];
        [defaults setObject:self.textFieldPassword.text forKey:@"password"];
        LoginViewController *loginViewController = [LoginViewController new];
        [self.navigationController presentViewController:loginViewController animated:YES completion:nil];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.textFieldPassword resignFirstResponder];
    [self.textFieldLogin resignFirstResponder];
    [self.textFieldRepeatPassword resignFirstResponder];
}

@end
