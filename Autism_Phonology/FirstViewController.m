//
//  ViewController.m
//  Autism_Phonology
//
//  Created by Mindpace on 11/11/14.
//  Copyright (c) 2014 Mindpace. All rights reserved.
//

#import "FirstViewController.h"
//#import "AppDelegate.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize appDel,questionVC,selectXib,optionPage;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    appDel=[[UIApplication sharedApplication]delegate];
    self.mydefaults=[NSUserDefaults standardUserDefaults];
  
 
  if([self.mydefaults objectForKey:ProIden])
    {
        UIImage *purImage;
        
        if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone )
        {
            if(self.appDel.isIphone5)
                purImage = [UIImage imageNamed:@"iphone5_phonological_awareness_ menu page.png"];
            else if(self.appDel.isiPhone)
            {
                purImage = [UIImage imageNamed:@"iphone_phonological awarenss menu page.png"];
            }
            
            else if(self.appDel.isIphone6)
            {
              purImage = [UIImage imageNamed:@"iphone6_phonological awarenss menu page.png"];
            }
        
            else if(self.appDel.isIphone6plus)
            {
              purImage = [UIImage imageNamed:@"iphone6plus_phonological_awareness_ menu page.png"];
            }

        }
        else
            purImage = [UIImage imageNamed:@"ipad_phonological_awareness_ menu page.png"];
        
        [self.HomeView setImage:purImage];
        
    }
    
    
    
    
    else
    {
        
        
        appDel.isiPhone=1;
    }
    
    
    
    
    
    
    if (SYSTEM_VERSION_LESS_THAN(@"7.0"))
    {
        UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"PHONOLOGICAL AWARENESS"
                                                         message:@"\n\n"
                                                        delegate:self
                                               cancelButtonTitle:@"Restore"
                                               otherButtonTitles:@"Yes",@"No", nil] ;
        
        UILabel *text;
        if(appDel.isiPhone)
        {
            text= [[UILabel alloc]
                   initWithFrame:CGRectMake(12, 30, 260.0, 50.0)];
            text.font=[UIFont systemFontOfSize:12];
            
        }
        else
        {
            text= [[UILabel alloc]initWithFrame:CGRectMake(12,33,260, 70)];
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
                                               otherButtonTitles:@"Yes",@"No", nil] ;
        self.alert=alert1;
        
    }
    
    
    UIAlertView *calert1 = [[UIAlertView alloc] initWithTitle:@"Phonological Awareness"
                                                      message:@"Confirm Purchase?"
                                                     delegate:self
                                            cancelButtonTitle:@"NO"
                                            otherButtonTitles:@"YES", nil] ;
    
    self.calert=calert1;
  
  
  
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)MenuBtnTapped:(id)sender {
   
    int tag;
    tag=[sender tag];
    appDel.mButtonTag=tag;
   if(appDel.i==1)
   {
       questionVC=[[QuestionsPageVC alloc]initWithNibName:@"QuestionsPageVC_iphone5" bundle:nil];
       selectXib=@"QuestionsPageVC_iphone5";

     if ([sender tag]==1)
     {
         questionVC.MenuBtnTag_iphone5=@"rhyming words set a";
         [self.navigationController pushViewController:self.questionVC animated:YES];
     }
       
  else
  {
    if(![self.mydefaults objectForKey:ProIden])
      {
          [self.alert show];
          
          return;
      }
      
     if ([sender tag]==2)
     {
        questionVC.MenuBtnTag_iphone5=@"rhyming words set b";
        [self.navigationController pushViewController:self.questionVC animated:YES];
     }
     if ([sender tag]==3)
     {
        questionVC.MenuBtnTag_iphone5=@"rhyming words set c";
        [self.navigationController pushViewController:self.questionVC animated:YES];
     }
     if ([sender tag]==4)
     {
        questionVC.MenuBtnTag_iphone5=@"rhyming words set d";
        [self.navigationController pushViewController:self.questionVC animated:YES];
     }
     if ([sender tag]==5)
     {
         questionVC.MenuBtnTag_iphone5=@"rhyming words set e";
         [self.navigationController pushViewController:self.questionVC animated:YES];
     }
     if ([sender tag]==6)
     {
         questionVC.MenuBtnTag_iphone5=@"rhyming words set f";
         [self.navigationController pushViewController:self.questionVC animated:YES];
     }
     if ([sender tag]==7)
     {
         questionVC.MenuBtnTag_iphone5=@"all rhyming words";
         [self.navigationController pushViewController:self.questionVC animated:YES];
     }
  }
       
   }
   else if (appDel.i==2)
   {
       questionVC=[[QuestionsPageVC alloc]initWithNibName:@"QuestionsPageVC_iphone" bundle:nil];
       selectXib=@"QuestionsPageVC_iphone";
       
     if ([sender tag]==1)
     {
         questionVC.MenuBtnTag_iphone=@"rhyming words set a";
         [self.navigationController pushViewController:self.questionVC animated:YES];
     }
       
  else
  {
    if(![self.mydefaults objectForKey:ProIden])
      {
          [self.alert show];
          
          return;
      }
    
     if ([sender tag]==2)
     {
         questionVC.MenuBtnTag_iphone=@"rhyming words set b";
         [self.navigationController pushViewController:self.questionVC animated:YES];
     }
     if ([sender tag]==3)
     {
         questionVC.MenuBtnTag_iphone=@"rhyming words set c";
         [self.navigationController pushViewController:self.questionVC animated:YES];
     }
     if ([sender tag]==4)
     {
         questionVC.MenuBtnTag_iphone=@"rhyming words set d";
         [self.navigationController pushViewController:self.questionVC animated:YES];
     }
     if ([sender tag]==5)
     {
         questionVC.MenuBtnTag_iphone=@"rhyming words set e";
         [self.navigationController pushViewController:self.questionVC animated:YES];
     }
     if ([sender tag]==6)
     {
         questionVC.MenuBtnTag_iphone=@"rhyming words set f";
         [self.navigationController pushViewController:self.questionVC animated:YES];
     }
     if ([sender tag]==7)
     {
         questionVC.MenuBtnTag_iphone=@"all rhyming words";
         [self.navigationController pushViewController:self.questionVC animated:YES];
     }
  }
   
   }
    
   else if (appDel.i==4)
   {
       questionVC=[[QuestionsPageVC alloc]initWithNibName:@"QuestionsPageVC_iphone6" bundle:nil];
       selectXib=@"QuestionsPageVC_iphone6";
       
       if ([sender tag]==1)
       {
           questionVC.MenuBtnTag_iphone6=@"rhyming words set a";
           [self.navigationController pushViewController:self.questionVC animated:YES];
       }
       
   else
    {
      if(![self.mydefaults objectForKey:ProIden])
        {
            [self.alert show];
            
            return;
        }
        
       if ([sender tag]==2)
       {
           questionVC.MenuBtnTag_iphone6=@"rhyming words set b";
           [self.navigationController pushViewController:self.questionVC animated:YES];
       }
       if ([sender tag]==3)
       {
           questionVC.MenuBtnTag_iphone6=@"rhyming words set c";
           [self.navigationController pushViewController:self.questionVC animated:YES];
       }
       if ([sender tag]==4)
       {
           questionVC.MenuBtnTag_iphone6=@"rhyming words set d";
           [self.navigationController pushViewController:self.questionVC animated:YES];
       }
       if ([sender tag]==5)
       {
           questionVC.MenuBtnTag_iphone6=@"rhyming words set e";
           [self.navigationController pushViewController:self.questionVC animated:YES];
       }
       if ([sender tag]==6)
       {
           questionVC.MenuBtnTag_iphone6=@"rhyming words set f";
           [self.navigationController pushViewController:self.questionVC animated:YES];
       }
       if ([sender tag]==7)
       {
           questionVC.MenuBtnTag_iphone6=@"all rhyming words";
           [self.navigationController pushViewController:self.questionVC animated:YES];
       }
    }
       
   }
    
   else if (appDel.i==5)
   {
       questionVC=[[QuestionsPageVC alloc]initWithNibName:@"QuestionsPageVC_iphone6plus" bundle:nil];
       selectXib=@"QuestionsPageVC_iphone6plus";
       
       if ([sender tag]==1)
       {
           questionVC.MenuBtnTag_iphone6plus=@"rhyming words set a";
           [self.navigationController pushViewController:self.questionVC animated:YES];
       }
       
   else
    {
       if(![self.mydefaults objectForKey:ProIden])
        {
            [self.alert show];
            
            return;
        } 
      
        
       if ([sender tag]==2)
       {
           questionVC.MenuBtnTag_iphone6plus=@"rhyming words set b";
           [self.navigationController pushViewController:self.questionVC animated:YES];
       }
       if ([sender tag]==3)
       {
           questionVC.MenuBtnTag_iphone6plus=@"rhyming words set c";
           [self.navigationController pushViewController:self.questionVC animated:YES];
       }
       if ([sender tag]==4)
       {
           questionVC.MenuBtnTag_iphone6plus=@"rhyming words set d";
           [self.navigationController pushViewController:self.questionVC animated:YES];
       }
       if ([sender tag]==5)
       {
           questionVC.MenuBtnTag_iphone6plus=@"rhyming words set e";
           [self.navigationController pushViewController:self.questionVC animated:YES];
       }
       if ([sender tag]==6)
       {
           questionVC.MenuBtnTag_iphone6plus=@"rhyming words set f";
           [self.navigationController pushViewController:self.questionVC animated:YES];
       }
       if ([sender tag]==7)
       {
           questionVC.MenuBtnTag_iphone6plus=@"all rhyming words";
           [self.navigationController pushViewController:self.questionVC animated:YES];
       }
    }
       
   }
  
 
    
  else if(appDel.i==3)
  {
      questionVC=[[QuestionsPageVC alloc]initWithNibName:@"QuestionsPageVC_ipad" bundle:nil];
      selectXib=@"QuestionsPageVC_ipad";
    
     if ([sender tag]==1)
      {
         questionVC.MenuBtnTag_ipad=@"rhyming words set a";
         [self.navigationController pushViewController:self.questionVC animated:YES];
      }
      
   else
   {
      if(![self.mydefaults objectForKey:ProIden])
       {
           [self.alert show];
           
           return;
       }
       
     if ([sender tag]==2)
     {
         questionVC.MenuBtnTag_ipad=@"rhyming words set b";
         [self.navigationController pushViewController:self.questionVC animated:YES];
     }
     if ([sender tag]==3)
     {
          questionVC.MenuBtnTag_ipad=@"rhyming words set c";
          [self.navigationController pushViewController:self.questionVC animated:YES];
     }
      if ([sender tag]==4)
      {
         questionVC.MenuBtnTag_ipad=@"rhyming words set d";
         [self.navigationController pushViewController:self.questionVC animated:YES];
      }
     if ([sender tag]==5)
     {
         questionVC.MenuBtnTag_ipad=@"rhyming words set e";
         [self.navigationController pushViewController:self.questionVC animated:YES];
     }
     if ([sender tag]==6)
     {
          questionVC.MenuBtnTag_ipad=@"rhyming words set f";
          [self.navigationController pushViewController:self.questionVC animated:YES];
     }
     if ([sender tag]==7)
     {
          questionVC.MenuBtnTag_ipad=@"all rhyming words";
          [self.navigationController pushViewController:self.questionVC animated:YES];
     }
  }
  
  }
    
}

