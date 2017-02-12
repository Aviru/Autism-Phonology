//
//  MPBuscadorATMInAppPurchaseHelper.m
//  DisplayiAD
//
//  Created by Mindpace on 09/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MPKidsiHelpInAppPurchaseHelper.h"
#import "MPConstants.h"

@implementation MPKidsiHelpInAppPurchaseHelper

static MPKidsiHelpInAppPurchaseHelper *_sharedHelper;

+ (MPKidsiHelpInAppPurchaseHelper*)sharedHelper
{
    if (_sharedHelper != nil)
        return _sharedHelper;
    
    _sharedHelper = [[MPKidsiHelpInAppPurchaseHelper alloc] init];
    return _sharedHelper;
}

- (id)init {
    //TODO: Replace the product identifiers with actual ones
    NSSet *productIdentifiers = [NSSet setWithObjects:
                                 ProIden ,
                                 
                                 nil];
    
    if ((self = [super initWithProductIdentifiers:productIdentifiers])) {                
        
    }
    return self;
    
}


@end
