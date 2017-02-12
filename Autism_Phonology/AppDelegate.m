//
//  AppDelegate.m
//  Autism_Phonology
//
//  Created by Mindpace on 11/11/14.
//  Copyright (c) 2014 Mindpace. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"

#define iPhone6 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && MAX([UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width) == 667)
#define iPhone6Plus ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && MAX([UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width) == 736)



@implementation AppDelegate

@synthesize navigationController,isiPhone,isIphone5,isIphone6,isIphone6plus,VC,i,savedSettings;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
   // baseObj=[[BaseClass alloc]init];
    
    
    UIScreen *mainScreen = [UIScreen mainScreen];
  /*  NSLog(@"Screen bounds: %@, Screen resolution: %@, scale: %f, nativeScale: %f",
          NSStringFromCGRect(mainScreen.bounds), mainScreen.coordinateSpace, mainScreen.scale, mainScreen.nativeScale);*/
    
    CGRect f=[[UIScreen mainScreen] bounds];
    
    
    if(f.size.width == 568.0f)
    {
        self.isIphone5=1;
    }
    else if(f.size.width == 667)
    {
        self.isIphone6=1;
    }
    else if( f.size.width== 736)
    {
       self.isIphone6plus=1;
    }
    else
    {
        isIphone5=0;
        isIphone6=0;
        isIphone6plus=0;
    }
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        
        self.isiPhone=YES;
        
        //AHViewController_ip5
        if(self.isIphone5==1)
        {
            self.VC = [[FirstViewController alloc] initWithNibName:@"phonology_iphone5_VC" bundle:nil];
            i=1;
        }
        else if (self.isIphone6==1)
        {
            self.VC = [[FirstViewController alloc] initWithNibName:@"phonology_iphone6_VC" bundle:nil];
            i=4;
        }
        else if (self.isIphone6plus==1)
        {
            self.VC = [[FirstViewController alloc] initWithNibName:@"phonology_iphone6plus_VC" bundle:nil];
            i=5;
        }
        
        else
        {
            
            self.VC = [[FirstViewController alloc] initWithNibName:@"phonology_iphone_VC" bundle:nil];
            i=2;
        }
    }
    else
    {
        self.isiPhone=NO;
        self.VC =[[FirstViewController alloc] initWithNibName:@"phonology_ipad_VC" bundle:nil];
        i=3;
    }
    
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:self.VC];
    
    [navigationController setNavigationBarHidden:YES];
    // self.window.rootViewController = self.aNav;
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        if(self.isIphone5)
        {
            SplashVC *svc=[[SplashVC alloc] initWithNibName:@"splash_iphone5" bundle:nil];
            self.window.rootViewController =svc;
        }
        else if (self.isIphone6)
        {
            SplashVC *svc=[[SplashVC alloc] initWithNibName:@"splash_iphone6" bundle:nil];
            self.window.rootViewController =svc;
        }
        
        else if (self.isIphone6plus)
        {
            SplashVC *svc=[[SplashVC alloc] initWithNibName:@"splash_iphone6plus" bundle:nil];
            self.window.rootViewController =svc;
        }

        
        else
        {
            SplashVC *svc=[[SplashVC alloc] initWithNibName:@"splash_iphone" bundle:nil];
            self.window.rootViewController =svc;
        }
    }
    else
    {
        SplashVC *svc=[[SplashVC alloc] initWithNibName:@"splash_ipad" bundle:nil];
        self.window.rootViewController =svc;
    }
    //////////
    [self.window makeKeyAndVisible];
    
    
    savedSettings=[NSUserDefaults standardUserDefaults];
    
    if(![self.savedSettings objectForKey:ProIden])
    {
        [[SKPaymentQueue defaultQueue] addTransactionObserver:[MPKidsiHelpInAppPurchaseHelper sharedHelper]];
    }

    
    if(![self.savedSettings objectForKey:@"ISFIRSTTIME"])
    {
        [self.savedSettings setObject:@"on" forKey:@"random"];
        [self.savedSettings setObject:@"1" forKey:@"ISFIRSTTIME"];
        [self.savedSettings synchronize];
        
    }
    if(![self.savedSettings objectForKey:@"ISFIRSTTIME1"])
    {
        
        [self.savedSettings setObject:@"on" forKey:@"audio"];
        [self.savedSettings setObject:@"1" forKey:@"ISFIRSTTIME1"];
        [self.savedSettings synchronize];
        
    }
    
    
    //  NSUserDefaults *AudioType=[NSUserDefaults standardUserDefaults];
    
    if(![self.savedSettings objectForKey:@"ISFIRSTTIME2"])
    {
        [self.savedSettings setObject:@"f" forKey:@"audio type"];
        [self.savedSettings setObject:@"1" forKey:@"ISFIRSTTIME2"];
        [self.savedSettings synchronize];
    }
    if(![self.savedSettings objectForKey:@"ISFIRSTTIME4"])
    {
        [self.savedSettings setObject:@"on" forKey:@"question text"];
        [self.savedSettings setObject:@"1" forKey:@"ISFIRSTTIME4"];
        [self.savedSettings synchronize];
    }
    
    if(![self.savedSettings objectForKey:@"ISFIRSTTIME5"])
    {
        [self.savedSettings setObject:@"off" forKey:@"answer text"];
        [self.savedSettings setObject:@"1" forKey:@"ISFIRSTTIME5"];
        [self.savedSettings synchronize];
    }
   
    if(![self.savedSettings objectForKey:@"ISFIRSTTIME6"])
    {
        [self.savedSettings setObject:@"4" forKey:@"answer option"];
        [self.savedSettings setObject:@"1" forKey:@"ISFIRSTTIME6"];
        [self.savedSettings synchronize];
    }

    if(![self.savedSettings objectForKey:@"ISFIRSTTIME7"])
    {
        [self.savedSettings setObject:@"on" forKey:@"question image"];
        [self.savedSettings setObject:@"1" forKey:@"ISFIRSTTIME7"];
        [self.savedSettings synchronize];
    }
    
    return YES;
}

-(void)addRootVC
{
    
    self.window.rootViewController = self.navigationController;
    
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
