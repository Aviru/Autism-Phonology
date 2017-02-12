//
//  MPInAppPurchaseHelper.m
//  DisplayiAD
//
//  Created by Mindpace on 09/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//jkhjhj

#import "MPInAppPurchaseHelper.h"
#import "AppDelegate.h"
#import "MPConstants.h"
//#import "HomeViewController.h"
//#import "WorkViewController.h"
@implementation MPInAppPurchaseHelper
@synthesize productIdentifiers = _productIdentifiers;
@synthesize products = _products;
@synthesize purchasedProducts = _purchasedProducts;
@synthesize request = _request;

- (id)initWithProductIdentifiers:(NSSet *)productIdentifiers 
{
    if ((self = [super init])) 
    {
        // Store product identifiers
        _productIdentifiers = [productIdentifiers retain];
        
        // Check for previously purchased products
        NSMutableSet * purchasedProducts = [NSMutableSet set];
        for (NSString * productIdentifier in _productIdentifiers) 
        {
            BOOL productPurchased = [[NSUserDefaults standardUserDefaults] boolForKey:productIdentifier];
            if (productPurchased) 
            {
                [purchasedProducts addObject:productIdentifier];
                NSLog(@"Previously purchased: %@", productIdentifier);
            }
            NSLog(@"Not purchased: %@", productIdentifier);
        }
        self.purchasedProducts = purchasedProducts;
        
    }
    return self;
}

- (void)requestProducts 
{    
    self.request = [[[SKProductsRequest alloc] initWithProductIdentifiers:_productIdentifiers] autorelease];
    _request.delegate = self;
    [_request start];
}

#pragma mark - SKProductsRequestDelegate 
- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response 
{    
    NSLog(@"Received products results...");
    NSLog(@"PRODUCTS: %@",[response.products description]);
    self.products = response.products;
    self.request = nil;    
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kProductsLoadedNotification object:_products];    
}

#pragma mark -
- (void)recordTransaction:(SKPaymentTransaction *)transaction 
{    
    // TODO: Record the transaction on the server side...    
}

- (void)provideContent:(NSString *)productIdentifier 
{    
    NSLog(@"Toggling flag for: %@", productIdentifier);
    [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:productIdentifier];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [_purchasedProducts addObject:productIdentifier];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kProductPurchasedNotification object:productIdentifier];
}

- (void)completeTransaction:(SKPaymentTransaction *)transaction 
{    
    NSLog(@"completeTransaction...");
    
    [self recordTransaction: transaction];
    [self provideContent: transaction.payment.productIdentifier];
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
}

- (void)restoreTransaction:(SKPaymentTransaction *)transaction 
{    
    NSLog(@"restoreTransaction...");
    
    [self recordTransaction: transaction];
    [self provideContent: transaction.originalTransaction.payment.productIdentifier];
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
    

    
}

- (void)failedTransaction:(SKPaymentTransaction *)transaction 
{    
    if (transaction.error.code != SKErrorPaymentCancelled)
    {
        NSLog(@"Transaction error: %@", transaction.error.localizedDescription);
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kProductPurchaseFailedNotification object:transaction];
    
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
}

#pragma mark - SKPaymentTransactionObserver 
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
    for (SKPaymentTransaction *transaction in transactions)
    {
        switch (transaction.transactionState)
        {
            case SKPaymentTransactionStatePurchased:
                [self completeTransaction:transaction];
                break;
            case SKPaymentTransactionStateFailed:
                [self failedTransaction:transaction];
                break;
            case SKPaymentTransactionStateRestored:
                [self restoreTransaction:transaction];
            default:
                break;
        }
    }
}

#pragma mark -
- (void)buyProductIdentifier:(NSString *)productIdentifier 
{    
    NSLog(@"Buying %@...", productIdentifier);
    
    SKPayment *payment = [SKPayment paymentWithProductIdentifier:productIdentifier];
    [[SKPaymentQueue defaultQueue] addPayment:payment];
    
}

- (void)restoreProductIdentifier 
{ 
  [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}

- (void)paymentQueue:(SKPaymentQueue *)queue restoreCompletedTransactionsFailedWithError:(NSError *)error
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kProductRestoreFailedNotification object:queue];
}

- (void) paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue
{
 if([[NSUserDefaults standardUserDefaults] objectForKey:ProIden])
 {
     UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Phonological Awareness"
                                                      message:@"Restore Successful!" 
                                                     delegate:nil
                                            cancelButtonTitle:@"Ok" 
                                            otherButtonTitles: nil] ;
     [alert1 show];
     [alert1 release];
     
        // [(AHViewController*)[[[[[(AHAppDelegate *)[[UIApplication sharedApplication] delegate]  viewControllers] objectAtIndex:0] viewControllers] objectAtIndex:0]dismissHUD:nil];
     
       // [(WorkViewController *)[[[[[(AppDelegate *)[[UIApplication sharedApplication] delegate] tabBarController] viewControllers] objectAtIndex:0] viewControllers] objectAtIndex:0]dismissHUD:nil];
 }
    else
    {
        UIAlertView *alert1 = [[UIAlertView alloc] initWithTitle:@"Phonological Awareness"
                                                         message:@"Restore Failed!" 
                                                        delegate:nil 
                                               cancelButtonTitle:@"Ok" 
                                               otherButtonTitles: nil] ;
        [alert1 show];
        [alert1 release];
        
        
       // [(AHViewController *)[[[[[(AppDelegate *)[[UIApplication sharedApplication] delegate] tabBarController] viewControllers] objectAtIndex:0] viewControllers] objectAtIndex:0]dismissHUD:nil];
        
      //  [(WorkViewController *)[[[[[(AppDelegate *)[[UIApplication sharedApplication] delegate] tabBarController] viewControllers] objectAtIndex:0] viewControllers] objectAtIndex:0]dismissHUD:nil];
    }
}

#pragma mark -
- (void)dealloc
{
    [_productIdentifiers release];
    _productIdentifiers = nil;
    [_products release];
    _products = nil;
    [_purchasedProducts release];
    _purchasedProducts = nil;
    [_request release];
    _request = nil;
    [super dealloc];
}

@end