- (IBAction)OptionsBtnTapped:(id)sender {
    
    if (appDel.i==1)
    {
      optionPage=[[OptionsPageVC alloc]initWithNibName:@"OptionsPageVC_iphone5" bundle:nil];

        [self.navigationController pushViewController:optionPage animated:YES];
    }
    else if (appDel.i==2)
    {
      optionPage=[[OptionsPageVC alloc]initWithNibName:@"OptionsPageVC_iphone" bundle:nil];
        [self.navigationController pushViewController:optionPage animated:YES];
    }
    else if(appDel.i==3)
    {
      optionPage=[[OptionsPageVC alloc]initWithNibName:@"OptionsPageVC_ipad" bundle:nil];
        [self.navigationController pushViewController:optionPage animated:YES];
    }
    else if(appDel.i==4)
    {
        optionPage=[[OptionsPageVC alloc]initWithNibName:@"OptionsPageVC_iphone6" bundle:nil];
        [self.navigationController pushViewController:optionPage animated:YES];
    }

    else if(appDel.i==5)
    {
        optionPage=[[OptionsPageVC alloc]initWithNibName:@"OptionsPageVC_iphone6plus" bundle:nil];
        [self.navigationController pushViewController:optionPage animated:YES];
    }
}


   ////////////********************************************************//////////////


