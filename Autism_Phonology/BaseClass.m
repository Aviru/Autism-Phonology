//
//  BaseClass.m
//  WH Language Concepts
//
//  Created by Mindpace on 17/01/13.
//  Copyright (c) 2013 Mindpace. All rights reserved.
//

#import "BaseClass.h"

@implementation BaseClass
@synthesize appDel,player,fon,foff;

/*-(void) dealloc{
   
    [player release];
    [apd.savedSettings release];
    [foff release];
    [fon release];
    
    [apd release];
 [super dealloc];
} */

-(void)viewDidLoad{
    [super viewDidLoad];
    
    
     randAudio=arc4random()%2;
    
    
    
    appDel=[[UIApplication sharedApplication]delegate];
    appDel.savedSettings=[NSUserDefaults standardUserDefaults];
    

   
        [FetchAndStoreMarksOn moveDatabase];
        [FetchAndStoreMarksOff moveDatabase];
    
    FetchAndStoreMarksOn *fon2=[[FetchAndStoreMarksOn alloc] init];
    self.fon=fon2;
    //[fon2 release];
    
      FetchAndStoreMarksOff *foff2=[[FetchAndStoreMarksOff alloc] init];
    self.foff=foff2;
  //  [foff2 release];
}

-(NSString*)selectXib:(NSString*)xibName
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        // iPad-specific interface here
        return [NSString stringWithFormat:@"%@_ipad",xibName];
    }
    else
    {
        if (appDel.isIphone5) {
            //iphone5////////////
            return [NSString stringWithFormat:@"%@_iphone5",xibName];
        }
        else{
            // iPhone and iPod touch interface here
            return [NSString stringWithFormat:@"%@_iphone",xibName];
        }
    }
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft || interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}


-(void) playAudio :(NSString*)file with:(int)flag;
{
    

       // apd.SavedSettings=[NSUserDefaults standardUserDefaults];
        if (![[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"off"] || flag==1)
        {
            NSString *path;
            NSURL *url;
            //where you are about to add sound
            NSArray *a=[file componentsSeparatedByString:@"?"];
            NSString *newfile=[a objectAtIndex:0];
            
            NSLog(@"Audio file: %@",newfile);
            
         if ([[appDel.savedSettings objectForKey:@"audio type"] isEqualToString:@"m"])
         {
            path =[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@_m",newfile] ofType:@"mp3"];
         }
         else if([[appDel.savedSettings objectForKey:@"audio type"] isEqualToString:@"f"])
         {
             path =[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@_f",newfile] ofType:@"mp3"];
         }
        else
        {
            NSLog(@"%d",randAudio);
           
            if (randAudio==0) {
                path =[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@_m",newfile] ofType:@"mp3"];
            }
            else
            {
              path =[[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@_f",newfile] ofType:@"mp3"];
            }
            
        }
   
            @try {
                url = [NSURL fileURLWithPath:path];
                player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
                [player play];
            }
            @catch (NSException *exception) {
                NSLog(@"Audio file not found: %@",path);
            }
        }
    
    
   
        
    

}


///////SCORE PART///////


-(void)saveScore
{
   
    
        if ([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"])
        {
            //audio is on
            NSString *cate=nil;
            
            switch (appDel.mButtonTag)
            {
                case 1:
                    // score for set a
                    cate=@"a";
                    break;
                case 2:
                    // score for set b
                    cate=@"b";
                    break;
                case 3:
                    // score for set c
                    cate=@"c";
                    break;
                case 4:
                    // score for set d
                    cate=@"d";
                    break;
                case 5:
                    // score for what does not belong1
                    cate=@"e";
                    break;
                case 6:
                    // score for what does not belong2
                    cate=@"f";
                    break;
                case 7:
                    // score for all questions
                    cate=@"g";
                    break;
                default:
                    break;
            }
            
            fon.gtype=@"";
            fon.cate=cate;
            

            NSLog(@"Category %@",cate);
            
            if([fon getNoOfRecords]>=3)
            {
                [fon fetchFirstRecord];
                [fon deleteRecord];
            }
            
            fon.marks=(float)appDel.score;
            fon.gtype=@"";
            fon.cate=cate;
            fon.ID=[fon fetchLastRecordID]+1;
            
            NSLog(@"m:%f",fon.marks);
            NSLog(@"g:%@",fon.gtype);
            NSLog(@"c:%@",fon.cate);
            NSLog(@"i:%i",fon.ID);
            
            [fon addRecords];
            
            
            
            
        }
        else{
            //audio is off
            NSString *cate=nil;
            
            switch (appDel.mButtonTag)
            {
                case 1:
                    // score for set a
                    //appd.score
                    cate=@"a";
                    break;
                case 2:
                    // score for set b
                    cate=@"b";
                    break;
                case 3:
                    // score for set c
                    cate=@"c";
                    break;
                case 4:
                    // score for set d
                    cate=@"d";
                    break;
                case 5:
                    // score for what does not belong1
                    cate=@"e";
                    break;
                case 6:
                    // score for what does not belong2
                    cate=@"f";
                    break;
                case 7:
                    // score for all questions
                    cate=@"g";
                    break;
                default:
                    break;
            }

            
            foff.gtype=@"";
            foff.cate=cate;
            
            
            NSLog(@"Category %@",cate);
            
            if([foff getNoOfRecords]>=3)
            {
                [foff fetchFirstRecord];
                [foff deleteRecord];
            }
            
            self.foff.marks=appDel.score;
            self.foff.gtype=@"";
            self.foff.cate=cate;
            self.foff.ID=[foff fetchLastRecordID]+1;
            
            NSLog(@"m:%f",foff.marks);
            NSLog(@"g:%@",foff.gtype);
            NSLog(@"c:%@",foff.cate);
            NSLog(@"i:%i",foff.ID);
            
            [foff addRecords];
            
        }

        
    
    
    
} 

-(void)shuffle:(NSMutableArray *)arr
{
    int j;
	
	for(int m=0;m<[arr count];m++)
	{
		j=arc4random()%[arr count];
		[arr exchangeObjectAtIndex:m withObjectAtIndex:j];
        
	}
}


@end
