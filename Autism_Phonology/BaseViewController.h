//
//  BaseViewController.h
//  AutismHelp
//
//  Created by Satish Kumar on 28/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "Reachability.h"
#import "MBProgressHUD.h"
#import "MPKidsiHelpInAppPurchaseHelper.h"

#import <QuartzCore/QuartzCore.h>



@interface BaseViewController : UIViewController< UIAlertViewDelegate >{
   // MPAppDelegate* appDelegate;
    BOOL isiphone;
}
@property (nonatomic,retain) MBProgressHUD *hud;
@property(assign) NSUserDefaults *mydefaults;
@property(nonatomic,retain) UIAlertView *alert;
@property(nonatomic,retain) UIAlertView *calert;

@property(nonatomic,assign) AppDelegate* appDelegate;

- (void)buyButtonTapped;
-(void)setting;
-(void)settingres;
- (void)dismissHUD:(id)arg;
- (void)timeout:(id)arg;


@end
