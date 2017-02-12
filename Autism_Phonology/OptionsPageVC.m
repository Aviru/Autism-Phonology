//
//  OptionsPageVC_ipad.m
//  Autism_Phonology
//
//  Created by Mindpace on 12/11/14.
//  Copyright (c) 2014 Mindpace. All rights reserved.
//

#import "OptionsPageVC.h"

@interface OptionsPageVC ()
{
    int i;
}

@end

@implementation OptionsPageVC

@synthesize appDel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    appDel=[[UIApplication sharedApplication]delegate];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        if (appDel.i==1)
        {
            _rq.transform=CGAffineTransformMakeScale(0.92f, .72f);
            _audio.transform=CGAffineTransformMakeScale(0.92f, .72f);
            _audioType.transform=CGAffineTransformMakeScale(0.92f, .72f);
            _answers.transform=CGAffineTransformMakeScale(0.92f, .72f);
            _questionText.transform=CGAffineTransformMakeScale(0.92f, .72f);
            _answerText.transform=CGAffineTransformMakeScale(0.92f, .72f);
            _questionImage.transform=CGAffineTransformMakeScale(0.92f, .72f);
        }
        
      else if(appDel.i==2)
      {
        _rq.transform=CGAffineTransformMakeScale(0.52f, .72f);
        _audio.transform=CGAffineTransformMakeScale(0.52f, .72f);
        _audioType.transform=CGAffineTransformMakeScale(0.52f, .72f);
        _answers.transform=CGAffineTransformMakeScale(0.52f, .72f);
        _questionText.transform=CGAffineTransformMakeScale(0.52f, .72f);
        _answerText.transform=CGAffineTransformMakeScale(0.52f, .72f);
        _questionImage.transform=CGAffineTransformMakeScale(0.52f, .72f);
          
          /*UIFont *Boldfont = [UIFont boldSystemFontOfSize:25.0f];
          NSDictionary *attributes = [NSDictionary dictionaryWithObject:Boldfont forKey:UITextAttributeFont];
          
          [_rq setTitleTextAttributes:attributes forState:UIControlStateNormal];
          [_audio setTitleTextAttributes:attributes forState:UIControlStateNormal];
          [_audioType setTitleTextAttributes:attributes forState:UIControlStateNormal];
          [_answers setTitleTextAttributes:attributes forState:UIControlStateNormal];
          [_answerText setTitleTextAttributes:attributes forState:UIControlStateNormal];
          [_questionImage setTitleTextAttributes:attributes forState:UIControlStateNormal];
          [_questionText setTitleTextAttributes:attributes forState:UIControlStateNormal];*/
      }
