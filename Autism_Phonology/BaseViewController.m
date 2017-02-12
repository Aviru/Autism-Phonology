//
//  BaseViewController.m
//  AutismHelp
//
//  Created by Satish Kumar on 28/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController
@synthesize appDelegate,calert,alert,mydefaults;
@synthesize hud = _hud;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}



- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if([alertView isEqual:self.alert])
    {
        if(buttonIndex==1)
        {
            // if([alertView isEqual:self.calert])
            [self buyButtonTapped];
            /*else
             [self.calert show];*/
        }
        if(buttonIndex==0)
        {
            [self settingres];
            
        }
    }
}

- (void)dismissHUD:(id)arg {
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    self.hud = nil;
}


#pragma mark - Timer
- (void)timeout:(id)arg
{
    _hud.labelText = @"Timeout!";
    _hud.detailsLabelText = @"Please try again later.";
    _hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]] ;
	_hud.mode = MBProgressHUDModeCustomView;
    [self performSelector:@selector(dismissHUD:) withObject:nil afterDelay:3.0];
}



- (void)productsLoaded:(NSNotification *)notification
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
}

- (void)productRestoredFailed:(NSNotification *)notification
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Phonological Awareness"
                                                     message:@"Restore Failed!"
                                                    delegate:nil
                                           cancelButtonTitle:@"Ok"
                                           otherButtonTitles: nil] ;
    [alert1 show];
    
}

- (void)productPurchaseFailed:(NSNotification *)notification {
    
    
    NSLog(@"Purchase Failed");
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    SKPaymentTransaction * transaction = (SKPaymentTransaction *) notification.object;
    if (transaction.error.code != SKErrorPaymentCancelled) {
        UIAlertView *alertq = [[UIAlertView alloc] initWithTitle:@"Error!"
                                                         message:transaction.error.localizedDescription
                                                        delegate:nil
                                               cancelButtonTitle:nil
                                               otherButtonTitles:@"OK", nil] ;
        
        [alertq show];
        
    }
}




#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.appDelegate = (AppDelegate* )[[UIApplication sharedApplication] delegate];
    
        [super viewDidLoad];
        
        self.mydefaults=[NSUserDefaults standardUserDefaults];
        // Do any additional setup after loading the view, typically from a nib.
        
        if([[UIDevice currentDevice] userInterfaceIdiom]!=UIUserInterfaceIdiomPhone)
        {
            
    //        self.maindbuttonsima=[UIImage imageNamed:@"menu_page_ipad_blank50.png"];
      //      self.mainhbuttonsima=[UIImage imageNamed:@"menupage_ipad.png"];
           isiphone=0;
        }
        else
        {
            
            /*  if([(AppDelegate*)[[UIApplication sharedApplication] delegate] isIphone5])
             {
             self.maindbuttonsima=[UIImage imageNamed:@"iphone5_menu_page_opacity50_plain.png"];
             self.mainhbuttonsima=[UIImage imageNamed:@"iphone5_menu_page_plain.png"];
             }
             else
             {*/
          //  self.maindbuttonsima=[UIImage imageNamed:@"menu_page_iphone_blank50.png"];
          //  self.mainhbuttonsima=[UIImage imageNamed:@"menupage_iphone.png"];
            //   }
            isiphone=1;
        }
        
        
        
       /* if([_mydefaults objectForKey:ProIden])
            self.mainbuttonsima.image=_mainhbuttonsima;
        else
            self.mainbuttonsima.image=_maindbuttonsima;*/
        
        
    if (SYSTEM_VERSION_LESS_THAN(@"7.0"))
    {

        
        UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"PHONOLOGICAL AWARENESS"
                                                         message:@"\n\n\n"
                                                        delegate:self
                                               cancelButtonTitle:@"Restore"
                                               otherButtonTitles:@"Yes",@"No", nil] ;
        
         UILabel *text;
         if(isiphone)
         {
             text= [[UILabel alloc]
                     initWithFrame:CGRectMake(12, 30, 260.0, 50.0)]
                    ;
             text.font=[UIFont systemFontOfSize:12];
         
         }
         else
         {
             text= [[UILabel alloc]
                     initWithFrame:CGRectMake(12,45,260, 70)]
                    ;
             text.font=[UIFont systemFontOfSize:16];
         }
         text.textAlignment=UITextAlignmentCenter;
         text.textColor=[UIColor whiteColor];
         
         [text setBackgroundColor:[UIColor clearColor]];
         text.numberOfLines=4;
         
         
         
         
         text.text=@"Complete all sets of Rhyming Words for $2.99.";
         
         
        [alert1 addSubview:text];
        self.alert=alert1;
      
    }
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
    {
        UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"PHONOLOGICAL AWARENESS"
                                                         message:@"Complete all sets of Rhyming Words for $2.99."
                                                        delegate:self
                                               cancelButtonTitle:@"Restore"
                                               otherButtonTitles:@"Yes",@"No", nil];
        
        self.alert=alert1;
        
        
    }
        
    UIAlertView *calert1 = [[UIAlertView alloc] initWithTitle:@"Phonological Awareness"
                                                          message:@"Confirm Purchase?"
                                                         delegate:self
                                                cancelButtonTitle:@"NO" 
                                                otherButtonTitles:@"YES", nil] ;
        
        
        
    self.calert=calert1;
    
        
        
}


