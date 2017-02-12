//
//  ViewController.h
//  Autism_Phonology
//
//  Created by Mindpace on 11/11/14.
//  Copyright (c) 2014 Mindpace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "QuestionsPageVC.h"
#import "OptionsPageVC.h"
#import "UIViewController+MJPopupViewController.h"

//@class AppDelegate;
@interface FirstViewController : UIViewController<UIAlertViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *HomeView;

@property(nonatomic,strong) AppDelegate *appDel;
@property(nonatomic,strong)QuestionsPageVC *questionVC;
@property(nonatomic,strong)NSString *selectXib;
@property (nonatomic,retain) MBProgressHUD *hud;
@property (assign) NSUserDefaults *mydefaults;

@property(nonatomic,strong)OptionsPageVC *optionPage;

@property(nonatomic,retain) UIAlertView *alert;
//@property(nonatomic,assign) BOOL isiphone;

@property(nonatomic,retain) UIAlertView *calert;


- (IBAction)MenuBtnTapped:(id)sender;

- (IBAction)OptionsBtnTapped:(id)sender;



@end
