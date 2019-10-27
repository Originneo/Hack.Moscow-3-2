//
//  unit_authtorizationTests.m
//  AOCashBoxTests
//
//  Created by Камила Валиева on 30/07/2019.
//  Copyright © 2019 Камила Валиева. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "../AOCashBox/StartedControllers/LoginViewController.h"
#import "../AOCashBox/StartedControllers/AutorizationViewController.h"
#import "../AOCashBox/StartedControllers/RegistrationViewController.h"
@interface unit_authtorizationTests : XCTestCase
@property(nonatomic, strong)LoginViewController* loginVC;
@property(nonatomic, strong)AutorizationViewController* autoVC;
@property(nonatomic, strong)RegistrationViewController* registerVC;


@end

@implementation unit_authtorizationTests

- (void)setUp
{
    [super setUp];
    self.loginVC = [LoginViewController new];
    self.autoVC = [AutorizationViewController new];
    self.registerVC = [RegistrationViewController new];
}

- (void)tearDown
{
    self.loginVC = nil;
    self.autoVC = nil;
    self.registerVC = nil;
    [super tearDown];
}

//- (void)checkButtonRegisterButton {
//  
//    XCTAssertEqualObjects(self.registerVC.textFieldPassword.text, self.registerVC.textFieldRepeatPassword.text);
//}
- (void)testAsync {
    /*
     1. Создаем ожидание с описанием (будет показано в случае провала теста)
     2. Выполняем необходимые действия
     3. Устанавливаем ожидание
     4. Вызываем fulfill метод у объекта класса XCTestExpectation
     Если сперва вызвать fulfill и потом установить ожидание - тест будет считаться пройденным
     */
    XCTestExpectation *expectation = [self expectationWithDescription:@"block not call"];
    NSTimeInterval timeout = 3.0f;
    [expectation performSelector:@selector(fulfill)
                      withObject:nil
                      afterDelay:0.3f];
    [self waitForExpectationsWithTimeout:timeout
                                 handler:nil];
}

- (void)testLoginButton
{
    //Arrange
    NSString* testingString = nil;
    NSString* resultString = self.autoVC.loginButton.titleLabel.text;
    XCTAssertEqualObjects(testingString, resultString);
   
}


@end