//     else if (appDel.i==4)
//     {
//         _rq.transform=CGAffineTransformMakeScale(0.92f, .72f);
//         _audio.transform=CGAffineTransformMakeScale(0.92f, .72f);
//         _audioType.transform=CGAffineTransformMakeScale(0.92f, .72f);
//         _answers.transform=CGAffineTransformMakeScale(0.92f, .72f);
//         _questionText.transform=CGAffineTransformMakeScale(0.92f, .72f);
//         _answerText.transform=CGAffineTransformMakeScale(0.92f, .72f);
//         _questionImage.transform=CGAffineTransformMakeScale(0.92f, .72f);
//
// 
//     }
//        
//     else if (appDel.i==5)
//     {
//         _rq.transform=CGAffineTransformMakeScale(1.22f, 1.02f);
//         _audio.transform=CGAffineTransformMakeScale(1.22f, 1.02f);
//         _audioType.transform=CGAffineTransformMakeScale(1.22f, 1.02f);
//         _answers.transform=CGAffineTransformMakeScale(1.22f, 1.02f);
//         _questionText.transform=CGAffineTransformMakeScale(1.22f, 1.02f);
//         _answerText.transform=CGAffineTransformMakeScale(1.22f, 1.02f);
//         _questionImage.transform=CGAffineTransformMakeScale(1.22f, 1.02f);
//     }
//        
   }
        
    else
    {
        _rq.transform=CGAffineTransformMakeScale(1.00f, .90f);
        _audio.transform=CGAffineTransformMakeScale(1.00f, .90f);
        _audioType.transform=CGAffineTransformMakeScale(1.00f, .90f);
        _answers.transform=CGAffineTransformMakeScale(1.00f, .90f);
        _questionText.transform=CGAffineTransformMakeScale(1.00f, .90f);
        _answerText.transform=CGAffineTransformMakeScale(1.00f, .90f);
        _questionImage.transform=CGAffineTransformMakeScale(1.00f, .90f);
    }
    
    
    UIFont *font1=nil;
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        font1=[UIFont fontWithName:@"Arial Rounded MT Bold" size:19.0f];
        
    }
    else
    {
        font1=[UIFont fontWithName:@"Arial Rounded MT Bold" size:19.0f];
    }
    
    NSDictionary *attributes =nil;
    
    if([[[UIDevice currentDevice] systemVersion] floatValue]<7.0)
        attributes= [NSDictionary dictionaryWithObject:font1
                                                forKey:UITextAttributeFont/*NSFontAttributeName*/];
    else
        attributes= [NSDictionary dictionaryWithObject:font1
                                                forKey:NSFontAttributeName];
    
    //    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
    //    {
    
    [_rq setTitleTextAttributes:attributes
                       forState:UIControlStateNormal];
    [_audio setTitleTextAttributes:attributes
                       forState:UIControlStateNormal];
    [_audioType setTitleTextAttributes:attributes
                       forState:UIControlStateNormal];
    [_answers setTitleTextAttributes:attributes
                            forState:UIControlStateNormal];
    [_questionText setTitleTextAttributes:attributes
                          forState:UIControlStateNormal];
    [_answerText setTitleTextAttributes:attributes
                          forState:UIControlStateNormal];
    [_questionImage setTitleTextAttributes:attributes
                             forState:UIControlStateNormal];
    
    [self updateFrame:_rq];
    [self updateFrame:_audio];
    [self updateFrame:_audioType];
    [self updateFrame:_answers];
    [self updateFrame:_questionText];
    [self updateFrame:_answerText];
    [self updateFrame:_questionImage];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    if ([[appDel.savedSettings objectForKey:@"random"] isEqualToString:@"on"]) {
        _rq.selectedSegmentIndex=0;
    }
    else if([[appDel.savedSettings objectForKey:@"random"] isEqualToString:@"off"]){
        _rq.selectedSegmentIndex=1;
    }
    
    if ([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"])    {
        _audio.selectedSegmentIndex=0;
    }
    else if ([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"off"])
    {
        _audio.selectedSegmentIndex=1;
    }
    
    if ([[appDel.savedSettings objectForKey:@"audio type"] isEqualToString:@"m"]) {
        _audioType.selectedSegmentIndex=0;
    }
    else if([[appDel.savedSettings objectForKey:@"audio type"] isEqualToString:@"f"]){
        _audioType.selectedSegmentIndex=1;
    }
   
    if ([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"2"]) {
        _answers.selectedSegmentIndex=0;
    }
    else if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"3"]){
        _answers.selectedSegmentIndex=1;
    }
    else if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"4"]){
        _answers.selectedSegmentIndex=2;
    }
    
    if ([[appDel.savedSettings objectForKey:@"question text"] isEqualToString:@"on"]) {
        _questionText.selectedSegmentIndex=0;
    }
    else if([[appDel.savedSettings objectForKey:@"question text"] isEqualToString:@"off"]){
        _questionText.selectedSegmentIndex=1;
    }
    
    
    if ([[appDel.savedSettings objectForKey:@"answer text"] isEqualToString:@"on"]) {
        _answerText.selectedSegmentIndex=0;
    }
    else if([[appDel.savedSettings objectForKey:@"answer text"] isEqualToString:@"off"]){
        _answerText.selectedSegmentIndex=1;
    }

    if ([[appDel.savedSettings objectForKey:@"question image"] isEqualToString:@"on"]) {
        _questionImage.selectedSegmentIndex=0;
    }
    else if([[appDel.savedSettings objectForKey:@"question image"] isEqualToString:@"off"]){
        _questionImage.selectedSegmentIndex=1;
    }

    
    ////////////FetchScore///////////
    
    FetchAndStoreMarksOn *fon1=[[FetchAndStoreMarksOn alloc] init];
    self.fon=fon1;
    [fon1 release];
    NSMutableArray *arr=[self.fon getValue];
    
    //NSLog(@"Fon %@",[arr objectAtIndex:0]);
    FetchAndStoreMarksOff *foff1=[[FetchAndStoreMarksOff alloc] init];
    self.foff=foff1;
    [foff1 release];
    NSMutableArray *arr1=[self.foff getValue];
    //NSLog(@"Foff %@",[arr1 objectAtIndex:0]);
    
    //Audio On Average for Fraction & Percentage
    
    BOOL f1=NO;
    BOOL f2=NO;
    
    
  /*  NSMutableArray *fractionArr=[[NSMutableArray alloc] initWithCapacity:[arr count]];
    int count1=0,psum1=0;
    NSInteger fnum=0;
    NSInteger audioOnAvg=0;
    
    for(int i=0;i<[arr count];i++)
    {
        NSInteger scr1=round([[arr objectAtIndex:i] doubleValue]/12.5);
        NSNumber *anum=[[NSNumber alloc] initWithInteger:scr1];
        [fractionArr addObject:anum];
        [anum release];
        
        if([[arr objectAtIndex:i] isKindOfClass:[NSString class]])
        {
            
        }
        else
        {
            f1=YES;
            psum1+=round([[arr objectAtIndex:i] doubleValue]);
            count1++;
            
        }
    }
    
    if(psum1==0)
    {
        [percentAudOnAvg setText:@"-"];
        //[self. fracAudOnAvg setText:@"-"];
        
    }
    else
    {
        audioOnAvg=round(psum1/count1);
        // [self.percentAudOnAvg setText:[NSString stringWithFormat:@"%d%%",audioOnAvg]];
        [self.percentAudOnAvg setText:[NSString stringWithFormat:@"%3ld%%",(long)audioOnAvg]];
        fnum=round((psum1/12.5)/count1);
        [self.fracAudOnAvg setText:[NSString stringWithFormat:@"%d/8",fnum]];
    }
    
    //Audio Off Average for Fraction & Percentage
    
    NSMutableArray *fractionArr1=[[NSMutableArray alloc]initWithCapacity:[arr1 count]];
    int count2=0,psum2=0;
    NSInteger fnum1=0;
    NSInteger audioOffAvg=0;
    
    for(int i=0;i<[arr1 count];i++)
    {
        NSInteger scr1=round([[arr1 objectAtIndex:i] doubleValue]/12.5);
        NSNumber *anum=[[NSNumber alloc] initWithInteger:scr1];
        [fractionArr1 addObject:anum];
        [anum release];
        
        if([[arr1 objectAtIndex:i] isKindOfClass:[NSString class]])
        {
            
        }
        else
        {
            f2=YES;
            psum2+=round([[arr1 objectAtIndex:i] doubleValue]);
            count2++;
        }
    }
    
    if(psum2==0)
    {
        [self.percentAudOffAvg setText:@"-"];
        //[self.fracAudOffAvg setText:@"-"];
    }
    else
    {
        audioOffAvg=round(psum2/count2);
        // [self.percentAudOffAvg setText:[NSString stringWithFormat:@"%d%%",audioOffAvg]];
        [self.percentAudOffAvg setText:[NSString stringWithFormat:@"%3ld%%",(long)audioOffAvg]];
        
        fnum1=round((psum2/12.5)/count2);
        [self.fracAudOffAvg setText:[NSString stringWithFormat:@"%d/8",fnum1]];
    }
       */
   
    //  ******** MODIFIED *********        All Audio On Avg (Both fraction & percentage)
    
    /*NSInteger scr1=0;
     int noPlayed=0;
     if(![[arr objectAtIndex:0] isKindOfClass:[NSString class]])
     {
     scr1=round([[arr objectAtIndex:0] doubleValue]);
     }
     
     if(psum1==0 && f1==NO && count1!=0)
     {
     [self.percentAudOnAvg setText:@"-"];
     [self.fracAudOnAvg setText:@"-"];
     }
     else if(![[arr objectAtIndex:0] isKindOfClass:[NSString class]])
     {
     NSInteger allPer=round([[arr objectAtIndex:0] doubleValue]);
     noPlayed=count1+1;
     NSLog(@"PSUM1 %d ALLPER %d Total played: %d",psum1,allPer,noPlayed);
     audioOnAvg=round((psum1+allPer)/noPlayed);
     [self.percentAudOnAvg setText:[NSString stringWithFormat:@"%d%%",audioOnAvg]];
     
     fnum=round(((scr1+psum1)/12.5)/noPlayed);
     NSLog(@"Value of frac: %ld",(long)fnum);
     [self.fracAudOnAvg setText:[NSString stringWithFormat:@"%d/8",fnum]];
     }
     
     // ******** MODIFIED *********         All Audio Off Avg (Both fraction & percentage)
     
     scr1=0;
     noPlayed=0;
     fnum1=0;
     if(![[arr1 objectAtIndex:0] isKindOfClass:[NSString class]])
     {
     scr1=round([[arr1 objectAtIndex:0] doubleValue]);
     }
     
     if(psum2==0 && f2==NO && count2!=0)
     {
     [self.percentAudOffAvg setText:@"-"];
     [self.fracAudOffAvg setText:@"-"];
     }
     else if(![[arr1 objectAtIndex:0] isKindOfClass:[NSString class]])
     {
     NSInteger allPer=round([[arr1 objectAtIndex:0] doubleValue]);
     noPlayed=count2+1;
     audioOffAvg=round((psum2+allPer)/noPlayed);
     [self.percentAudOffAvg setText:[NSString stringWithFormat:@"%d%%",audioOffAvg]];
     
     fnum1=round(((scr1+psum2)/12.5)/noPlayed);
     [self.fracAudOffAvg setText:[NSString stringWithFormat:@"%d/8",fnum1]];
     }*/
    
    
    //Audio On
    
    if (![[arr objectAtIndex:0] isKindOfClass:[NSString class]])
    {
        [self.lb1 setText:[NSString stringWithFormat:@" %3.f%@",[[arr objectAtIndex:0] floatValue],@"%"]];
    }
    else
    {
        [self.lb1 setText:[NSString stringWithFormat:@"%@",[arr objectAtIndex:0]]];
    }
    
    if (![[arr objectAtIndex:1] isKindOfClass:[NSString class]])
    {
        [self.lb2 setText:[NSString stringWithFormat:@" %3.f%@",[[arr objectAtIndex:1] floatValue],@"%"]];
    }
    else
    {
        [self.lb2 setText:[NSString stringWithFormat:@"%@",[arr objectAtIndex:1]]];
    }
    
    if (![[arr objectAtIndex:2] isKindOfClass:[NSString class]])
    {
        [self.lb3 setText:[NSString stringWithFormat:@" %3.f%@",[[arr objectAtIndex:2] floatValue],@"%"]];
    }
    else
    {
        [self.lb3 setText:[NSString stringWithFormat:@"%@",[arr objectAtIndex:2]]];
    }
    
    if (![[arr objectAtIndex:3] isKindOfClass:[NSString class]])
    {
        [self.lb4 setText:[NSString stringWithFormat:@" %3.f%@",[[arr objectAtIndex:3] floatValue],@"%"]];
    }
    else
    {
        [self.lb4 setText:[NSString stringWithFormat:@"%@",[arr objectAtIndex:3]]];
    
    }
    
    if (![[arr objectAtIndex:4] isKindOfClass:[NSString class]])
    {
        [self.lb5 setText:[NSString stringWithFormat:@" %3.f%@",[[arr objectAtIndex:4] floatValue],@"%"]];
    }
    else
    {
        [self.lb5 setText:[NSString stringWithFormat:@"%@",[arr objectAtIndex:4]]];
    }
    if (![[arr objectAtIndex:5] isKindOfClass:[NSString class]])
    {
        [self.lb6 setText:[NSString stringWithFormat:@" %3.f%@",[[arr objectAtIndex:5] floatValue],@"%"]];
    }
    else
    {
        [self.lb6 setText:[NSString stringWithFormat:@"%@",[arr objectAtIndex:5]]];
    }
    
    if (![[arr objectAtIndex:6] isKindOfClass:[NSString class]])
    {
        [self.lb7 setText:[NSString stringWithFormat:@" %3.f%@",[[arr objectAtIndex:6] floatValue],@"%"]];
    }
    else
    {
        [self.lb7 setText:[NSString stringWithFormat:@"%@",[arr objectAtIndex:6]]];
    }
    
    //Audio Off
    
    
    if (![[arr1 objectAtIndex:0] isKindOfClass:[NSString class]])
    {
        [self.lb8 setText:[NSString stringWithFormat:@" %3.f%@",[[arr1 objectAtIndex:0] floatValue],@"%"]];
    }
    else
    {
        [self.lb8 setText:[NSString stringWithFormat:@"%@",[arr1 objectAtIndex:0]]];
    }
    
    if (![[arr1 objectAtIndex:1] isKindOfClass:[NSString class]])
    {
        [self.lb9 setText:[NSString stringWithFormat:@" %3.f%@",[[arr1 objectAtIndex:1] floatValue],@"%"]];
    }
    else
    {
        [self.lb9 setText:[NSString stringWithFormat:@"%@",[arr1 objectAtIndex:1]]];
    }
    
    if (![[arr1 objectAtIndex:2] isKindOfClass:[NSString class]])
    {
        [self.lb10 setText:[NSString stringWithFormat:@" %3.f%@",[[arr1 objectAtIndex:2] floatValue],@"%"]];
    }
    else
    {
        [self.lb10 setText:[NSString stringWithFormat:@"%@",[arr1 objectAtIndex:2]]];
    }
    
    if (![[arr1 objectAtIndex:3] isKindOfClass:[NSString class]])
    {
        [self.lb11 setText:[NSString stringWithFormat:@" %3.f%@",[[arr1 objectAtIndex:3] floatValue],@"%"]];
        
    }
    else
    {
        [self.lb11 setText:[NSString stringWithFormat:@"%@",[arr1 objectAtIndex:3]]];
    }
    
    if (![[arr1 objectAtIndex:4] isKindOfClass:[NSString class]])
    {
        [self.lb12 setText:[NSString stringWithFormat:@" %3.f%@",[[arr1 objectAtIndex:4] floatValue],@"%"]];
    }
    else
    {
        [self.lb12 setText:[NSString stringWithFormat:@"%@",[arr1 objectAtIndex:4]]];
    }
    if (![[arr1 objectAtIndex:5] isKindOfClass:[NSString class]])
    {
        [self.lb13 setText:[NSString stringWithFormat:@" %3.f%@",[[arr1 objectAtIndex:5] floatValue],@"%"]];
    }
    else
    {
        [self.lb13 setText:[NSString stringWithFormat:@"%@",[arr1 objectAtIndex:5]]];
    }
    
    if (![[arr1 objectAtIndex:6] isKindOfClass:[NSString class]])
    {
        [self.lb14 setText:[NSString stringWithFormat:@" %3.f%@",[[arr1 objectAtIndex:6] floatValue],@"%"]];
        
    }
    else
    {
        [self.lb14 setText:[NSString stringWithFormat:@"%@",[arr1 objectAtIndex:6]]];
    }
    
    


    
}