- (void)close
{
    [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
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

-(void) settingres
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


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if([alertView isEqual:self.alert])
    {
        if(buttonIndex==1)
        {
            
            [self buyButtonTapped];
            
        }
        if(buttonIndex==0)
        {
            [self settingres];
            
        }
    }
}



- (void)dismissHUD:(id)arg
{
    
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    self.hud = nil;
}

#pragma mark - Timer
- (void)timeout:(id)arg
{
    _hud.labelText = @"Timeout!";
    _hud.detailsLabelText = @"Please try again later.";
    _hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"37x-Checkmark.png"]];
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

- (void)productPurchaseFailed:(NSNotification *)notification
{
    
    
    NSLog(@"Purchase Failed");
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    SKPaymentTransaction * transaction = (SKPaymentTransaction *) notification.object;
    if (transaction.error.code != SKErrorPaymentCancelled) {
        UIAlertView *alertq = [[UIAlertView alloc] initWithTitle:@"Error!"
                                                         message:transaction.error.localizedDescription
                                                        delegate:nil
                                               cancelButtonTitle:nil
                                               otherButtonTitles:@"OK", nil];
        
        [alertq show];
        
    }
}



- (void)productPurchased:(NSNotification *)notification
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    
    NSString *productIdentifier = (NSString *) notification.object;
    NSLog(@"Purchased: %@", productIdentifier);
    
    UIImage *purImage;
    
    if([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone )
    {
        if(self.appDel.isIphone5)
            purImage = [UIImage imageNamed:@"iphone5_phonological_awareness_ menu page.png"];
        else if(self.appDel.isiPhone)
        {
            purImage = [UIImage imageNamed:@"iphone_phonological awarenss menu page.png"];
        }
        
        else if(self.appDel.isIphone6)
        {
            purImage = [UIImage imageNamed:@"iphone6_phonological awarenss menu page.png"];
        }
        
        else if(self.appDel.isIphone6plus)
        {
            purImage = [UIImage imageNamed:@"iphone6plus_phonological_awareness_ menu page.png"];
        }
        
    }
    else
        purImage = [UIImage imageNamed:@"ipad_phonological_awareness_ menu page.png"];
    
    [self.HomeView setImage:purImage];
    

}



-(void)viewWillAppear:(BOOL)animated
{
    
    [super viewWillAppear:animated];
    
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(productsLoaded:) name:kProductsLoadedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(productPurchased:) name:kProductPurchasedNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(productPurchaseFailed:) name:kProductPurchaseFailedNotification object: nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(productRestoredFailed:) name:kProductRestoreFailedNotification object: nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(productRestored:) name:kProductRestored object: nil];
    
    
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





- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)productRestored:(NSNotification *)notification
{
    
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kProductsLoadedNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kProductPurchasedNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kProductPurchaseFailedNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kProductRestoreFailedNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:
     kProductRestored object:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}


@end
