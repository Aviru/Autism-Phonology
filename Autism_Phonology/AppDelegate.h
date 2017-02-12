//
//  AppDelegate.h
//  Autism_Phonology
//
//  Created by Mindpace on 11/11/14.
//  Copyright (c) 2014 Mindpace. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "FirstViewController.h"
#import "SplashVC.h"
//#import "BaseClass.h"

@class FirstViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    //AppDelegate *appDel;
}
@property (strong, nonatomic) UIWindow *window;
@property (strong,nonatomic) FirstViewController *VC;
@property(strong,nonatomic) UINavigationController *navigationController;
@property(nonatomic,strong)NSUserDefaults *savedSettings;
//@property(nonatomic,strong)AppDelegate *appDel;
@property(assign) NSUInteger score;
@property(assign) int mButtonTag;
@property (assign) int isIphone5;
@property (assign) int isIphone6;
@property (assign) int isIphone6plus;
@property(assign) BOOL isiPhone;
@property (assign) int i;


-(void)addRootVC;


@end