- (void)updateFrame:(UISegmentedControl *) aSeg
{
    CGRect ar = aSeg.frame;
    float x = ar.origin.x;
    float y = ar.origin.y;
    float w = ar.size.width;
    float h = ar.size.height;
    
    appDel=(AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        if([[[UIDevice currentDevice] systemVersion] floatValue]<7.0)
        {
            aSeg.frame = CGRectMake(x, y, w, h);
        }
        else
        {
            if(appDel.isIphone5)
            {
                aSeg.frame = CGRectMake(x, y, w, h+10);
            }
            else
            {
                aSeg.frame = CGRectMake(x, y, w, h+10);
            }
        }
    }
    else
    {
        //aSeg.frame = CGRectMake(x, y+3, w, h - 6);
        if([[[UIDevice currentDevice] systemVersion] floatValue]<7.0)
        {
            aSeg.frame = CGRectMake(x + 3, y - 4, w, 36);
        }
        else
        {
            aSeg.frame = CGRectMake(x + 3, y - 6, w, 40); // 36
        }
        
    }
    
}

- (void) changeUISegmentFont:(UIView*) myView
{
    if ([myView isKindOfClass:[UILabel class]])
    {  // Getting the label subview of the passed view
        
        UILabel *label = (UILabel*) myView;
        
        [label setTextAlignment:NSTextAlignmentCenter];
        
        [label setFont:[UIFont boldSystemFontOfSize:13]];
        // Set the font size you want to change to
        
    }
    
    NSArray* subViewArray = [myView subviews]; // Getting the subview array
    
    NSEnumerator* iterator = [subViewArray objectEnumerator]; // For enumeration
    
    UIView* subView;
    
    while (subView = [iterator nextObject]) { // Iterating through the subviews of the view passed
        
        [self changeUISegmentFont:subView]; // Recursion
        
    }
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)SegmentButtons:(id)sender {
    
    
    
    i=arc4random()%2;
    
    
    
    switch ([sender tag])
    
    {
            
        case 1:
            
            if ([[_rq titleForSegmentAtIndex:_rq.selectedSegmentIndex] isEqualToString:@"on"])
                
            {
                
                [appDel.savedSettings setObject:@"on" forKey:@"random"];
                
            }
            
            else
                
            {
                
                [appDel.savedSettings setObject:@"off" forKey:@"random"];
                
            }
            
            [appDel.savedSettings synchronize];
            
            break;
            
        case 2:
            
            if ([[_audio titleForSegmentAtIndex:_audio.selectedSegmentIndex] isEqualToString:@"on"])
                
            {
                
                [appDel.savedSettings setObject:@"on" forKey:@"audio"];
                
                
                
            }
            
            else
                
            {
                
                if ([[_questionImage titleForSegmentAtIndex:_questionImage.selectedSegmentIndex] isEqualToString:@"off"])
                    
                {
                    
                    //  _questionText.selectedSegmentIndex=0;
                    
                    
                    
                    // [appDel.savedSettings setObject:@"on" forKey:@"question text"];
                    
                    
                    
                    if ([[_questionText titleForSegmentAtIndex:_questionText.selectedSegmentIndex] isEqualToString:@"off"])
                        
                    {
                        
                        // _questionImage.selectedSegmentIndex=0;
                        
                        //  [appDel.savedSettings setObject:@"on" forKey:@"question image"];
                        
                        
                        
                        
                        
                        if (i==0)
                            
                        {
                            
                            _questionText.selectedSegmentIndex=0;
                            
                            
                            
                            [appDel.savedSettings setObject:@"on" forKey:@"question text"];
                            
                            
                            
                        }
                        
                        else
                            
                        {
                            
                            _questionImage.selectedSegmentIndex=0;
                            
                            [appDel.savedSettings setObject:@"on" forKey:@"question image"];
                            
                            
                            
                        }
                        
                    }
                    
                    
                    
                }
                
                
                
                /*  if ([[_questionText titleForSegmentAtIndex:_questionText.selectedSegmentIndex] isEqualToString:@"off"])
                 
                 {
                 
                 _questionImage.selectedSegmentIndex=0;
                 
                 [appDel.savedSettings setObject:@"on" forKey:@"question image"];
                 
                 
                 
                 }
                 
                 */
                
                
                
                [appDel.savedSettings setObject:@"off" forKey:@"audio"];
                
            }
            
            [appDel.savedSettings synchronize];
            
            break;
            
        case 3:
            
            if ([[_audioType titleForSegmentAtIndex:_audioType.selectedSegmentIndex] isEqualToString:@"m"])
                
            {
                
                [appDel.savedSettings setObject:@"m" forKey:@"audio type"];
                
            }
            
            else if([[_audioType titleForSegmentAtIndex:_audioType.selectedSegmentIndex] isEqualToString:@"f"])
                
            {
                
                [appDel.savedSettings setObject:@"f" forKey:@"audio type"];
                
            }
            
            [appDel.savedSettings synchronize];
            
            break;
            
        case 4:
            
            if ([[_answers titleForSegmentAtIndex:_answers.selectedSegmentIndex] isEqualToString:@"2"])
                
            {
                
                NSLog(@"2");
                
                [appDel.savedSettings setObject:@"2" forKey:@"answer option"];
                
            }
            
            else if ([[_answers titleForSegmentAtIndex:_answers.selectedSegmentIndex] isEqualToString:@"3"])
                
            {
                
                NSLog(@"3");
                
                [appDel.savedSettings setObject:@"3" forKey:@"answer option"];
                
            }
            
            else if ([[_answers titleForSegmentAtIndex:_answers.selectedSegmentIndex] isEqualToString:@"4"])
                
            {
                
                NSLog(@"4");
                
                [appDel.savedSettings setObject:@"4" forKey:@"answer option"];
                
            }
            
            [appDel.savedSettings synchronize];
            
            break;
            
            
            
        case 5:
            
            if ([[_questionText titleForSegmentAtIndex:_questionText.selectedSegmentIndex] isEqualToString:@"on"])
                
            {
                
                [appDel.savedSettings setObject:@"on" forKey:@"question text"];
                
                
                
                //                if ([[_questionImage titleForSegmentAtIndex:_questionImage.selectedSegmentIndex] isEqualToString:@"on"])
                
                //                {
                
                //                    _questionText.selectedSegmentIndex=1;
                
                //                    [appDel.savedSettings setObject:@"off" forKey:@"question text"];
                
                //                }
                
                //                else if ([[_audio titleForSegmentAtIndex:_audio.selectedSegmentIndex] isEqualToString:@"off"])
                
                //                {
                
                //
                
                //                }
                
                
                
            }
            
            else
                
            {
                
                //                _questionImage.selectedSegmentIndex=0;
                
                //               [appDel.savedSettings setObject:@"on" forKey:@"question image"];
                
                
                
                if ([[_questionImage titleForSegmentAtIndex:_questionImage.selectedSegmentIndex] isEqualToString:@"off"])
                    
                {
                    
                    
                    
                    //   _audio.selectedSegmentIndex=0;
                    
                    //  [appDel.savedSettings setObject:@"on" forKey:@"audio"];
                    
                    
                    
                    
                    
                    
                    
                    if([[_audio titleForSegmentAtIndex:_audio.selectedSegmentIndex] isEqualToString:@"off"])
                        
                    {
                        
                        /* if (i==0)
                         
                         {
                         
                         _audio.selectedSegmentIndex=0;
                         
                         [appDel.savedSettings setObject:@"on" forKey:@"audio"];
                         
                         
                         
                         }
                         
                         else
                         
                         {
                         
                         _questionImage.selectedSegmentIndex=0;
                         
                         [appDel.savedSettings setObject:@"on" forKey:@"question image"];
                         
                         }
                         
                         
                         
                         */
                        
                        _audio.selectedSegmentIndex=0;
                        
                        [appDel.savedSettings setObject:@"on" forKey:@"audio"];
                        
                    }
                    
                    
                    
                }
                
                
                
                /* else if([[_audio titleForSegmentAtIndex:_audio.selectedSegmentIndex] isEqualToString:@"off"])
                 
                 {
                 
                 _questionImage.selectedSegmentIndex=0;
                 
                 [appDel.savedSettings setObject:@"on" forKey:@"question image"];
                 
                 }
                 
                 
                 
                 */
                
                
                
                [appDel.savedSettings setObject:@"off" forKey:@"question text"];
                
            }
            
            [appDel.savedSettings synchronize];
            
            break;
            
            
            
        case 6:
            
            if ([[_answerText titleForSegmentAtIndex:_answerText.selectedSegmentIndex] isEqualToString:@"on"]) {
                
                [appDel.savedSettings setObject:@"on" forKey:@"answer text"];
                
            }
            
            else
                
            {
                
                [appDel.savedSettings setObject:@"off" forKey:@"answer text"];
                
                
                
            }
            
            [appDel.savedSettings synchronize];
            
            break;
            
            
            
            
            
        case 7:
            
            if ([[_questionImage titleForSegmentAtIndex:_questionImage.selectedSegmentIndex] isEqualToString:@"on"]) {
                
                [appDel.savedSettings setObject:@"on" forKey:@"question image"];
                
                
                
            }
            
            else
                
            {
                
                
                
                if ([[_questionText titleForSegmentAtIndex:_questionText.selectedSegmentIndex] isEqualToString:@"off"])
                    
                {
                    
                    
                    
                    //  _audio.selectedSegmentIndex=0;
                    
                    //  [appDel.savedSettings setObject:@"on" forKey:@"audio"];
                    
                    
                    
                    
                    
                    if([[_audio titleForSegmentAtIndex:_audio.selectedSegmentIndex] isEqualToString:@"off"])
                        
                    {
                        
                        //  _questionText.selectedSegmentIndex=0;
                        
                        //   [appDel.savedSettings setObject:@"on" forKey:@"question text"];
                        
                        
                        
                        
                        
                        if (i==0)
                            
                        {
                            
                            _audio.selectedSegmentIndex=0;
                            
                            [appDel.savedSettings setObject:@"on" forKey:@"audio"];
                            
                            
                            
                        }
                        
                        else
                            
                        {
                            
                            _questionText.selectedSegmentIndex=0;
                            
                            [appDel.savedSettings setObject:@"on" forKey:@"question text"];
                            
                            
                            
                        }
                        
                        
                        
                        
                        
                        //                      _audio.selectedSegmentIndex=0;
                        
                        //                      [appDel.savedSettings setObject:@"on" forKey:@"audio"];
                        
                        
                        
                    }
                    
                }
                
                
                
                
                
                /*     else if([[_audio titleForSegmentAtIndex:_audio.selectedSegmentIndex] isEqualToString:@"off"])
                 
                 {
                 
                 _questionText.selectedSegmentIndex=0;
                 
                 [appDel.savedSettings setObject:@"on" forKey:@"question text"];
                 
                 
                 
                 }
                 
                 
                 
                 */
                
                [appDel.savedSettings setObject:@"off" forKey:@"question image"];
                
            }
            
            [appDel.savedSettings synchronize];
            
            
            
            
            
            break;
            
            
            
            
            
        default:
            
            break;
            
    }
    
    
    
}