- (void)buyButtonTapped
{
    
    // UIButton *buyButton = (UIButton *)sender;
    if([[MPKidsiHelpInAppPurchaseHelper sharedHelper].products count]>0)
    {
        SKProduct *product = [[MPKidsiHelpInAppPurchaseHelper sharedHelper].products objectAtIndex:0];
        
        NSLog(@"Buying %@...", product.productIdentifier);
        [[MPKidsiHelpInAppPurchaseHelper sharedHelper] buyProductIdentifier:product.productIdentifier];
        
        self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        _hud.labelText = @"Buying...";
        [self performSelector:@selector(timeout:) withObject:nil afterDelay:60*5];
    }
    else
    {
        [self setting];
    }
}


-(void)setting
{
    
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus netStatus = [reach currentReachabilityStatus];
    if (netStatus == NotReachable)
    {
        NSLog(@"No internet connection!");
    }
    else
    {
        if ([MPKidsiHelpInAppPurchaseHelper sharedHelper].products == nil)
        {
            [[MPKidsiHelpInAppPurchaseHelper sharedHelper] requestProducts];
            self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            _hud.labelText = @"Loading...";
            [self performSelector:@selector(timeout:) withObject:nil afterDelay:30.0];
        }
    }
    
    if([[MPKidsiHelpInAppPurchaseHelper sharedHelper].products count]>0)
    {
        [self buyButtonTapped];
    }
    
    
    
    
}
-(void)settingres
{
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    NetworkStatus netStatus = [reach currentReachabilityStatus];
    if (netStatus == NotReachable)
    {
        NSLog(@"No internet connection!");
    }
    else
    {
        if ([MPKidsiHelpInAppPurchaseHelper sharedHelper].products == nil)
        {
            [[MPKidsiHelpInAppPurchaseHelper sharedHelper] requestProducts];
            self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            _hud.labelText = @"Loading...";
            [self performSelector:@selector(timeout:) withObject:nil afterDelay:30.0];
        }
    }
    
    
    if (netStatus == NotReachable)
    {
        NSLog(@"No internet connection!");
    }
    else
    {
        
        
        if([[MPKidsiHelpInAppPurchaseHelper sharedHelper].products count]>0)
        {
            [[MPKidsiHelpInAppPurchaseHelper sharedHelper] restoreProductIdentifier];
            self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
            _hud.labelText = @"Restoring...";
            [self performSelector:@selector(timeout:) withObject:nil afterDelay:120.0];
        }
    }
    
    
    
}

-(void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(productsLoaded:) name:kProductsLoadedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(productPurchased:) name:kProductPurchasedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(productPurchaseFailed:) name:kProductPurchaseFailedNotification object: nil];
     [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(productRestoredFailed:) name:kProductRestoreFailedNotification object: nil];
    
    NSUserDefaults *aDef=[NSUserDefaults standardUserDefaults];
    
    if(![aDef objectForKey:ProIden])
    {
        Reachability *reach = [Reachability reachabilityForInternetConnection];
        NetworkStatus netStatus = [reach currentReachabilityStatus];
        if (netStatus == NotReachable)
        {
            NSLog(@"No internet connection!");
        }
        else
        {
            if ([MPKidsiHelpInAppPurchaseHelper sharedHelper].products == nil)
            {
                [[MPKidsiHelpInAppPurchaseHelper sharedHelper] requestProducts];
                self.hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                _hud.labelText = @"Loading...";
                [self performSelector:@selector(timeout:) withObject:nil afterDelay:30.0];
            }
        }
        
    }
    
    
    
    
    
}



-(void) viewWillDisAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kProductsLoadedNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kProductPurchasedNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kProductPurchaseFailedNotification object:nil];
        [[NSNotificationCenter defaultCenter] removeObserver:self name:kProductRestoreFailedNotification object:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return interfaceOrientation ==UIInterfaceOrientationPortrait;
    } else {
        
        return  ((interfaceOrientation ==UIInterfaceOrientationLandscapeLeft) || (interfaceOrientation ==UIInterfaceOrientationLandscapeRight));
    }
}

@end