- (IBAction)resetScore:(id)sender
{
    [self.fon del_records];
    [self.foff deleteRecord];
    
    self.lb1.text=@"-";
    self.lb2.text=@"-";
    self.lb3.text=@"-";
    self.lb4.text=@"-";
    self.lb5.text=@"-";
    self.lb6.text=@"-";
    self.lb7.text=@"-";
    self.lb8.text=@"-";
    self.lb9.text=@"-";
    self.lb10.text=@"-";
    self.lb11.text=@"-";
    self.lb12.text=@"-";
    self.lb13.text=@"-";
    self.lb14.text=@"-";
}

- (IBAction)BackBtn:(id)sender {
    if(appDel.i==1)
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else if (appDel.i==2)
    {
        [self.navigationController popToRootViewControllerAnimated:YES];

    }
    else if(appDel.i==3)
    {
        [self.navigationController popToRootViewControllerAnimated:YES];

    }
    else if (appDel.i==4)
    {
       [self.navigationController popToRootViewControllerAnimated:YES];
    }
    else if (appDel.i==5)
    {
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
}

- (IBAction)iphone5ProgressRportBtn:(id)sender
{
  OptionsPageVC *OptVc=[[OptionsPageVC alloc]initWithNibName:@"PgReport_iphone5" bundle:nil];
    [self.navigationController pushViewController:OptVc animated:YES];
}

- (IBAction)iphonePgReportBtn:(id)sender
{
   OptionsPageVC *OptVc=[[OptionsPageVC alloc]initWithNibName:@"PgReport_iphone" bundle:nil];
    [self.navigationController pushViewController:OptVc animated:YES];
}

- (IBAction)iphone6ProgressRportBtn:(id)sender
{
    OptionsPageVC *OptVc=[[OptionsPageVC alloc]initWithNibName:@"PgReport_iphone6" bundle:nil];
    [self.navigationController pushViewController:OptVc animated:YES];
  
}

- (IBAction)iphone6PlusProgressRportBtn:(id)sender
{
    OptionsPageVC *OptVc=[[OptionsPageVC alloc]initWithNibName:@"PgReport_iphone6plus" bundle:nil];
    [self.navigationController pushViewController:OptVc animated:YES];
}
@end
