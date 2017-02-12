//
//  QuestionsPageVC_ipad.m
//  Autism_Phonology
//
//  Created by Mindpace on 12/11/14.
//  Copyright (c) 2014 Mindpace. All rights reserved.
//

#import "QuestionsPageVC.h"

@interface QuestionsPageVC()
{
    NSMutableArray *shuffleArray;
    NSMutableArray *shuffleArray1;
    NSMutableArray *shuffleArray2;
    NSMutableArray *shuffleArray3;
    NSMutableArray *AnswerImageShuffleArray;
    NSMutableArray *fourImageCheckArray;
    NSMutableArray *shufleQuestionArray;
    NSMutableArray *shuffleImageTitleArray;
    NSMutableArray *shuffleImageArray;
    NSMutableArray *shuffleCountArray;
    
    NSDictionary *dictImagePos;
    NSString *imgstr;
    NSString *imgstr_grey1;
    NSString *imgstr_grey2;
    NSString *imgstr_grey3;
    NSString *imgstr_grey4;
    
    NSString *imgstr_red1;
    NSString *imgstr_red2;
    NSString *imgstr_red3;
    NSString *imgstr_red4;
    
    NSString *imgstr_green1;
    NSString *imgstr_green2;
    NSString *imgstr_green3;
    NSString *imgstr_green4;


    NSString *img_label1;
    NSString *img_label2;
    NSString *img_label3;
    NSString *img_label4;
    NSString *QuestionLabelText;
    int i;
    int l;
    int rnum;
    int count;
    int rand;
    NSInteger imgcount;
    int arrSelect;
    BOOL checkPail;
    BOOL checkYellow;
    BOOL rhymeA;
    BOOL rhymeAforAll;
    BOOL rhymeE;
    BOOL rhymeEforAll;
}

@end

@implementation QuestionsPageVC

@synthesize MenuBtnTag_ipad,MenuBtnTag_iphone,MenuBtnTag_iphone5,MenuBtnTag_iphone6,MenuBtnTag_iphone6plus,question_text,answer_text,dict_right_answer,right_image,wrong_image,grey_image,original_image,appDel,YesBtnTapped,correctAnswerFlag,answered,image_title,answerImagelabl_1,answerImagelabl_2,answerImagelabl_3,answerImagelabl_4,splayer,timer,QuestionImagelabl,QuestionLabl,question_labl_audio_Btn,QuestionImageView,SoundIcon,AnswerBtnImage1,AnswerBtnImage2,AnswerBtnImage3,AnswerBtnImage4,allQsArray,ipad_tryAgainView,iphone5_tryAgainView,iphone_tryAgainView,iphone6_tryAgainView,iphone6plus_tryAgainView,firstAttempt,AnswerBtnTapped,tryAgainYesBtn,FirstTime,AudioBtnclick,AnswerImageView1,AnswerImageView2,AnswerImageView3,AnswerImageView4,correctSound,wrongSound;

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
    appDel.savedSettings=[NSUserDefaults standardUserDefaults];
    
    self.correctAnswerFlag=NO;
    self.YesBtnTapped=NO;
    self.answered=NO;
    self.tryAgainYesBtn=NO;
    self.FirstTime=YES;
    
    self.correctSound=[[NSMutableArray alloc ]initWithObjects:@"excellent",@"great job",@"fantastic",@"way to go",@"you did it",@"terific", nil];
    self.wrongSound=[[NSMutableArray alloc ]initWithObjects:@"Try again",@"Ooops that's not it",@"Please pick another one", nil];
   
//    shuffleArray=[[NSMutableArray alloc]init];
   
   shuffleArray3=[[NSMutableArray alloc]initWithObjects:@"0",@"2",@"4",@"6",@"8",@"10",@"12",@"14",nil];
    
    shuffleArray2=[[NSMutableArray alloc]initWithObjects:@"1",@"3",@"5",@"7",@"9",@"11",@"13",@"15", nil];
    
    shuffleArray1=[[NSMutableArray alloc]initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50",@"51",@"52",@"53",@"54",@"55",@"56",@"57",@"58",@"59",@"60",@"61",@"62",@"63",@"64",@"65",@"66",@"67",@"68",@"69",@"70",@"71",@"72",@"73",@"74",@"75",@"76",@"77",@"78",@"79",@"80",@"81",@"82",@"83",@"84",@"85",@"86",@"87",@"88",@"89",@"90",@"91",@"92",@"93",@"94",@"95",@"96",@"97",@"98",@"99",@"100",@"101",@"102",@"103",@"104",@"105",nil];
  //  shuffleArray=[[NSMutableArray alloc]initWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",nil];
    
    UISwipeGestureRecognizer *swipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeNext)];
    [swipe setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipe];
    

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    i=0;
    imgcount=0;
    appDel.score=0;
    self.firstAttempt=YES;
    self.AnswerBtnTapped=NO;
    self.AudioBtnclick=NO;
    AnswerBtnImage1.userInteractionEnabled=YES;
    AnswerBtnImage2.userInteractionEnabled=YES;
    AnswerBtnImage3.userInteractionEnabled=YES;
    AnswerBtnImage4.userInteractionEnabled=YES;
    [allQsArray removeAllObjects];
    shufleQuestionArray=[[NSMutableArray alloc]init];
    shuffleImageTitleArray=[[NSMutableArray alloc]init];
    shuffleImageArray=[[NSMutableArray alloc]init];
    shuffleCountArray=[[NSMutableArray alloc]init];
    shuffleArray=[[NSMutableArray alloc]init];
    
    [AnswerBtnImage1 setExclusiveTouch:YES];
    [AnswerBtnImage2 setExclusiveTouch:YES];
    [AnswerBtnImage3 setExclusiveTouch:YES];
    [AnswerBtnImage4 setExclusiveTouch:YES];
    
    arrSelect=arc4random()%2;
    NSLog(@"arrselect:%d",arrSelect);
    
    if (arrSelect==0)
    {
        [shuffleArray addObjectsFromArray:shuffleArray2];
    }
    else
    {
       [shuffleArray addObjectsFromArray:shuffleArray3];
    }
    
    NSLog(@"*****shuffleArray*****:%@",shuffleArray);
    
    if ([[appDel.savedSettings objectForKey:@"random"] isEqualToString:@"on"] )
    {
        [self shuffle:shuffleArray];
        
        [self shuffle:shuffleArray1];
    }
    
    
    if ([[appDel.savedSettings objectForKey:@"question text"] isEqualToString:@"off"])
    {
        QuestionLabl.hidden=YES;
        QuestionImagelabl.hidden=YES;
        question_labl_audio_Btn.hidden=YES;
        if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"off"])
        {
            SoundIcon.hidden=YES;
            SoundIcon.userInteractionEnabled=NO;
        }
        else
        {
          SoundIcon.hidden=NO;
          SoundIcon.userInteractionEnabled=YES;
        }
    }
    else
    {
       // QuestionLabl.hidden=NO;
        QuestionImagelabl.hidden=NO;
        question_labl_audio_Btn.hidden=NO;
        SoundIcon.hidden=YES;
        SoundIcon.userInteractionEnabled=NO;
    }
   
    if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"4"])
    {
        AnswerBtnImage3.userInteractionEnabled=YES;
        AnswerBtnImage4.userInteractionEnabled=YES;
    }
    
    if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"3"])
    {
        if(appDel.i==1)
        {
           /////*********IPHONE5********/////
            AnswerBtnImage1.frame = CGRectMake( 110,26,85,94);
            AnswerBtnImage2.frame = CGRectMake( 240,26,85,94);
            AnswerBtnImage3.frame = CGRectMake( 370,26,85,94);
            AnswerImageView1.frame = CGRectMake( 110,26,85,94);
            AnswerImageView2.frame = CGRectMake( 240,26,85,94);
            AnswerImageView3.frame = CGRectMake( 370,26,85,94);
            answerImagelabl_1.frame=CGRectMake(107, 124, 90, 24);
            answerImagelabl_2.frame=CGRectMake(240, 124, 90, 24);
            answerImagelabl_3.frame=CGRectMake(365, 124, 90, 24);
        }
        
        /////*********IPHONE********/////
        if (appDel.i==2) {
            AnswerBtnImage1.frame = CGRectMake( 70,24,87,90);
            AnswerBtnImage2.frame = CGRectMake( 195,24,87,90);
            AnswerBtnImage3.frame = CGRectMake( 320,24,87,90);
            AnswerImageView1.frame = CGRectMake( 70,24,87,90);
            AnswerImageView2.frame = CGRectMake( 195,24,87,90);
            AnswerImageView3.frame = CGRectMake( 320,24,87,90);
            answerImagelabl_1.frame=CGRectMake(70, 115, 90, 23);
            answerImagelabl_2.frame=CGRectMake(195, 115, 90, 23);
            answerImagelabl_3.frame=CGRectMake(317, 115, 90, 23);
        }
        
        /////*********IPAD********/////
        if (appDel.i==3) {
            AnswerBtnImage1.frame = CGRectMake( 175,155,183,196);
            AnswerBtnImage2.frame = CGRectMake( 430,155,183,196);
            AnswerBtnImage3.frame = CGRectMake( 680,155,183,196);
            AnswerImageView1.frame = CGRectMake( 175,155,183,196);
            AnswerImageView2.frame = CGRectMake( 430,155,183,196);
            AnswerImageView3.frame = CGRectMake( 680,155,183,196);
            answerImagelabl_1.frame=CGRectMake(172, 350, 194, 39);
            answerImagelabl_2.frame=CGRectMake(430, 350, 194, 39);
            answerImagelabl_3.frame=CGRectMake(680, 350, 194, 39);
        }
        
        /////*********IPHONE6********/////
        if (appDel.i==4) {
            AnswerBtnImage1.frame = CGRectMake( 113,24,126,146);
            AnswerBtnImage2.frame = CGRectMake( 275,24,126,146);
            AnswerBtnImage3.frame = CGRectMake( 437,24,126,126);
            AnswerImageView1.frame = CGRectMake( 113,24,126,146);
            AnswerImageView2.frame = CGRectMake( 275,24,126,146);
            AnswerImageView3.frame = CGRectMake( 437,24,126,146);
            answerImagelabl_1.frame=CGRectMake(113, 170, 126, 24);
            answerImagelabl_2.frame=CGRectMake(275, 170, 126, 24);
            answerImagelabl_3.frame=CGRectMake(437, 170, 126, 24);
        }
        
        /////*********IPHONE6plus********/////
        if (appDel.i==5) {
            AnswerBtnImage1.frame = CGRectMake( 143,30,135,155);
            AnswerBtnImage2.frame = CGRectMake( 307,30,135,155);
            AnswerBtnImage3.frame = CGRectMake( 475,30,135,155);
            AnswerImageView1.frame = CGRectMake( 143,30,135,155);
            AnswerImageView2.frame = CGRectMake( 307,30,135,155);
            AnswerImageView3.frame = CGRectMake( 475,30,135,155);
            answerImagelabl_1.frame=CGRectMake(143, 192, 135, 24);
            answerImagelabl_2.frame=CGRectMake(307, 192, 135, 24);
            answerImagelabl_3.frame=CGRectMake(475, 192, 135, 24);
        }

        AnswerBtnImage4.userInteractionEnabled=NO;
    }
    
    if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"2"])
    {
       ///////********IPHONE5*******///////
        if(appDel.i==1)
        {
            AnswerBtnImage1.frame = CGRectMake( 165,26,85 ,94);
            AnswerBtnImage2.frame = CGRectMake( 320,26,85,94);
            AnswerImageView1.frame = CGRectMake( 160,26,85,94);
            AnswerImageView2.frame = CGRectMake( 320,26,85,94);
            answerImagelabl_1.frame=CGRectMake(158, 120, 90, 24);
            answerImagelabl_2.frame=CGRectMake(319, 120, 90, 24);

        }
        
        ///////********IPHONE*******///////
        if (appDel.i==2)
        {
            AnswerBtnImage1.frame = CGRectMake( 120,24,87,90);
            AnswerBtnImage2.frame = CGRectMake( 280,24,87,90);
            AnswerImageView1.frame = CGRectMake( 120,24,87,90);
            AnswerImageView2.frame = CGRectMake( 280,24,87,90);
            answerImagelabl_1.frame=CGRectMake(119, 115, 90, 23);
            answerImagelabl_2.frame=CGRectMake(278, 115, 90, 23);

        }
        
        ///////********IPAD*******///////
        if (appDel.i==3)
        {
            AnswerBtnImage1.frame = CGRectMake( 297,155,183,196);
            AnswerBtnImage2.frame = CGRectMake( 570,155,183,196);
            AnswerImageView1.frame = CGRectMake( 297,155,189,196);
            AnswerImageView2.frame = CGRectMake( 570,155,189,196);
            answerImagelabl_1.frame=CGRectMake(297, 350, 194, 39);
            answerImagelabl_2.frame=CGRectMake(570, 350, 194, 39);

 
        }
        
        ///////********IPHONE6*******///////
        if (appDel.i==4)
        {
            AnswerBtnImage1.frame = CGRectMake( 194,24,126,146);
            AnswerBtnImage2.frame = CGRectMake( 350,24,126,146);
            AnswerImageView1.frame = CGRectMake( 194,24,126,146);
            AnswerImageView2.frame = CGRectMake( 350,24,126,146);
            answerImagelabl_1.frame=CGRectMake(194, 170, 126, 24);
            answerImagelabl_2.frame=CGRectMake(350,170 , 126, 24);
            
            
        }
        
        ///////********IPHONE6PLUS*******///////
        if (appDel.i==5)
        {
            AnswerBtnImage1.frame = CGRectMake( 223,30,135,155);
            AnswerBtnImage2.frame = CGRectMake( 384,30,135,155);
            AnswerImageView1.frame = CGRectMake( 223,30,135,155);
            AnswerImageView2.frame = CGRectMake( 384,30,135,155);
            answerImagelabl_1.frame=CGRectMake(223, 197, 135, 24);
            answerImagelabl_2.frame=CGRectMake(384,197 , 135, 24);
            
            
        }

        
        AnswerBtnImage3.userInteractionEnabled=NO;
        AnswerBtnImage4.userInteractionEnabled=NO;
    }
    
    if (appDel.i==1)
    {
        iphone5_tryAgainView.hidden=YES;
    }
    if (appDel.i==2)
    {
        iphone_tryAgainView.hidden=YES;
    }
    if(appDel.i==3)
    {
        ipad_tryAgainView.hidden=YES;
    }
    if(appDel.i==4)
    {
        iphone6_tryAgainView.hidden=YES;
    }
    if (appDel.i==5)
    {
        iphone6plus_tryAgainView.hidden=YES;
    }
    
    [self callMe];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    
    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"])
    {
        self.FirstTime=NO;
        
      // [self playAudio:QuestionImagelabl.text with:0];
       // [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
        
       [self playAudio:QuestionLabl.text with:0];
    }
}


-(void)callMe
{
   ////////******IPHONE5******////////
    
  if (appDel.i==1)
  {
    if([MenuBtnTag_iphone5 isEqualToString:[NSString stringWithFormat:@"rhyming words set a"]])
      {
          rhymeA=true;
          
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with cat?",@"what rhymes with hat?",@"what rhymes with clock?",@"what rhymes with block?",@"what rhymes with bed?",@"what rhymes with bread?",@"what rhymes with blue?",@"what rhymes with shoe?",@"what rhymes with corn?",@"what rhymes with horn?",@"what rhymes with chair?",@"what rhymes with bear?",@"what rhymes with dog?",@"what rhymes with frog?",@"what rhymes with pail?",@"what rhymes with snail?",nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"hat",@"cat",@"block",@"clock",@"bread",@"bed",@"shoe",@"blue",@"horn",@"corn",@"bear",@"chair",@"frog",@"dog",@"snail",@"pail",nil];
          
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_grey_1",@"phonology_iphone_set1_grey_2",@"phonology_iphone_set1_grey_3",@"phonology_iphone_set1_grey_4",@"phonology_iphone_set1_grey_5",@"phonology_iphone_set1_grey_6",@"phonology_iphone_set1_grey_7",@"phonology_iphone_set1_grey_8",@"phonology_iphone_set1_grey_9",@"phonology_iphone_set1_grey_10",@"phonology_iphone_set1_grey_11",@"phonology_iphone_set1_grey_12",@"phonology_iphone_set1_grey_13",@"phonology_iphone_set1_grey_14",@"phonology_iphone_set1_grey_15",@"phonology_iphone_set1_grey_16", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set1_original_1",@"phonology_iphone_set1_original_2",@"phonology_iphone_set1_original_3",@"phonology_iphone_set1_original_4",@"phonology_iphone_set1_original_5",@"phonology_iphone_set1_original_6",@"phonology_iphone_set1_original_7",@"phonology_iphone_set1_original_8",@"phonology_iphone_set1_original_9",@"phonology_iphone_set1_original_10",@"phonology_iphone_set1_original_11",@"phonology_iphone_set1_original_12",@"phonology_iphone_set1_original_13",@"phonology_iphone_set1_original_14",@"phonology_iphone_set1_original_15",@"phonology_iphone_set1_original_16", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_green_1",@"phonology_iphone_set1_green_2",@"phonology_iphone_set1_green_3",@"phonology_iphone_set1_green_4",@"phonology_iphone_set1_green_5",@"phonology_iphone_set1_green_6",@"phonology_iphone_set1_green_7",@"phonology_iphone_set1_green_8",@"phonology_iphone_set1_green_9",@"phonology_iphone_set1_green_10",@"phonology_iphone_set1_green_11",@"phonology_iphone_set1_green_12",@"phonology_iphone_set1_green_13",@"phonology_iphone_set1_green_14",@"phonology_iphone_set1_green_15",@"phonology_iphone_set1_green_16", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_red_1",@"phonology_iphone_set1_red_2",@"phonology_iphone_set1_red_3",@"phonology_iphone_set1_red_4",@"phonology_iphone_set1_red_5",@"phonology_iphone_set1_red_6",@"phonology_iphone_set1_red_7",@"phonology_iphone_set1_red_8",@"phonology_iphone_set1_red_9",@"phonology_iphone_set1_red_10",@"phonology_iphone_set1_red_11",@"phonology_iphone_set1_red_12",@"phonology_iphone_set1_red_13",@"phonology_iphone_set1_red_14",@"phonology_iphone_set1_red_15",@"phonology_iphone_set1_red_16", nil];
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15"]];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"cat",@"hat",@"clock",@"block",@"bed",@"bread",@"blue",@"shoe",@"corn",@"horn",@"chair",@"bear",@"dog",@"frog",@"pail",@"snail", nil];
          [self loadQuestions];
          
     }
    
    else if([MenuBtnTag_iphone5 isEqualToString:[NSString stringWithFormat:@"rhyming words set b"]])
    {
        self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with crown?",@"what rhymes with clown?",@"what rhymes with shell?",@"what rhymes with bell?",@"what rhymes with flag?",@"what rhymes with bag?",@"what rhymes with pie?",@"what rhymes with tie?",@"what rhymes with basket?",@"what rhymes with blanket?",@"what rhymes with moon?",@"what rhymes with spoon?",@"what rhymes with tree?",@"what rhymes with bee?",@"what rhymes with coat?",@"what rhymes with boat?",@"what rhymes with boots?",@"what rhymes with fruits?",nil];
        
        self.answer_text=[[NSMutableArray alloc]initWithObjects:@"clown",@"crown",@"bell",@"shell",@"bag",@"flag",@"tie",@"pie",@"blanket",@"basket",@"spoon",@"moon",@"bee",@"tree",@"boat",@"coat",@"fruits",@"boots",nil];
        self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
        
        self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set2_grey_1",@"phonology_iphone_set2_grey_2",@"phonology_iphone_set2_grey_3",@"phonology_iphone_set2_grey_4",@"phonology_iphone_set2_grey_5",@"phonology_iphone_set2_grey_6",@"phonology_iphone_set2_grey_7",@"phonology_iphone_set2_grey_8",@"phonology_iphone_set2_grey_9",@"phonology_iphone_set2_grey_10",@"phonology_iphone_set2_grey_11",@"phonology_iphone_set2_grey_12",@"phonology_iphone_set2_grey_13",@"phonology_iphone_set2_grey_14",@"phonology_iphone_set2_grey_15",@"phonology_iphone_set2_grey_16",@"phonology_iphone_set2_grey_17",@"phonology_iphone_set2_grey_18", nil];
        
        self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set2_original_1",@"phonology_iphone_set2_original_2",@"phonology_iphone_set2_original_3",@"phonology_iphone_set2_original_4",@"phonology_iphone_set2_original_5",@"phonology_iphone_set2_original_6",@"phonology_iphone_set2_original_7",@"phonology_iphone_set2_original_8",@"phonology_iphone_set2_original_9",@"phonology_iphone_set2_original_10",@"phonology_iphone_set2_original_11",@"phonology_iphone_set2_original_12",@"phonology_iphone_set2_original_13",@"phonology_iphone_set2_original_14",@"phonology_iphone_set2_original_15",@"phonology_iphone_set2_original_16",@"phonology_iphone_set2_original_17",@"phonology_iphone_set2_original_18", nil];
        
        self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set2_green_1",@"phonology_iphone_set2_green_2",@"phonology_iphone_set2_green_3",@"phonology_iphone_set2_green_4",@"phonology_iphone_set2_green_5",@"phonology_iphone_set2_green_6",@"phonology_iphone_set2_green_7",@"phonology_iphone_set2_green_8",@"phonology_iphone_set2_green_9",@"phonology_iphone_set2_green_10",@"phonology_iphone_set2_green_11",@"phonology_iphone_set2_green_12",@"phonology_iphone_set2_green_13",@"phonology_iphone_set2_green_14",@"phonology_iphone_set2_green_15",@"phonology_iphone_set2_green_16",@"phonology_iphone_set2_green_17",@"phonology_iphone_set2_green_18", nil];
        
        self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set2_red_1",@"phonology_iphone_set2_red_2",@"phonology_iphone_set2_red_3",@"phonology_iphone_set2_red_4",@"phonology_iphone_set2_red_5",@"phonology_iphone_set2_red_6",@"phonology_iphone_set2_red_7",@"phonology_iphone_set2_red_8",@"phonology_iphone_set2_red_9",@"phonology_iphone_set2_red_10",@"phonology_iphone_set2_red_11",@"phonology_iphone_set2_red_12",@"phonology_iphone_set2_red_13",@"phonology_iphone_set2_red_14",@"phonology_iphone_set2_red_15",@"phonology_iphone_set2_red_16",@"phonology_iphone_set2_red_17",@"phonology_iphone_set2_red_18", nil];
        
        dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
        
        self.image_title=[[NSMutableArray alloc]initWithObjects:@"crown",@"clown",@"shell",@"bell",@"flag",@"bag",@"pie",@"tie",@"basket",@"blanket",@"moon",@"spoon",@"tree",@"bee",@"coat",@"boat",@"boots",@"fruits", nil];
        [self loadQuestions];
    }
      
    else if([MenuBtnTag_iphone5 isEqualToString:[NSString stringWithFormat:@"rhyming words set c"]])
    {
        self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with ice?",@"what rhymes with rice?",@"what rhymes with van?",@"what rhymes with pan?",@"what rhymes with glad?",@"what rhymes with sad?",@"what rhymes with rug?",@"what rhymes with mug?",@"what rhymes with cone?",@"what rhymes with telephone?",@"what rhymes with sink?",@"what rhymes with pink?",@"what rhymes with airplane?",@"what rhymes with train?",@"what rhymes with duck?",@"what rhymes with truck?",@"what rhymes with nest?",@"what rhymes with chest?",nil];
        
        self.answer_text=[[NSMutableArray alloc]initWithObjects:@"rice",@"ice",@"pan",@"van",@"sad",@"glad",@"mug",@"rug",@"telephone",@"cone",@"pink",@"sink",@"train",@"airplane",@"truck",@"duck",@"chest",@"nest",nil];
        
        self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
        
        self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set3_grey_1",@"phonology_iphone_set3_grey_2",@"phonology_iphone_set3_grey_3",@"phonology_iphone_set3_grey_4",@"phonology_iphone_set3_grey_5",@"phonology_iphone_set3_grey_6",@"phonology_iphone_set3_grey_7",@"phonology_iphone_set3_grey_8",@"phonology_iphone_set3_grey_9",@"phonology_iphone_set3_grey_10",@"phonology_iphone_set3_grey_11",@"phonology_iphone_set3_grey_12",@"phonology_iphone_set3_grey_13",@"phonology_iphone_set3_grey_14",@"phonology_iphone_set3_grey_15",@"phonology_iphone_set3_grey_16",@"phonology_iphone_set3_grey_17",@"phonology_iphone_set3_grey_18", nil];
        
        self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set3_original_1",@"phonology_iphone_set3_original_2",@"phonology_iphone_set3_original_3",@"phonology_iphone_set3_original_4",@"phonology_iphone_set3_original_5",@"phonology_iphone_set3_original_6",@"phonology_iphone_set3_original_7",@"phonology_iphone_set3_original_8",@"phonology_iphone_set3_original_9",@"phonology_iphone_set3_original_10",@"phonology_iphone_set3_original_11",@"phonology_iphone_set3_original_12",@"phonology_iphone_set3_original_13",@"phonology_iphone_set3_original_14",@"phonology_iphone_set3_original_15",@"phonology_iphone_set3_original_16",@"phonology_iphone_set3_original_17",@"phonology_iphone_set3_original_18", nil];
        
        self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set3_green_1",@"phonology_iphone_set3_green_2",@"phonology_iphone_set3_green_3",@"phonology_iphone_set3_green_4",@"phonology_iphone_set3_green_5",@"phonology_iphone_set3_green_6",@"phonology_iphone_set3_green_7",@"phonology_iphone_set3_green_8",@"phonology_iphone_set3_green_9",@"phonology_iphone_set3_green_10",@"phonology_iphone_set3_green_11",@"phonology_iphone_set3_green_12",@"phonology_iphone_set3_green_13",@"phonology_iphone_set3_green_14",@"phonology_iphone_set3_green_15",@"phonology_iphone_set3_green_16",@"phonology_iphone_set3_green_17",@"phonology_iphone_set3_green_18", nil];
        
        self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set3_red_1",@"phonology_iphone_set3_red_2",@"phonology_iphone_set3_red_3",@"phonology_iphone_set3_red_4",@"phonology_iphone_set3_red_5",@"phonology_iphone_set3_red_6",@"phonology_iphone_set3_red_7",@"phonology_iphone_set3_red_8",@"phonology_iphone_set3_red_9",@"phonology_iphone_set3_red_10",@"phonology_iphone_set3_red_11",@"phonology_iphone_set3_red_12",@"phonology_iphone_set3_red_13",@"phonology_iphone_set3_red_14",@"phonology_iphone_set3_red_15",@"phonology_iphone_set3_red_16",@"phonology_iphone_set3_red_17",@"phonology_iphone_set3_red_18", nil];
        
        dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
        
        self.image_title=[[NSMutableArray alloc]initWithObjects:@"ice",@"rice",@"van",@"pan",@"glad",@"sad",@"rug",@"mug",@"cone",@"telephone",@"sink",@"pink",@"airplane",@"train",@"duck",@"truck",@"nest",@"chest", nil];
        
        [self loadQuestions];
        
    }
  
    else if([MenuBtnTag_iphone5 isEqualToString:[NSString stringWithFormat:@"rhyming words set d"]])
    {
        self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with juice?",@"what rhymes with goose?",@"what rhymes with door?",@"what rhymes with four?",@"what rhymes with swing?",@"what rhymes with ring?",@"what rhymes with nose?",@"what rhymes with hose?",@"what rhymes with fire?",@"what rhymes with tire?",@"what rhymes with stamp?",@"what rhymes with lamp?",@"what rhymes with can?",@"what rhymes with fan?",@"what rhymes with otter?",@"what rhymes with water?",@"what rhymes with pot?",@"what rhymes with knot?",nil];
        
        self.answer_text=[[NSMutableArray alloc]initWithObjects:@"goose",@"juice",@"four",@"door",@"ring",@"swing",@"hose",@"nose",@"tire",@"fire",@"lamp",@"stamp",@"fan",@"can",@"water",@"otter",@"knot",@"pot",nil];
        
        self.image_title=[[NSMutableArray alloc]initWithObjects:@"juice",@"goose",@"door",@"four",@"swing",@"ring",@"nose",@"hose",@"fire",@"tire",@"stamp",@"lamp",@"can",@"fan",@"otter",@"water",@"pot",@"knot", nil];
        
        self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
        
        self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set4_grey_1",@"phonology_iphone_set4_grey_2",@"phonology_iphone_set4_grey_3",@"phonology_iphone_set4_grey_4",@"phonology_iphone_set4_grey_5",@"phonology_iphone_set4_grey_6",@"phonology_iphone_set4_grey_7",@"phonology_iphone_set4_grey_8",@"phonology_iphone_set4_grey_9",@"phonology_iphone_set4_grey_10",@"phonology_iphone_set4_grey_11",@"phonology_iphone_set4_grey_12",@"phonology_iphone_set4_grey_13",@"phonology_iphone_set4_grey_14",@"phonology_iphone_set4_grey_15",@"phonology_iphone_set4_grey_16",@"phonology_iphone_set4_grey_17",@"phonology_iphone_set4_grey_18", nil];
        
        self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set4_original_1",@"phonology_iphone_set4_original_2",@"phonology_iphone_set4_original_3",@"phonology_iphone_set4_original_4",@"phonology_iphone_set4_original_5",@"phonology_iphone_set4_original_6",@"phonology_iphone_set4_original_7",@"phonology_iphone_set4_original_8",@"phonology_iphone_set4_original_9",@"phonology_iphone_set4_original_10",@"phonology_iphone_set4_original_11",@"phonology_iphone_set4_original_12",@"phonology_iphone_set4_original_13",@"phonology_iphone_set4_original_14",@"phonology_iphone_set4_original_15",@"phonology_iphone_set4_original_16",@"phonology_iphone_set4_original_17",@"phonology_iphone_set4_original_18", nil];
        
        self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set4_green_1",@"phonology_iphone_set4_green_2",@"phonology_iphone_set4_green_3",@"phonology_iphone_set4_green_4",@"phonology_iphone_set4_green_5",@"phonology_iphone_set4_green_6",@"phonology_iphone_set4_green_7",@"phonology_iphone_set4_green_8",@"phonology_iphone_set4_green_9",@"phonology_iphone_set4_green_10",@"phonology_iphone_set4_green_11",@"phonology_iphone_set4_green_12",@"phonology_iphone_set4_green_13",@"phonology_iphone_set4_green_14",@"phonology_iphone_set4_green_15",@"phonology_iphone_set4_green_16",@"phonology_iphone_set4_green_17",@"phonology_iphone_set4_green_18", nil];
        
        self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set4_red_1",@"phonology_iphone_set4_red_2",@"phonology_iphone_set4_red_3",@"phonology_iphone_set4_red_4",@"phonology_iphone_set4_red_5",@"phonology_iphone_set4_red_6",@"phonology_iphone_set4_red_7",@"phonology_iphone_set4_red_8",@"phonology_iphone_set4_red_9",@"phonology_iphone_set4_red_10",@"phonology_iphone_set4_red_11",@"phonology_iphone_set4_red_12",@"phonology_iphone_set4_red_13",@"phonology_iphone_set4_red_14",@"phonology_iphone_set4_red_15",@"phonology_iphone_set4_red_16",@"phonology_iphone_set4_red_17",@"phonology_iphone_set4_red_18", nil];
        
        dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
        
        [self loadQuestions];
    }
    
    else if([MenuBtnTag_iphone5 isEqualToString:[NSString stringWithFormat:@"rhyming words set e"]])
    {
        rhymeE=true;
        
        self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with jar?",@"what rhymes with guitar?",@"what rhymes with pillow?",@"what rhymes with yellow?",@"what rhymes with red?",@"what rhymes with sled?",@"what rhymes with monkey?",@"what rhymes with donkey?",@"what rhymes with fish?",@"what rhymes with dish?",@"what rhymes with kite?",@"what rhymes with white?",@"what rhymes with rake?",@"what rhymes with cake?",@"what rhymes with doll?",@"what rhymes with ball?",@"what rhymes with carrot?",@"what rhymes with parrot?",nil];
        
        self.answer_text=[[NSMutableArray alloc]initWithObjects:@"guitar",@"jar",@"yellow",@"pillow",@"sled",@"red",@"donkey",@"monkey",@"dish",@"fish",@"white",@"kite",@"cake",@"rake",@"ball",@"doll",@"parrot",@"carrot",nil];
        
        self.image_title=[[NSMutableArray alloc]initWithObjects:@"jar",@"guitar",@"pillow",@"yellow",@"red",@"sled",@"monkey",@"donkey",@"fish",@"dish",@"kite",@"white",@"rake",@"cake",@"doll",@"ball",@"carrot",@"parrot", nil];
        
        self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
        
        self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set5_grey_1",@"phonology_iphone_set5_grey_2",@"phonology_iphone_set5_grey_3",@"phonology_iphone_set5_grey_4",@"phonology_iphone_set5_grey_5",@"phonology_iphone_set5_grey_6",@"phonology_iphone_set5_grey_7",@"phonology_iphone_set5_grey_8",@"phonology_iphone_set5_grey_9",@"phonology_iphone_set5_grey_10",@"phonology_iphone_set5_grey_11",@"phonology_iphone_set5_grey_12",@"phonology_iphone_set5_grey_13",@"phonology_iphone_set5_grey_14",@"phonology_iphone_set5_grey_15",@"phonology_iphone_set5_grey_16",@"phonology_iphone_set5_grey_17",@"phonology_iphone_set5_grey_18", nil];
        
        self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set5_original_1",@"phonology_iphone_set5_original_2",@"phonology_iphone_set5_original_3",@"phonology_iphone_set5_original_4",@"phonology_iphone_set5_original_5",@"phonology_iphone_set5_original_6",@"phonology_iphone_set5_original_7",@"phonology_iphone_set5_original_8",@"phonology_iphone_set5_original_9",@"phonology_iphone_set5_original_10",@"phonology_iphone_set5_original_11",@"phonology_iphone_set5_original_12",@"phonology_iphone_set5_original_13",@"phonology_iphone_set5_original_14",@"phonology_iphone_set5_original_15",@"phonology_iphone_set5_original_16",@"phonology_iphone_set5_original_17",@"phonology_iphone_set5_original_18", nil];
        
        self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set5_green_1",@"phonology_iphone_set5_green_2",@"phonology_iphone_set5_green_3",@"phonology_iphone_set5_green_4",@"phonology_iphone_set5_green_5",@"phonology_iphone_set5_green_6",@"phonology_iphone_set5_green_7",@"phonology_iphone_set5_green_8",@"phonology_iphone_set5_green_9",@"phonology_iphone_set5_green_10",@"phonology_iphone_set5_green_11",@"phonology_iphone_set5_green_12",@"phonology_iphone_set5_green_13",@"phonology_iphone_set5_green_14",@"phonology_iphone_set5_green_15",@"phonology_iphone_set5_green_16",@"phonology_iphone_set5_green_17",@"phonology_iphone_set5_green_18", nil];
        
        self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set5_red_1",@"phonology_iphone_set5_red_2",@"phonology_iphone_set5_red_3",@"phonology_iphone_set5_red_4",@"phonology_iphone_set5_red_5",@"phonology_iphone_set5_red_6",@"phonology_iphone_set5_red_7",@"phonology_iphone_set5_red_8",@"phonology_iphone_set5_red_9",@"phonology_iphone_set5_red_10",@"phonology_iphone_set5_red_11",@"phonology_iphone_set5_red_12",@"phonology_iphone_set5_red_13",@"phonology_iphone_set5_red_14",@"phonology_iphone_set5_red_15",@"phonology_iphone_set5_red_16",@"phonology_iphone_set5_red_17",@"phonology_iphone_set5_red_18", nil];
        
        dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
        
        [self loadQuestions];
    }
  
    else if([MenuBtnTag_iphone5 isEqualToString:[NSString stringWithFormat:@"rhyming words set f"]])
    {
        self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with fox?",@"what rhymes with box?",@"what rhymes with hen?",@"what rhymes with pen?",@"what rhymes with pizza?",@"what rhymes with zebra?",@"what rhymes with helmet?",@"what rhymes with  blanket?",@"what rhymes with soap?",@"what rhymes with rope?",@"what rhymes with green?",@"what rhymes with thirteen?",@"what rhymes with stool?",@"what rhymes with pool?",@"what rhymes with car?",@"what rhymes with star?",@"what rhymes with three?",@"what rhymes with key?",nil];
        
        self.answer_text=[[NSMutableArray alloc]initWithObjects:@"box",@"fox",@"pen",@"hen",@"zebra",@"pizza",@" blanket",@"helmet",@"rope",@"soap",@"thirteen",@"green",@"pool",@"stool",@"star",@"car",@"key",@"three",nil];
        
        self.image_title=[[NSMutableArray alloc]initWithObjects:@"fox",@"box",@"hen",@"pen",@"pizza",@"zebra",@"helmet",@" blanket",@"soap",@"rope",@"green",@"thirteen",@"stool",@"pool",@"car",@"star",@"three", @"key",nil];
        
        self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
        
        self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set6_grey_1",@"phonology_iphone_set6_grey_2",@"phonology_iphone_set6_grey_3",@"phonology_iphone_set6_grey_4",@"phonology_iphone_set6_grey_5",@"phonology_iphone_set6_grey_6",@"phonology_iphone_set6_grey_7",@"phonology_iphone_set6_grey_8",@"phonology_iphone_set6_grey_9",@"phonology_iphone_set6_grey_10",@"phonology_iphone_set6_grey_11",@"phonology_iphone_set6_grey_12",@"phonology_iphone_set6_grey_13",@"phonology_iphone_set6_grey_14",@"phonology_iphone_set6_grey_15",@"phonology_iphone_set6_grey_16",@"phonology_iphone_set6_grey_17",@"phonology_iphone_set6_grey_18", nil];
        
        self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set6_original_1",@"phonology_iphone_set6_original_2",@"phonology_iphone_set6_original_3",@"phonology_iphone_set6_original_4",@"phonology_iphone_set6_original_5",@"phonology_iphone_set6_original_6",@"phonology_iphone_set6_original_7",@"phonology_iphone_set6_original_8",@"phonology_iphone_set6_original_9",@"phonology_iphone_set6_original_10",@"phonology_iphone_set6_original_11",@"phonology_iphone_set6_original_12",@"phonology_iphone_set6_original_13",@"phonology_iphone_set6_original_14",@"phonology_iphone_set6_original_15",@"phonology_iphone_set6_original_16",@"phonology_iphone_set6_original_17",@"phonology_iphone_set6_original_18", nil];
        
        self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set6_green_1",@"phonology_iphone_set6_green_2",@"phonology_iphone_set6_green_3",@"phonology_iphone_set6_green_4",@"phonology_iphone_set6_green_5",@"phonology_iphone_set6_green_6",@"phonology_iphone_set6_green_7",@"phonology_iphone_set6_green_8",@"phonology_iphone_set6_green_9",@"phonology_iphone_set6_green_10",@"phonology_iphone_set6_green_11",@"phonology_iphone_set6_green_12",@"phonology_iphone_set6_green_13",@"phonology_iphone_set6_green_14",@"phonology_iphone_set6_green_15",@"phonology_iphone_set6_green_16",@"phonology_iphone_set6_green_17",@"phonology_iphone_set6_green_18", nil];
        
        self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set6_red_1",@"phonology_iphone_set6_red_2",@"phonology_iphone_set6_red_3",@"phonology_iphone_set6_red_4",@"phonology_iphone_set6_red_5",@"phonology_iphone_set6_red_6",@"phonology_iphone_set6_red_7",@"phonology_iphone_set6_red_8",@"phonology_iphone_set6_red_9",@"phonology_iphone_set6_red_10",@"phonology_iphone_set6_red_11",@"phonology_iphone_set6_red_12",@"phonology_iphone_set6_red_13",@"phonology_iphone_set6_red_14",@"phonology_iphone_set6_red_15",@"phonology_iphone_set6_red_16",@"phonology_iphone_set6_red_17",@"phonology_iphone_set6_red_18", nil];
        
        dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
        
        [self loadQuestions];
    }
  
    else if([MenuBtnTag_iphone5 isEqualToString:[NSString stringWithFormat:@"all rhyming words"]])
    {
        
        rhymeAforAll=true;
        
        rhymeEforAll=true;
        
        self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with cat?",@"what rhymes with hat?",@"what rhymes with clock?",@"what rhymes with block?",@"what rhymes with bed?",@"what rhymes with bread?",@"what rhymes with blue?",@"what rhymes with shoe?",@"what rhymes with corn?",@"what rhymes with horn?",@"what rhymes with chair?",@"what rhymes with bear?",@"what rhymes with dog?",@"what rhymes with frog?",@"what rhymes with pail?",@"what rhymes with snail?",@"what rhymes with crown?",@"what rhymes with clown?",@"what rhymes with shell?",@"what rhymes with bell?",@"what rhymes with flag?",@"what rhymes with bag?",@"what rhymes with pie?",@"what rhymes with tie?",@"what rhymes with basket?",@"what rhymes with blanket?",@"what rhymes with moon?",@"what rhymes with spoon?",@"what rhymes with tree?",@"what rhymes with bee?",@"what rhymes with coat?",@"what rhymes with boat?",@"what rhymes with boots?",@"what rhymes with fruits?",@"what rhymes with ice?",@"what rhymes with rice?",@"what rhymes with van?",@"what rhymes with pan?",@"what rhymes with glad?",@"what rhymes with sad?",@"what rhymes with rug?",@"what rhymes with mug?",@"what rhymes with cone?",@"what rhymes with telephone?",@"what rhymes with sink?",@"what rhymes with pink?",@"what rhymes with airplane?",@"what rhymes with train?",@"what rhymes with duck?",@"what rhymes with truck?",@"what rhymes with nest?",@"what rhymes with chest?",@"what rhymes with juice?",@"what rhymes with goose?",@"what rhymes with door?",@"what rhymes with four?",@"what rhymes with swing?",@"what rhymes with ring?",@"what rhymes with nose?",@"what rhymes with hose?",@"what rhymes with fire?",@"what rhymes with tire?",@"what rhymes with stamp?",@"what rhymes with lamp?",@"what rhymes with can?",@"what rhymes with fan?",@"what rhymes with otter?",@"what rhymes with water?",@"what rhymes with pot?",@"what rhymes with knot?",@"what rhymes with jar?",@"what rhymes with guitar?",@"what rhymes with pillow?",@"what rhymes with yellow?",@"what rhymes with red?",@"what rhymes with sled?",@"what rhymes with monkey?",@"what rhymes with donkey?",@"what rhymes with fish?",@"what rhymes with dish?",@"what rhymes with kite?",@"what rhymes with white?",@"what rhymes with rake?",@"what rhymes with cake?",@"what rhymes with doll?",@"what rhymes with ball?",@"what rhymes with carrot?",@"what rhymes with parrot?",@"what rhymes with fox?",@"what rhymes with box?",@"what rhymes with hen?",@"what rhymes with pen?",@"what rhymes with pizza?",@"what rhymes with zebra?",@"what rhymes with helmet?",@"what rhymes with  blanket?",@"what rhymes with soap?",@"what rhymes with rope?",@"what rhymes with green?",@"what rhymes with thirteen?",@"what rhymes with stool?",@"what rhymes with pool?",@"what rhymes with car?",@"what rhymes with star?",@"what rhymes with three?",@"what rhymes with key?", nil];
        
        self.answer_text=[[NSMutableArray alloc]initWithObjects:@"hat",@"cat",@"block",@"clock",@"bread",@"bed",@"shoe",@"blue",@"horn",@"corn",@"bear",@"chair",@"frog",@"dog",@"snail",@"pail",@"clown",@"crown",@"bell",@"shell",@"bag",@"flag",@"tie",@"pie",@"blanket",@"basket",@"spoon",@"moon",@"bee",@"tree",@"boat",@"coat",@"fruits",@"boots",@"rice",@"ice",@"pan",@"van",@"sad",@"glad",@"mug",@"rug",@"telephone",@"cone",@"pink",@"sink",@"train",@"airplane",@"truck",@"duck",@"chest",@"nest",@"goose",@"juice",@"four",@"door",@"ring",@"swing",@"hose",@"nose",@"tire",@"fire",@"lamp",@"stamp",@"fan",@"can",@"water",@"otter",@"knot",@"pot",@"guitar",@"jar",@"yellow",@"pillow",@"sled",@"red",@"donkey",@"monkey",@"dish",@"fish",@"white",@"kite",@"cake",@"rake",@"ball",@"doll",@"parrot",@"carrot",@"box",@"fox",@"pen",@"hen",@"zebra",@"pizza",@" blanket",@"helmet",@"rope",@"soap",@"thirteen",@"green",@"pool",@"stool",@"star",@"car",@"key",@"three",nil];
        
        self.image_title=[[NSMutableArray alloc]initWithObjects:@"cat",@"hat",@"clock",@"block",@"bed",@"bread",@"blue",@"shoe",@"corn",@"horn",@"chair",@"bear",@"dog",@"frog",@"pail",@"snail",@"crown",@"clown",@"shell",@"bell",@"flag",@"bag",@"pie",@"tie",@"basket",@"blanket",@"moon",@"spoon",@"tree",@"bee",@"coat",@"boat",@"boots",@"fruits",@"ice",@"rice",@"van",@"pan",@"glad",@"sad",@"rug",@"mug",@"cone",@"telephone",@"sink",@"pink",@"airplane",@"train",@"duck",@"truck",@"nest",@"chest",@"juice",@"goose",@"door",@"four",@"swing",@"ring",@"nose",@"hose",@"fire",@"tire",@"stamp",@"lamp",@"can",@"fan",@"otter",@"water",@"pot",@"knot",@"jar",@"guitar",@"pillow",@"yellow",@"red",@"sled",@"monkey",@"donkey",@"fish",@"dish",@"kite",@"white",@"rake",@"cake",@"doll",@"ball",@"carrot",@"parrot",@"fox",@"box",@"hen",@"pen",@"pizza",@"zebra",@"helmet",@" blanket",@"soap",@"rope",@"green",@"thirteen",@"stool",@"pool",@"car",@"star",@"three", @"key", nil];
        
        self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
        
        self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_grey_1",@"phonology_iphone_set1_grey_2",@"phonology_iphone_set1_grey_3",@"phonology_iphone_set1_grey_4",@"phonology_iphone_set1_grey_5",@"phonology_iphone_set1_grey_6",@"phonology_iphone_set1_grey_7",@"phonology_iphone_set1_grey_8",@"phonology_iphone_set1_grey_9",@"phonology_iphone_set1_grey_10",@"phonology_iphone_set1_grey_11",@"phonology_iphone_set1_grey_12",@"phonology_iphone_set1_grey_13",@"phonology_iphone_set1_grey_14",@"phonology_iphone_set1_grey_15",@"phonology_iphone_set1_grey_16",@"phonology_iphone_set2_grey_1",@"phonology_iphone_set2_grey_2",@"phonology_iphone_set2_grey_3",@"phonology_iphone_set2_grey_4",@"phonology_iphone_set2_grey_5",@"phonology_iphone_set2_grey_6",@"phonology_iphone_set2_grey_7",@"phonology_iphone_set2_grey_8",@"phonology_iphone_set2_grey_9",@"phonology_iphone_set2_grey_10",@"phonology_iphone_set2_grey_11",@"phonology_iphone_set2_grey_12",@"phonology_iphone_set2_grey_13",@"phonology_iphone_set2_grey_14",@"phonology_iphone_set2_grey_15",@"phonology_iphone_set2_grey_16",@"phonology_iphone_set2_grey_17",@"phonology_iphone_set2_grey_18",@"phonology_iphone_set3_grey_1",@"phonology_iphone_set3_grey_2",@"phonology_iphone_set3_grey_3",@"phonology_iphone_set3_grey_4",@"phonology_iphone_set3_grey_5",@"phonology_iphone_set3_grey_6",@"phonology_iphone_set3_grey_7",@"phonology_iphone_set3_grey_8",@"phonology_iphone_set3_grey_9",@"phonology_iphone_set3_grey_10",@"phonology_iphone_set3_grey_11",@"phonology_iphone_set3_grey_12",@"phonology_iphone_set3_grey_13",@"phonology_iphone_set3_grey_14",@"phonology_iphone_set3_grey_15",@"phonology_iphone_set3_grey_16",@"phonology_ipad_set3_grey_17",@"phonology_ipad_set3_grey_18",@"phonology_iphone_set4_grey_1",@"phonology_iphone_set4_grey_2",@"phonology_iphone_set4_grey_3",@"phonology_iphone_set4_grey_4",@"phonology_iphone_set4_grey_5",@"phonology_iphone_set4_grey_6",@"phonology_iphone_set4_grey_7",@"phonology_iphone_set4_grey_8",@"phonology_iphone_set4_grey_9",@"phonology_iphone_set4_grey_10",@"phonology_iphone_set4_grey_11",@"phonology_iphone_set4_grey_12",@"phonology_iphone_set4_grey_13",@"phonology_iphone_set4_grey_14",@"phonology_iphone_set4_grey_15",@"phonology_iphone_set4_grey_16",@"phonology_iphone_set4_grey_17",@"phonology_iphone_set4_grey_18",@"phonology_iphone_set5_grey_1",@"phonology_iphone_set5_grey_2",@"phonology_iphone_set5_grey_3",@"phonology_iphone_set5_grey_4",@"phonology_iphone_set5_grey_5",@"phonology_iphone_set5_grey_6",@"phonology_iphone_set5_grey_7",@"phonology_iphone_set5_grey_8",@"phonology_iphone_set5_grey_9",@"phonology_iphone_set5_grey_10",@"phonology_iphone_set5_grey_11",@"phonology_iphone_set5_grey_12",@"phonology_iphone_set5_grey_13",@"phonology_iphone_set5_grey_14",@"phonology_iphone_set5_grey_15",@"phonology_ipad_set5_grey_16",@"phonology_ipad_set5_grey_17",@"phonology_iphone_set5_grey_18",@"phonology_iphone_set6_grey_1",@"phonology_iphone_set6_grey_2",@"phonology_iphone_set6_grey_3",@"phonology_iphone_set6_grey_4",@"phonology_iphone_set6_grey_5",@"phonology_iphone_set6_grey_6",@"phonology_iphone_set6_grey_7",@"phonology_iphone_set6_grey_8",@"phonology_iphone_set6_grey_9",@"phonology_iphone_set6_grey_10",@"phonology_iphone_set6_grey_11",@"phonology_iphone_set6_grey_12",@"phonology_iphone_set6_grey_13",@"phonology_iphone_set6_grey_14",@"phonology_iphone_set6_grey_15",@"phonology_iphone_set6_grey_16",@"phonology_iphone_set6_grey_17",@"phonology_iphone_set6_grey_18", nil];
        
        self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set1_original_1",@"phonology_iphone_set1_original_2",@"phonology_iphone_set1_original_3",@"phonology_iphone_set1_original_4",@"phonology_iphone_set1_original_5",@"phonology_iphone_set1_original_6",@"phonology_iphone_set1_original_7",@"phonology_iphone_set1_original_8",@"phonology_iphone_set1_original_9",@"phonology_iphone_set1_original_10",@"phonology_iphone_set1_original_11",@"phonology_iphone_set1_original_12",@"phonology_iphone_set1_original_13",@"phonology_iphone_set1_original_14",@"phonology_iphone_set1_original_15",@"phonology_iphone_set1_original_16",@"phonology_iphone_set2_original_1",@"phonology_iphone_set2_original_2",@"phonology_iphone_set2_original_3",@"phonology_iphone_set2_original_4",@"phonology_iphone_set2_original_5",@"phonology_iphone_set2_original_6",@"phonology_iphone_set2_original_7",@"phonology_iphone_set2_original_8",@"phonology_iphone_set2_original_9",@"phonology_iphone_set2_original_10",@"phonology_iphone_set2_original_11",@"phonology_iphone_set2_original_12",@"phonology_iphone_set2_original_13",@"phonology_iphone_set2_original_14",@"phonology_iphone_set2_original_15",@"phonology_iphone_set2_original_16",@"phonology_iphone_set2_original_17",@"phonology_iphone_set2_original_18",@"phonology_iphone_set3_original_1",@"phonology_iphone_set3_original_2",@"phonology_iphone_set3_original_3",@"phonology_iphone_set3_original_4",@"phonology_iphone_set3_original_5",@"phonology_iphone_set3_original_6",@"phonology_iphone_set3_original_7",@"phonology_iphone_set3_original_8",@"phonology_iphone_set3_original_9",@"phonology_iphone_set3_original_10",@"phonology_iphone_set3_original_11",@"phonology_iphone_set3_original_12",@"phonology_iphone_set3_original_13",@"phonology_iphone_set3_original_14",@"phonology_iphone_set3_original_15",@"phonology_iphone_set3_original_16",@"phonology_iphone_set3_original_17",@"phonology_iphone_set3_original_18",@"phonology_iphone_set4_original_1",@"phonology_iphone_set4_original_2",@"phonology_iphone_set4_original_3",@"phonology_iphone_set4_original_4",@"phonology_iphone_set4_original_5",@"phonology_iphone_set4_original_6",@"phonology_iphone_set4_original_7",@"phonology_iphone_set4_original_8",@"phonology_iphone_set4_original_9",@"phonology_iphone_set4_original_10",@"phonology_iphone_set4_original_11",@"phonology_iphone_set4_original_12",@"phonology_iphone_set4_original_13",@"phonology_iphone_set4_original_14",@"phonology_iphone_set4_original_15",@"phonology_iphone_set4_original_16",@"phonology_iphone_set4_original_17",@"phonology_iphone_set4_original_18",@"phonology_iphone_set5_original_1",@"phonology_iphone_set5_original_2",@"phonology_iphone_set5_original_3",@"phonology_iphone_set5_original_4",@"phonology_iphone_set5_original_5",@"phonology_iphone_set5_original_6",@"phonology_iphone_set5_original_7",@"phonology_iphone_set5_original_8",@"phonology_iphone_set5_original_9",@"phonology_iphone_set5_original_10",@"phonology_iphone_set5_original_11",@"phonology_iphone_set5_original_12",@"phonology_iphone_set5_original_13",@"phonology_iphone_set5_original_14",@"phonology_iphone_set5_original_15",@"phonology_iphone_set5_original_16",@"phonology_iphone_set5_original_17",@"phonology_iphone_set5_original_18",@"phonology_iphone_set6_original_1",@"phonology_iphone_set6_original_2",@"phonology_iphone_set6_original_3",@"phonology_iphone_set6_original_4",@"phonology_iphone_set6_original_5",@"phonology_iphone_set6_original_6",@"phonology_iphone_set6_original_7",@"phonology_iphone_set6_original_8",@"phonology_iphone_set6_original_9",@"phonology_iphone_set6_original_10",@"phonology_iphone_set6_original_11",@"phonology_iphone_set6_original_12",@"phonology_iphone_set6_original_13",@"phonology_iphone_set6_original_14",@"phonology_iphone_set6_original_15",@"phonology_iphone_set6_original_16",@"phonology_iphone_set6_original_17",@"phonology_iphone_set6_original_18", nil];
        
        
        self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_green_1",@"phonology_iphone_set1_green_2",@"phonology_iphone_set1_green_3",@"phonology_iphone_set1_green_4",@"phonology_iphone_set1_green_5",@"phonology_iphone_set1_green_6",@"phonology_iphone_set1_green_7",@"phonology_iphone_set1_green_8",@"phonology_iphone_set1_green_9",@"phonology_iphone_set1_green_10",@"phonology_iphone_set1_green_11",@"phonology_iphone_set1_green_12",@"phonology_iphone_set1_green_13",@"phonology_iphone_set1_green_14",@"phonology_iphone_set1_green_15",@"phonology_iphone_set1_green_16",@"phonology_iphone_set2_green_1",@"phonology_iphone_set2_green_2",@"phonology_iphone_set2_green_3",@"phonology_iphone_set2_green_4",@"phonology_iphone_set2_green_5",@"phonology_iphone_set2_green_6",@"phonology_iphone_set2_green_7",@"phonology_iphone_set2_green_8",@"phonology_iphone_set2_green_9",@"phonology_iphone_set2_green_10",@"phonology_iphone_set2_green_11",@"phonology_iphone_set2_green_12",@"phonology_iphone_set2_green_13",@"phonology_iphone_set2_green_14",@"phonology_iphone_set2_green_15",@"phonology_iphone_set2_green_16",@"phonology_iphone_set2_green_17",@"phonology_iphone_set2_green_18",@"phonology_iphone_set3_green_1",@"phonology_iphone_set3_green_2",@"phonology_iphone_set3_green_3",@"phonology_iphone_set3_green_4",@"phonology_iphone_set3_green_5",@"phonology_iphone_set3_green_6",@"phonology_iphone_set3_green_7",@"phonology_iphone_set3_green_8",@"phonology_iphone_set3_green_9",@"phonology_iphone_set3_green_10",@"phonology_iphone_set3_green_11",@"phonology_iphone_set3_green_12",@"phonology_iphone_set3_green_13",@"phonology_iphone_set3_green_14",@"phonology_iphone_set3_green_15",@"phonology_iphone_set3_green_16",@"phonology_iphone_set3_green_17",@"phonology_iphone_set3_green_18",@"phonology_iphone_set4_green_1",@"phonology_iphone_set4_green_2",@"phonology_iphone_set4_green_3",@"phonology_iphone_set4_green_4",@"phonology_iphone_set4_green_5",@"phonology_iphone_set4_green_6",@"phonology_iphone_set4_green_7",@"phonology_iphone_set4_green_8",@"phonology_iphone_set4_green_9",@"phonology_iphone_set4_green_10",@"phonology_iphone_set4_green_11",@"phonology_iphone_set4_green_12",@"phonology_iphone_set4_green_13",@"phonology_iphone_set4_green_14",@"phonology_iphone_set4_green_15",@"phonology_iphone_set4_green_16",@"phonology_iphone_set4_green_17",@"phonology_iphone_set4_green_18",@"phonology_iphone_set5_green_1",@"phonology_iphone_set5_green_2",@"phonology_iphone_set5_green_3",@"phonology_iphone_set5_green_4",@"phonology_iphone_set5_green_5",@"phonology_iphone_set5_green_6",@"phonology_iphone_set5_green_7",@"phonology_iphone_set5_green_8",@"phonology_iphone_set5_green_9",@"phonology_iphone_set5_green_10",@"phonology_iphone_set5_green_11",@"phonology_iphone_set5_green_12",@"phonology_iphone_set5_green_13",@"phonology_iphone_set5_green_14",@"phonology_iphone_set5_green_15",@"phonology_iphone_set5_green_16",@"phonology_iphone_set5_green_17",@"phonology_iphone_set5_green_18",@"phonology_iphone_set6_green_1",@"phonology_iphone_set6_green_2",@"phonology_iphone_set6_green_3",@"phonology_iphone_set6_green_4",@"phonology_iphone_set6_green_5",@"phonology_iphone_set6_green_6",@"phonology_iphone_set6_green_7",@"phonology_iphone_set6_green_8",@"phonology_iphone_set6_green_9",@"phonology_iphone_set6_green_10",@"phonology_iphone_set6_green_11",@"phonology_iphone_set6_green_12",@"phonology_iphone_set6_green_13",@"phonology_iphone_set6_green_14",@"phonology_iphone_set6_green_15",@"phonology_iphone_set6_green_16",@"phonology_iphone_set6_green_17",@"phonology_iphone_set6_green_18", nil];
        
        
        self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_red_1",@"phonology_iphone_set1_red_2",@"phonology_iphone_set1_red_3",@"phonology_iphone_set1_red_4",@"phonology_iphone_set1_red_5",@"phonology_iphone_set1_red_6",@"phonology_iphone_set1_red_7",@"phonology_iphone_set1_red_8",@"phonology_iphone_set1_red_9",@"phonology_iphone_set1_red_10",@"phonology_iphone_set1_red_11",@"phonology_iphone_set1_red_12",@"phonology_iphone_set1_red_13",@"phonology_iphone_set1_red_14",@"phonology_iphone_set1_red_15",@"phonology_iphone_set1_red_16",@"phonology_iphone_set2_red_1",@"phonology_iphone_set2_red_2",@"phonology_iphone_set2_red_3",@"phonology_iphone_set2_red_4",@"phonology_iphone_set2_red_5",@"phonology_iphone_set2_red_6",@"phonology_iphone_set2_red_7",@"phonology_iphone_set2_red_8",@"phonology_iphone_set2_red_9",@"phonology_iphone_set2_red_10",@"phonology_iphone_set2_red_11",@"phonology_iphone_set2_red_12",@"phonology_iphone_set2_red_13",@"phonology_iphone_set2_red_14",@"phonology_iphone_set2_red_15",@"phonology_iphone_set2_red_16",@"phonology_iphone_set2_red_17",@"phonology_iphone_set2_red_18",@"phonology_iphone_set3_red_1",@"phonology_iphone_set3_red_2",@"phonology_iphone_set3_red_3",@"phonology_iphone_set3_red_4",@"phonology_iphone_set3_red_5",@"phonology_iphone_set3_red_6",@"phonology_iphone_set3_red_7",@"phonology_iphone_set3_red_8",@"phonology_iphone_set3_red_9",@"phonology_iphone_set3_red_10",@"phonology_iphone_set3_red_11",@"phonology_iphone_set3_red_12",@"phonology_iphone_set3_red_13",@"phonology_iphone_set3_red_14",@"phonology_iphone_set3_red_15",@"phonology_iphone_set3_red_16",@"phonology_iphone_set3_red_17",@"phonology_iphone_set3_red_18",@"phonology_iphone_set4_red_1",@"phonology_iphone_set4_red_2",@"phonology_iphone_set4_red_3",@"phonology_iphone_set4_red_4",@"phonology_iphone_set4_red_5",@"phonology_iphone_set4_red_6",@"phonology_iphone_set4_red_7",@"phonology_iphone_set4_red_8",@"phonology_iphone_set4_red_9",@"phonology_iphone_set4_red_10",@"phonology_iphone_set4_red_11",@"phonology_iphone_set4_red_12",@"phonology_iphone_set4_red_13",@"phonology_iphone_set4_red_14",@"phonology_iphone_set4_red_15",@"phonology_iphone_set4_red_16",@"phonology_iphone_set4_red_17",@"phonology_iphone_set4_red_18",@"phonology_iphone_set5_red_1",@"phonology_iphone_set5_red_2",@"phonology_iphone_set5_red_3",@"phonology_iphone_set5_red_4",@"phonology_iphone_set5_red_5",@"phonology_iphone_set5_red_6",@"phonology_iphone_set5_red_7",@"phonology_iphone_set5_red_8",@"phonology_iphone_set5_red_9",@"phonology_iphone_set5_red_10",@"phonology_iphone_set5_red_11",@"phonology_iphone_set5_red_12",@"phonology_iphone_set5_red_13",@"phonology_iphone_set5_red_14",@"phonology_iphone_set5_red_15",@"phonology_iphone_set5_red_16",@"phonology_iphone_set5_red_17",@"phonology_iphone_set5_red_18",@"phonology_iphone_set6_red_1",@"phonology_iphone_set6_red_2",@"phonology_iphone_set6_red_3",@"phonology_iphone_set6_red_4",@"phonology_iphone_set6_red_5",@"phonology_iphone_set6_red_6",@"phonology_iphone_set6_red_7",@"phonology_iphone_set6_red_8",@"phonology_iphone_set6_red_9",@"phonology_iphone_set6_red_10",@"phonology_iphone_set6_red_11",@"phonology_iphone_set6_red_12",@"phonology_iphone_set6_red_13",@"phonology_iphone_set6_red_14",@"phonology_iphone_set6_red_15",@"phonology_iphone_set6_red_16",@"phonology_iphone_set6_red_17",@"phonology_iphone_set6_red_18", nil];
        
        dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50",@"51",@"52",@"53",@"54",@"55",@"56",@"57",@"58",@"59",@"60",@"61",@"62",@"63",@"64",@"65",@"66",@"67",@"68",@"69",@"70",@"71",@"72",@"73",@"74",@"75",@"76",@"77",@"78",@"79",@"80",@"81",@"82",@"83",@"84",@"85",@"86",@"87",@"88",@"89",@"90",@"91",@"92",@"93",@"94",@"95",@"96",@"97",@"98",@"99",@"100",@"101",@"102",@"103",@"104",@"105"]];
        
        
        
        [self loadQuestionsforAll];
        
    }
  
      
  }
    ////////******IPHONE******////////
  
  else if (appDel.i==2)
  {
      if([MenuBtnTag_iphone isEqualToString:[NSString stringWithFormat:@"rhyming words set a"]])
      {
          rhymeA=true;
          
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with cat?",@"what rhymes with hat?",@"what rhymes with clock?",@"what rhymes with block?",@"what rhymes with bed?",@"what rhymes with bread?",@"what rhymes with blue?",@"what rhymes with shoe?",@"what rhymes with corn?",@"what rhymes with horn?",@"what rhymes with chair?",@"what rhymes with bear?",@"what rhymes with dog?",@"what rhymes with frog?",@"what rhymes with pail?",@"what rhymes with snail?",nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"hat",@"cat",@"block",@"clock",@"bread",@"bed",@"shoe",@"blue",@"horn",@"corn",@"bear",@"chair",@"frog",@"dog",@"snail",@"pail",nil];
          
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_grey_1",@"phonology_iphone_set1_grey_2",@"phonology_iphone_set1_grey_3",@"phonology_iphone_set1_grey_4",@"phonology_iphone_set1_grey_5",@"phonology_iphone_set1_grey_6",@"phonology_iphone_set1_grey_7",@"phonology_iphone_set1_grey_8",@"phonology_iphone_set1_grey_9",@"phonology_iphone_set1_grey_10",@"phonology_iphone_set1_grey_11",@"phonology_iphone_set1_grey_12",@"phonology_iphone_set1_grey_13",@"phonology_iphone_set1_grey_14",@"phonology_iphone_set1_grey_15",@"phonology_iphone_set1_grey_16", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set1_original_1",@"phonology_iphone_set1_original_2",@"phonology_iphone_set1_original_3",@"phonology_iphone_set1_original_4",@"phonology_iphone_set1_original_5",@"phonology_iphone_set1_original_6",@"phonology_iphone_set1_original_7",@"phonology_iphone_set1_original_8",@"phonology_iphone_set1_original_9",@"phonology_iphone_set1_original_10",@"phonology_iphone_set1_original_11",@"phonology_iphone_set1_original_12",@"phonology_iphone_set1_original_13",@"phonology_iphone_set1_original_14",@"phonology_iphone_set1_original_15",@"phonology_iphone_set1_original_16", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_green_1",@"phonology_iphone_set1_green_2",@"phonology_iphone_set1_green_3",@"phonology_iphone_set1_green_4",@"phonology_iphone_set1_green_5",@"phonology_iphone_set1_green_6",@"phonology_iphone_set1_green_7",@"phonology_iphone_set1_green_8",@"phonology_iphone_set1_green_9",@"phonology_iphone_set1_green_10",@"phonology_iphone_set1_green_11",@"phonology_iphone_set1_green_12",@"phonology_iphone_set1_green_13",@"phonology_iphone_set1_green_14",@"phonology_iphone_set1_green_15",@"phonology_iphone_set1_green_16", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_red_1",@"phonology_iphone_set1_red_2",@"phonology_iphone_set1_red_3",@"phonology_iphone_set1_red_4",@"phonology_iphone_set1_red_5",@"phonology_iphone_set1_red_6",@"phonology_iphone_set1_red_7",@"phonology_iphone_set1_red_8",@"phonology_iphone_set1_red_9",@"phonology_iphone_set1_red_10",@"phonology_iphone_set1_red_11",@"phonology_iphone_set1_red_12",@"phonology_iphone_set1_red_13",@"phonology_iphone_set1_red_14",@"phonology_iphone_set1_red_15",@"phonology_iphone_set1_red_16", nil];
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15"]];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"cat",@"hat",@"clock",@"block",@"bed",@"bread",@"blue",@"shoe",@"corn",@"horn",@"chair",@"bear",@"dog",@"frog",@"pail",@"snail", nil];
          [self loadQuestions];
          
      }
      
      else if([MenuBtnTag_iphone isEqualToString:[NSString stringWithFormat:@"rhyming words set b"]])
      {
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with crown?",@"what rhymes with clown?",@"what rhymes with shell?",@"what rhymes with bell?",@"what rhymes with flag?",@"what rhymes with bag?",@"what rhymes with pie?",@"what rhymes with tie?",@"what rhymes with basket?",@"what rhymes with blanket?",@"what rhymes with moon?",@"what rhymes with spoon?",@"what rhymes with tree?",@"what rhymes with bee?",@"what rhymes with coat?",@"what rhymes with boat?",@"what rhymes with boots?",@"what rhymes with fruits?",nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"clown",@"crown",@"bell",@"shell",@"bag",@"flag",@"tie",@"pie",@"blanket",@"basket",@"spoon",@"moon",@"bee",@"tree",@"boat",@"coat",@"fruits",@"boots",nil];
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set2_grey_1",@"phonology_iphone_set2_grey_2",@"phonology_iphone_set2_grey_3",@"phonology_iphone_set2_grey_4",@"phonology_iphone_set2_grey_5",@"phonology_iphone_set2_grey_6",@"phonology_iphone_set2_grey_7",@"phonology_iphone_set2_grey_8",@"phonology_iphone_set2_grey_9",@"phonology_iphone_set2_grey_10",@"phonology_iphone_set2_grey_11",@"phonology_iphone_set2_grey_12",@"phonology_iphone_set2_grey_13",@"phonology_iphone_set2_grey_14",@"phonology_iphone_set2_grey_15",@"phonology_iphone_set2_grey_16",@"phonology_iphone_set2_grey_17",@"phonology_iphone_set2_grey_18", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set2_original_1",@"phonology_iphone_set2_original_2",@"phonology_iphone_set2_original_3",@"phonology_iphone_set2_original_4",@"phonology_iphone_set2_original_5",@"phonology_iphone_set2_original_6",@"phonology_iphone_set2_original_7",@"phonology_iphone_set2_original_8",@"phonology_iphone_set2_original_9",@"phonology_iphone_set2_original_10",@"phonology_iphone_set2_original_11",@"phonology_iphone_set2_original_12",@"phonology_iphone_set2_original_13",@"phonology_iphone_set2_original_14",@"phonology_iphone_set2_original_15",@"phonology_iphone_set2_original_16",@"phonology_iphone_set2_original_17",@"phonology_iphone_set2_original_18", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set2_green_1",@"phonology_iphone_set2_green_2",@"phonology_iphone_set2_green_3",@"phonology_iphone_set2_green_4",@"phonology_iphone_set2_green_5",@"phonology_iphone_set2_green_6",@"phonology_iphone_set2_green_7",@"phonology_iphone_set2_green_8",@"phonology_iphone_set2_green_9",@"phonology_iphone_set2_green_10",@"phonology_iphone_set2_green_11",@"phonology_iphone_set2_green_12",@"phonology_iphone_set2_green_13",@"phonology_iphone_set2_green_14",@"phonology_iphone_set2_green_15",@"phonology_iphone_set2_green_16",@"phonology_iphone_set2_green_17",@"phonology_iphone_set2_green_18", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set2_red_1",@"phonology_iphone_set2_red_2",@"phonology_iphone_set2_red_3",@"phonology_iphone_set2_red_4",@"phonology_iphone_set2_red_5",@"phonology_iphone_set2_red_6",@"phonology_iphone_set2_red_7",@"phonology_iphone_set2_red_8",@"phonology_iphone_set2_red_9",@"phonology_iphone_set2_red_10",@"phonology_iphone_set2_red_11",@"phonology_iphone_set2_red_12",@"phonology_iphone_set2_red_13",@"phonology_iphone_set2_red_14",@"phonology_iphone_set2_red_15",@"phonology_iphone_set2_red_16",@"phonology_iphone_set2_red_17",@"phonology_iphone_set2_red_18", nil];
          
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"crown",@"clown",@"shell",@"bell",@"flag",@"bag",@"pie",@"tie",@"basket",@"blanket",@"moon",@"spoon",@"tree",@"bee",@"coat",@"boat",@"boots",@"fruits", nil];
          [self loadQuestions];
      }
      
      else if([MenuBtnTag_iphone isEqualToString:[NSString stringWithFormat:@"rhyming words set c"]])
      {
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with ice?",@"what rhymes with rice?",@"what rhymes with van?",@"what rhymes with pan?",@"what rhymes with glad?",@"what rhymes with sad?",@"what rhymes with rug?",@"what rhymes with mug?",@"what rhymes with cone?",@"what rhymes with telephone?",@"what rhymes with sink?",@"what rhymes with pink?",@"what rhymes with airplane?",@"what rhymes with train?",@"what rhymes with duck?",@"what rhymes with truck?",@"what rhymes with nest?",@"what rhymes with chest?",nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"rice",@"ice",@"pan",@"van",@"sad",@"glad",@"mug",@"rug",@"telephone",@"cone",@"pink",@"sink",@"train",@"airplane",@"truck",@"duck",@"chest",@"nest",nil];
          
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set3_grey_1",@"phonology_iphone_set3_grey_2",@"phonology_iphone_set3_grey_3",@"phonology_iphone_set3_grey_4",@"phonology_iphone_set3_grey_5",@"phonology_iphone_set3_grey_6",@"phonology_iphone_set3_grey_7",@"phonology_iphone_set3_grey_8",@"phonology_iphone_set3_grey_9",@"phonology_iphone_set3_grey_10",@"phonology_iphone_set3_grey_11",@"phonology_iphone_set3_grey_12",@"phonology_iphone_set3_grey_13",@"phonology_iphone_set3_grey_14",@"phonology_iphone_set3_grey_15",@"phonology_iphone_set3_grey_16",@"phonology_iphone_set3_grey_17",@"phonology_iphone_set3_grey_18", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set3_original_1",@"phonology_iphone_set3_original_2",@"phonology_iphone_set3_original_3",@"phonology_iphone_set3_original_4",@"phonology_iphone_set3_original_5",@"phonology_iphone_set3_original_6",@"phonology_iphone_set3_original_7",@"phonology_iphone_set3_original_8",@"phonology_iphone_set3_original_9",@"phonology_iphone_set3_original_10",@"phonology_iphone_set3_original_11",@"phonology_iphone_set3_original_12",@"phonology_iphone_set3_original_13",@"phonology_iphone_set3_original_14",@"phonology_iphone_set3_original_15",@"phonology_iphone_set3_original_16",@"phonology_iphone_set3_original_17",@"phonology_iphone_set3_original_18", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set3_green_1",@"phonology_iphone_set3_green_2",@"phonology_iphone_set3_green_3",@"phonology_iphone_set3_green_4",@"phonology_iphone_set3_green_5",@"phonology_iphone_set3_green_6",@"phonology_iphone_set3_green_7",@"phonology_iphone_set3_green_8",@"phonology_iphone_set3_green_9",@"phonology_iphone_set3_green_10",@"phonology_iphone_set3_green_11",@"phonology_iphone_set3_green_12",@"phonology_iphone_set3_green_13",@"phonology_iphone_set3_green_14",@"phonology_iphone_set3_green_15",@"phonology_iphone_set3_green_16",@"phonology_iphone_set3_green_17",@"phonology_iphone_set3_green_18", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set3_red_1",@"phonology_iphone_set3_red_2",@"phonology_iphone_set3_red_3",@"phonology_iphone_set3_red_4",@"phonology_iphone_set3_red_5",@"phonology_iphone_set3_red_6",@"phonology_iphone_set3_red_7",@"phonology_iphone_set3_red_8",@"phonology_iphone_set3_red_9",@"phonology_iphone_set3_red_10",@"phonology_iphone_set3_red_11",@"phonology_iphone_set3_red_12",@"phonology_iphone_set3_red_13",@"phonology_iphone_set3_red_14",@"phonology_iphone_set3_red_15",@"phonology_iphone_set3_red_16",@"phonology_iphone_set3_red_17",@"phonology_iphone_set3_red_18", nil];
          
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"ice",@"rice",@"van",@"pan",@"glad",@"sad",@"rug",@"mug",@"cone",@"telephone",@"sink",@"pink",@"airplane",@"train",@"duck",@"truck",@"nest",@"chest", nil];
          
          [self loadQuestions];
          
      }
      
      else if([MenuBtnTag_iphone isEqualToString:[NSString stringWithFormat:@"rhyming words set d"]])
      {
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with juice?",@"what rhymes with goose?",@"what rhymes with door?",@"what rhymes with four?",@"what rhymes with swing?",@"what rhymes with ring?",@"what rhymes with nose?",@"what rhymes with hose?",@"what rhymes with fire?",@"what rhymes with tire?",@"what rhymes with stamp?",@"what rhymes with lamp?",@"what rhymes with can?",@"what rhymes with fan?",@"what rhymes with otter?",@"what rhymes with water?",@"what rhymes with pot?",@"what rhymes with knot?",nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"goose",@"juice",@"four",@"door",@"ring",@"swing",@"hose",@"nose",@"tire",@"fire",@"lamp",@"stamp",@"fan",@"can",@"water",@"otter",@"knot",@"pot",nil];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"juice",@"goose",@"door",@"four",@"swing",@"ring",@"nose",@"hose",@"fire",@"tire",@"stamp",@"lamp",@"can",@"fan",@"otter",@"water",@"pot",@"knot", nil];
          
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set4_grey_1",@"phonology_iphone_set4_grey_2",@"phonology_iphone_set4_grey_3",@"phonology_iphone_set4_grey_4",@"phonology_iphone_set4_grey_5",@"phonology_iphone_set4_grey_6",@"phonology_iphone_set4_grey_7",@"phonology_iphone_set4_grey_8",@"phonology_iphone_set4_grey_9",@"phonology_iphone_set4_grey_10",@"phonology_iphone_set4_grey_11",@"phonology_iphone_set4_grey_12",@"phonology_iphone_set4_grey_13",@"phonology_iphone_set4_grey_14",@"phonology_iphone_set4_grey_15",@"phonology_iphone_set4_grey_16",@"phonology_iphone_set4_grey_17",@"phonology_iphone_set4_grey_18", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set4_original_1",@"phonology_iphone_set4_original_2",@"phonology_iphone_set4_original_3",@"phonology_iphone_set4_original_4",@"phonology_iphone_set4_original_5",@"phonology_iphone_set4_original_6",@"phonology_iphone_set4_original_7",@"phonology_iphone_set4_original_8",@"phonology_iphone_set4_original_9",@"phonology_iphone_set4_original_10",@"phonology_iphone_set4_original_11",@"phonology_iphone_set4_original_12",@"phonology_iphone_set4_original_13",@"phonology_iphone_set4_original_14",@"phonology_iphone_set4_original_15",@"phonology_iphone_set4_original_16",@"phonology_iphone_set4_original_17",@"phonology_iphone_set4_original_18", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set4_green_1",@"phonology_iphone_set4_green_2",@"phonology_iphone_set4_green_3",@"phonology_iphone_set4_green_4",@"phonology_iphone_set4_green_5",@"phonology_iphone_set4_green_6",@"phonology_iphone_set4_green_7",@"phonology_iphone_set4_green_8",@"phonology_iphone_set4_green_9",@"phonology_iphone_set4_green_10",@"phonology_iphone_set4_green_11",@"phonology_iphone_set4_green_12",@"phonology_iphone_set4_green_13",@"phonology_iphone_set4_green_14",@"phonology_iphone_set4_green_15",@"phonology_iphone_set4_green_16",@"phonology_iphone_set4_green_17",@"phonology_iphone_set4_green_18", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set4_red_1",@"phonology_iphone_set4_red_2",@"phonology_iphone_set4_red_3",@"phonology_iphone_set4_red_4",@"phonology_iphone_set4_red_5",@"phonology_iphone_set4_red_6",@"phonology_iphone_set4_red_7",@"phonology_iphone_set4_red_8",@"phonology_iphone_set4_red_9",@"phonology_iphone_set4_red_10",@"phonology_iphone_set4_red_11",@"phonology_iphone_set4_red_12",@"phonology_iphone_set4_red_13",@"phonology_iphone_set4_red_14",@"phonology_iphone_set4_red_15",@"phonology_iphone_set4_red_16",@"phonology_iphone_set4_red_17",@"phonology_iphone_set4_red_18", nil];
          
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
          
          [self loadQuestions];
      }
      
      else if([MenuBtnTag_iphone isEqualToString:[NSString stringWithFormat:@"rhyming words set e"]])
      {
          rhymeE=true;
          
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with jar?",@"what rhymes with guitar?",@"what rhymes with pillow?",@"what rhymes with yellow?",@"what rhymes with red?",@"what rhymes with sled?",@"what rhymes with monkey?",@"what rhymes with donkey?",@"what rhymes with fish?",@"what rhymes with dish?",@"what rhymes with kite?",@"what rhymes with white?",@"what rhymes with rake?",@"what rhymes with cake?",@"what rhymes with doll?",@"what rhymes with ball?",@"what rhymes with carrot?",@"what rhymes with parrot?",nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"guitar",@"jar",@"yellow",@"pillow",@"sled",@"red",@"donkey",@"monkey",@"dish",@"fish",@"white",@"kite",@"cake",@"rake",@"ball",@"doll",@"parrot",@"carrot",nil];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"jar",@"guitar",@"pillow",@"yellow",@"red",@"sled",@"monkey",@"donkey",@"fish",@"dish",@"kite",@"white",@"rake",@"cake",@"doll",@"ball",@"carrot",@"parrot", nil];
          
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set5_grey_1",@"phonology_iphone_set5_grey_2",@"phonology_iphone_set5_grey_3",@"phonology_iphone_set5_grey_4",@"phonology_iphone_set5_grey_5",@"phonology_iphone_set5_grey_6",@"phonology_iphone_set5_grey_7",@"phonology_iphone_set5_grey_8",@"phonology_iphone_set5_grey_9",@"phonology_iphone_set5_grey_10",@"phonology_iphone_set5_grey_11",@"phonology_iphone_set5_grey_12",@"phonology_iphone_set5_grey_13",@"phonology_iphone_set5_grey_14",@"phonology_iphone_set5_grey_15",@"phonology_iphone_set5_grey_16",@"phonology_iphone_set5_grey_17",@"phonology_iphone_set5_grey_18", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set5_original_1",@"phonology_iphone_set5_original_2",@"phonology_iphone_set5_original_3",@"phonology_iphone_set5_original_4",@"phonology_iphone_set5_original_5",@"phonology_iphone_set5_original_6",@"phonology_iphone_set5_original_7",@"phonology_iphone_set5_original_8",@"phonology_iphone_set5_original_9",@"phonology_iphone_set5_original_10",@"phonology_iphone_set5_original_11",@"phonology_iphone_set5_original_12",@"phonology_iphone_set5_original_13",@"phonology_iphone_set5_original_14",@"phonology_iphone_set5_original_15",@"phonology_iphone_set5_original_16",@"phonology_iphone_set5_original_17",@"phonology_iphone_set5_original_18", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set5_green_1",@"phonology_iphone_set5_green_2",@"phonology_iphone_set5_green_3",@"phonology_iphone_set5_green_4",@"phonology_iphone_set5_green_5",@"phonology_iphone_set5_green_6",@"phonology_iphone_set5_green_7",@"phonology_iphone_set5_green_8",@"phonology_iphone_set5_green_9",@"phonology_iphone_set5_green_10",@"phonology_iphone_set5_green_11",@"phonology_iphone_set5_green_12",@"phonology_iphone_set5_green_13",@"phonology_iphone_set5_green_14",@"phonology_iphone_set5_green_15",@"phonology_iphone_set5_green_16",@"phonology_iphone_set5_green_17",@"phonology_iphone_set5_green_18", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set5_red_1",@"phonology_iphone_set5_red_2",@"phonology_iphone_set5_red_3",@"phonology_iphone_set5_red_4",@"phonology_iphone_set5_red_5",@"phonology_iphone_set5_red_6",@"phonology_iphone_set5_red_7",@"phonology_iphone_set5_red_8",@"phonology_iphone_set5_red_9",@"phonology_iphone_set5_red_10",@"phonology_iphone_set5_red_11",@"phonology_iphone_set5_red_12",@"phonology_iphone_set5_red_13",@"phonology_iphone_set5_red_14",@"phonology_iphone_set5_red_15",@"phonology_iphone_set5_red_16",@"phonology_iphone_set5_red_17",@"phonology_iphone_set5_red_18", nil];
          
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
          
          [self loadQuestions];
      }
      
      else if([MenuBtnTag_iphone isEqualToString:[NSString stringWithFormat:@"rhyming words set f"]])
      {
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with fox?",@"what rhymes with box?",@"what rhymes with hen?",@"what rhymes with pen?",@"what rhymes with pizza?",@"what rhymes with zebra?",@"what rhymes with helmet?",@"what rhymes with  blanket?",@"what rhymes with soap?",@"what rhymes with rope?",@"what rhymes with green?",@"what rhymes with thirteen?",@"what rhymes with stool?",@"what rhymes with pool?",@"what rhymes with car?",@"what rhymes with star?",@"what rhymes with three?",@"what rhymes with key?",nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"box",@"fox",@"pen",@"hen",@"zebra",@"pizza",@" blanket",@"helmet",@"rope",@"soap",@"thirteen",@"green",@"pool",@"stool",@"star",@"car",@"key",@"three",nil];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"fox",@"box",@"hen",@"pen",@"pizza",@"zebra",@"helmet",@" blanket",@"soap",@"rope",@"green",@"thirteen",@"stool",@"pool",@"car",@"star",@"three", @"key",nil];
          
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set6_grey_1",@"phonology_iphone_set6_grey_2",@"phonology_iphone_set6_grey_3",@"phonology_iphone_set6_grey_4",@"phonology_iphone_set6_grey_5",@"phonology_iphone_set6_grey_6",@"phonology_iphone_set6_grey_7",@"phonology_iphone_set6_grey_8",@"phonology_iphone_set6_grey_9",@"phonology_iphone_set6_grey_10",@"phonology_iphone_set6_grey_11",@"phonology_iphone_set6_grey_12",@"phonology_iphone_set6_grey_13",@"phonology_iphone_set6_grey_14",@"phonology_iphone_set6_grey_15",@"phonology_iphone_set6_grey_16",@"phonology_iphone_set6_grey_17",@"phonology_iphone_set6_grey_18", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set6_original_1",@"phonology_iphone_set6_original_2",@"phonology_iphone_set6_original_3",@"phonology_iphone_set6_original_4",@"phonology_iphone_set6_original_5",@"phonology_iphone_set6_original_6",@"phonology_iphone_set6_original_7",@"phonology_iphone_set6_original_8",@"phonology_iphone_set6_original_9",@"phonology_iphone_set6_original_10",@"phonology_iphone_set6_original_11",@"phonology_iphone_set6_original_12",@"phonology_iphone_set6_original_13",@"phonology_iphone_set6_original_14",@"phonology_iphone_set6_original_15",@"phonology_iphone_set6_original_16",@"phonology_iphone_set6_original_17",@"phonology_iphone_set6_original_18", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set6_green_1",@"phonology_iphone_set6_green_2",@"phonology_iphone_set6_green_3",@"phonology_iphone_set6_green_4",@"phonology_iphone_set6_green_5",@"phonology_iphone_set6_green_6",@"phonology_iphone_set6_green_7",@"phonology_iphone_set6_green_8",@"phonology_iphone_set6_green_9",@"phonology_iphone_set6_green_10",@"phonology_iphone_set6_green_11",@"phonology_iphone_set6_green_12",@"phonology_iphone_set6_green_13",@"phonology_iphone_set6_green_14",@"phonology_iphone_set6_green_15",@"phonology_iphone_set6_green_16",@"phonology_iphone_set6_green_17",@"phonology_iphone_set6_green_18", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set6_red_1",@"phonology_iphone_set6_red_2",@"phonology_iphone_set6_red_3",@"phonology_iphone_set6_red_4",@"phonology_iphone_set6_red_5",@"phonology_iphone_set6_red_6",@"phonology_iphone_set6_red_7",@"phonology_iphone_set6_red_8",@"phonology_iphone_set6_red_9",@"phonology_iphone_set6_red_10",@"phonology_iphone_set6_red_11",@"phonology_iphone_set6_red_12",@"phonology_iphone_set6_red_13",@"phonology_iphone_set6_red_14",@"phonology_iphone_set6_red_15",@"phonology_iphone_set6_red_16",@"phonology_iphone_set6_red_17",@"phonology_iphone_set6_red_18", nil];
          
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
          
          [self loadQuestions];
      }
      
      else if([MenuBtnTag_iphone isEqualToString:[NSString stringWithFormat:@"all rhyming words"]])
      {
          rhymeAforAll=true;
          
          rhymeEforAll=true;
          
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with cat?",@"what rhymes with hat?",@"what rhymes with clock?",@"what rhymes with block?",@"what rhymes with bed?",@"what rhymes with bread?",@"what rhymes with blue?",@"what rhymes with shoe?",@"what rhymes with corn?",@"what rhymes with horn?",@"what rhymes with chair?",@"what rhymes with bear?",@"what rhymes with dog?",@"what rhymes with frog?",@"what rhymes with pail?",@"what rhymes with snail?",@"what rhymes with crown?",@"what rhymes with clown?",@"what rhymes with shell?",@"what rhymes with bell?",@"what rhymes with flag?",@"what rhymes with bag?",@"what rhymes with pie?",@"what rhymes with tie?",@"what rhymes with basket?",@"what rhymes with blanket?",@"what rhymes with moon?",@"what rhymes with spoon?",@"what rhymes with tree?",@"what rhymes with bee?",@"what rhymes with coat?",@"what rhymes with boat?",@"what rhymes with boots?",@"what rhymes with fruits?",@"what rhymes with ice?",@"what rhymes with rice?",@"what rhymes with van?",@"what rhymes with pan?",@"what rhymes with glad?",@"what rhymes with sad?",@"what rhymes with rug?",@"what rhymes with mug?",@"what rhymes with cone?",@"what rhymes with telephone?",@"what rhymes with sink?",@"what rhymes with pink?",@"what rhymes with airplane?",@"what rhymes with train?",@"what rhymes with duck?",@"what rhymes with truck?",@"what rhymes with nest?",@"what rhymes with chest?",@"what rhymes with juice?",@"what rhymes with goose?",@"what rhymes with door?",@"what rhymes with four?",@"what rhymes with swing?",@"what rhymes with ring?",@"what rhymes with nose?",@"what rhymes with hose?",@"what rhymes with fire?",@"what rhymes with tire?",@"what rhymes with stamp?",@"what rhymes with lamp?",@"what rhymes with can?",@"what rhymes with fan?",@"what rhymes with otter?",@"what rhymes with water?",@"what rhymes with pot?",@"what rhymes with knot?",@"what rhymes with jar?",@"what rhymes with guitar?",@"what rhymes with pillow?",@"what rhymes with yellow?",@"what rhymes with red?",@"what rhymes with sled?",@"what rhymes with monkey?",@"what rhymes with donkey?",@"what rhymes with fish?",@"what rhymes with dish?",@"what rhymes with kite?",@"what rhymes with white?",@"what rhymes with rake?",@"what rhymes with cake?",@"what rhymes with doll?",@"what rhymes with ball?",@"what rhymes with carrot?",@"what rhymes with parrot?",@"what rhymes with fox?",@"what rhymes with box?",@"what rhymes with hen?",@"what rhymes with pen?",@"what rhymes with pizza?",@"what rhymes with zebra?",@"what rhymes with helmet?",@"what rhymes with  blanket?",@"what rhymes with soap?",@"what rhymes with rope?",@"what rhymes with green?",@"what rhymes with thirteen?",@"what rhymes with stool?",@"what rhymes with pool?",@"what rhymes with car?",@"what rhymes with star?",@"what rhymes with three?",@"what rhymes with key?", nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"hat",@"cat",@"block",@"clock",@"bread",@"bed",@"shoe",@"blue",@"horn",@"corn",@"bear",@"chair",@"frog",@"dog",@"snail",@"pail",@"clown",@"crown",@"bell",@"shell",@"bag",@"flag",@"tie",@"pie",@"blanket",@"basket",@"spoon",@"moon",@"bee",@"tree",@"boat",@"coat",@"fruits",@"boots",@"rice",@"ice",@"pan",@"van",@"sad",@"glad",@"mug",@"rug",@"telephone",@"cone",@"pink",@"sink",@"train",@"airplane",@"truck",@"duck",@"chest",@"nest",@"goose",@"juice",@"four",@"door",@"ring",@"swing",@"hose",@"nose",@"tire",@"fire",@"lamp",@"stamp",@"fan",@"can",@"water",@"otter",@"knot",@"pot",@"guitar",@"jar",@"yellow",@"pillow",@"sled",@"red",@"donkey",@"monkey",@"dish",@"fish",@"white",@"kite",@"cake",@"rake",@"ball",@"doll",@"parrot",@"carrot",@"box",@"fox",@"pen",@"hen",@"zebra",@"pizza",@" blanket",@"helmet",@"rope",@"soap",@"thirteen",@"green",@"pool",@"stool",@"star",@"car",@"key",@"three",nil];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"cat",@"hat",@"clock",@"block",@"bed",@"bread",@"blue",@"shoe",@"corn",@"horn",@"chair",@"bear",@"dog",@"frog",@"pail",@"snail",@"crown",@"clown",@"shell",@"bell",@"flag",@"bag",@"pie",@"tie",@"basket",@"blanket",@"moon",@"spoon",@"tree",@"bee",@"coat",@"boat",@"boots",@"fruits",@"ice",@"rice",@"van",@"pan",@"glad",@"sad",@"rug",@"mug",@"cone",@"telephone",@"sink",@"pink",@"airplane",@"train",@"duck",@"truck",@"nest",@"chest",@"juice",@"goose",@"door",@"four",@"swing",@"ring",@"nose",@"hose",@"fire",@"tire",@"stamp",@"lamp",@"can",@"fan",@"otter",@"water",@"pot",@"knot",@"jar",@"guitar",@"pillow",@"yellow",@"red",@"sled",@"monkey",@"donkey",@"fish",@"dish",@"kite",@"white",@"rake",@"cake",@"doll",@"ball",@"carrot",@"parrot",@"fox",@"box",@"hen",@"pen",@"pizza",@"zebra",@"helmet",@" blanket",@"soap",@"rope",@"green",@"thirteen",@"stool",@"pool",@"car",@"star",@"three", @"key", nil];
          
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_grey_1",@"phonology_iphone_set1_grey_2",@"phonology_iphone_set1_grey_3",@"phonology_iphone_set1_grey_4",@"phonology_iphone_set1_grey_5",@"phonology_iphone_set1_grey_6",@"phonology_iphone_set1_grey_7",@"phonology_iphone_set1_grey_8",@"phonology_iphone_set1_grey_9",@"phonology_iphone_set1_grey_10",@"phonology_iphone_set1_grey_11",@"phonology_iphone_set1_grey_12",@"phonology_iphone_set1_grey_13",@"phonology_iphone_set1_grey_14",@"phonology_iphone_set1_grey_15",@"phonology_iphone_set1_grey_16",@"phonology_iphone_set2_grey_1",@"phonology_iphone_set2_grey_2",@"phonology_iphone_set2_grey_3",@"phonology_iphone_set2_grey_4",@"phonology_iphone_set2_grey_5",@"phonology_iphone_set2_grey_6",@"phonology_iphone_set2_grey_7",@"phonology_iphone_set2_grey_8",@"phonology_iphone_set2_grey_9",@"phonology_iphone_set2_grey_10",@"phonology_iphone_set2_grey_11",@"phonology_iphone_set2_grey_12",@"phonology_iphone_set2_grey_13",@"phonology_iphone_set2_grey_14",@"phonology_iphone_set2_grey_15",@"phonology_iphone_set2_grey_16",@"phonology_iphone_set2_grey_17",@"phonology_iphone_set2_grey_18",@"phonology_iphone_set3_grey_1",@"phonology_iphone_set3_grey_2",@"phonology_iphone_set3_grey_3",@"phonology_iphone_set3_grey_4",@"phonology_iphone_set3_grey_5",@"phonology_iphone_set3_grey_6",@"phonology_iphone_set3_grey_7",@"phonology_iphone_set3_grey_8",@"phonology_iphone_set3_grey_9",@"phonology_iphone_set3_grey_10",@"phonology_iphone_set3_grey_11",@"phonology_iphone_set3_grey_12",@"phonology_iphone_set3_grey_13",@"phonology_iphone_set3_grey_14",@"phonology_iphone_set3_grey_15",@"phonology_iphone_set3_grey_16",@"phonology_ipad_set3_grey_17",@"phonology_ipad_set3_grey_18",@"phonology_iphone_set4_grey_1",@"phonology_iphone_set4_grey_2",@"phonology_iphone_set4_grey_3",@"phonology_iphone_set4_grey_4",@"phonology_iphone_set4_grey_5",@"phonology_iphone_set4_grey_6",@"phonology_iphone_set4_grey_7",@"phonology_iphone_set4_grey_8",@"phonology_iphone_set4_grey_9",@"phonology_iphone_set4_grey_10",@"phonology_iphone_set4_grey_11",@"phonology_iphone_set4_grey_12",@"phonology_iphone_set4_grey_13",@"phonology_iphone_set4_grey_14",@"phonology_iphone_set4_grey_15",@"phonology_iphone_set4_grey_16",@"phonology_iphone_set4_grey_17",@"phonology_iphone_set4_grey_18",@"phonology_ipad_set5_grey_1",@"phonology_ipad_set5_grey_2",@"phonology_iphone_set5_grey_3",@"phonology_iphone_set5_grey_4",@"phonology_iphone_set5_grey_5",@"phonology_iphone_set5_grey_6",@"phonology_iphone_set5_grey_7",@"phonology_iphone_set5_grey_8",@"phonology_iphone_set5_grey_9",@"phonology_iphone_set5_grey_10",@"phonology_iphone_set5_grey_11",@"phonology_iphone_set5_grey_12",@"phonology_iphone_set5_grey_13",@"phonology_iphone_set5_grey_14",@"phonology_iphone_set5_grey_15",@"phonology_ipad_set5_grey_16",@"phonology_ipad_set5_grey_17",@"phonology_iphone_set5_grey_18",@"phonology_iphone_set6_grey_1",@"phonology_iphone_set6_grey_2",@"phonology_iphone_set6_grey_3",@"phonology_iphone_set6_grey_4",@"phonology_iphone_set6_grey_5",@"phonology_iphone_set6_grey_6",@"phonology_iphone_set6_grey_7",@"phonology_iphone_set6_grey_8",@"phonology_iphone_set6_grey_9",@"phonology_iphone_set6_grey_10",@"phonology_iphone_set6_grey_11",@"phonology_iphone_set6_grey_12",@"phonology_iphone_set6_grey_13",@"phonology_iphone_set6_grey_14",@"phonology_iphone_set6_grey_15",@"phonology_iphone_set6_grey_16",@"phonology_iphone_set6_grey_17",@"phonology_iphone_set6_grey_18", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set1_original_1",@"phonology_iphone_set1_original_2",@"phonology_iphone_set1_original_3",@"phonology_iphone_set1_original_4",@"phonology_iphone_set1_original_5",@"phonology_iphone_set1_original_6",@"phonology_iphone_set1_original_7",@"phonology_iphone_set1_original_8",@"phonology_iphone_set1_original_9",@"phonology_iphone_set1_original_10",@"phonology_iphone_set1_original_11",@"phonology_iphone_set1_original_12",@"phonology_iphone_set1_original_13",@"phonology_iphone_set1_original_14",@"phonology_iphone_set1_original_15",@"phonology_iphone_set1_original_16",@"phonology_iphone_set2_original_1",@"phonology_iphone_set2_original_2",@"phonology_iphone_set2_original_3",@"phonology_iphone_set2_original_4",@"phonology_iphone_set2_original_5",@"phonology_iphone_set2_original_6",@"phonology_iphone_set2_original_7",@"phonology_iphone_set2_original_8",@"phonology_iphone_set2_original_9",@"phonology_iphone_set2_original_10",@"phonology_iphone_set2_original_11",@"phonology_iphone_set2_original_12",@"phonology_iphone_set2_original_13",@"phonology_iphone_set2_original_14",@"phonology_iphone_set2_original_15",@"phonology_iphone_set2_original_16",@"phonology_iphone_set2_original_17",@"phonology_iphone_set2_original_18",@"phonology_iphone_set3_original_1",@"phonology_iphone_set3_original_2",@"phonology_iphone_set3_original_3",@"phonology_iphone_set3_original_4",@"phonology_iphone_set3_original_5",@"phonology_iphone_set3_original_6",@"phonology_iphone_set3_original_7",@"phonology_iphone_set3_original_8",@"phonology_iphone_set3_original_9",@"phonology_iphone_set3_original_10",@"phonology_iphone_set3_original_11",@"phonology_iphone_set3_original_12",@"phonology_iphone_set3_original_13",@"phonology_iphone_set3_original_14",@"phonology_iphone_set3_original_15",@"phonology_iphone_set3_original_16",@"phonology_iphone_set3_original_17",@"phonology_iphone_set3_original_18",@"phonology_iphone_set4_original_1",@"phonology_iphone_set4_original_2",@"phonology_iphone_set4_original_3",@"phonology_iphone_set4_original_4",@"phonology_iphone_set4_original_5",@"phonology_iphone_set4_original_6",@"phonology_iphone_set4_original_7",@"phonology_iphone_set4_original_8",@"phonology_iphone_set4_original_9",@"phonology_iphone_set4_original_10",@"phonology_iphone_set4_original_11",@"phonology_iphone_set4_original_12",@"phonology_iphone_set4_original_13",@"phonology_iphone_set4_original_14",@"phonology_iphone_set4_original_15",@"phonology_iphone_set4_original_16",@"phonology_iphone_set4_original_17",@"phonology_iphone_set4_original_18",@"phonology_iphone_set5_original_1",@"phonology_iphone_set5_original_2",@"phonology_iphone_set5_original_3",@"phonology_iphone_set5_original_4",@"phonology_iphone_set5_original_5",@"phonology_iphone_set5_original_6",@"phonology_iphone_set5_original_7",@"phonology_iphone_set5_original_8",@"phonology_iphone_set5_original_9",@"phonology_iphone_set5_original_10",@"phonology_iphone_set5_original_11",@"phonology_iphone_set5_original_12",@"phonology_iphone_set5_original_13",@"phonology_iphone_set5_original_14",@"phonology_iphone_set5_original_15",@"phonology_iphone_set5_original_16",@"phonology_iphone_set5_original_17",@"phonology_iphone_set5_original_18",@"phonology_iphone_set6_original_1",@"phonology_iphone_set6_original_2",@"phonology_iphone_set6_original_3",@"phonology_iphone_set6_original_4",@"phonology_iphone_set6_original_5",@"phonology_iphone_set6_original_6",@"phonology_iphone_set6_original_7",@"phonology_iphone_set6_original_8",@"phonology_iphone_set6_original_9",@"phonology_iphone_set6_original_10",@"phonology_iphone_set6_original_11",@"phonology_iphone_set6_original_12",@"phonology_iphone_set6_original_13",@"phonology_iphone_set6_original_14",@"phonology_iphone_set6_original_15",@"phonology_iphone_set6_original_16",@"phonology_iphone_set6_original_17",@"phonology_iphone_set6_original_18", nil];
          
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_green_1",@"phonology_iphone_set1_green_2",@"phonology_iphone_set1_green_3",@"phonology_iphone_set1_green_4",@"phonology_iphone_set1_green_5",@"phonology_iphone_set1_green_6",@"phonology_iphone_set1_green_7",@"phonology_iphone_set1_green_8",@"phonology_iphone_set1_green_9",@"phonology_iphone_set1_green_10",@"phonology_iphone_set1_green_11",@"phonology_iphone_set1_green_12",@"phonology_iphone_set1_green_13",@"phonology_iphone_set1_green_14",@"phonology_iphone_set1_green_15",@"phonology_iphone_set1_green_16",@"phonology_iphone_set2_green_1",@"phonology_iphone_set2_green_2",@"phonology_iphone_set2_green_3",@"phonology_iphone_set2_green_4",@"phonology_iphone_set2_green_5",@"phonology_iphone_set2_green_6",@"phonology_iphone_set2_green_7",@"phonology_iphone_set2_green_8",@"phonology_iphone_set2_green_9",@"phonology_iphone_set2_green_10",@"phonology_iphone_set2_green_11",@"phonology_iphone_set2_green_12",@"phonology_iphone_set2_green_13",@"phonology_iphone_set2_green_14",@"phonology_iphone_set2_green_15",@"phonology_iphone_set2_green_16",@"phonology_iphone_set2_green_17",@"phonology_iphone_set2_green_18",@"phonology_iphone_set3_green_1",@"phonology_iphone_set3_green_2",@"phonology_iphone_set3_green_3",@"phonology_iphone_set3_green_4",@"phonology_iphone_set3_green_5",@"phonology_iphone_set3_green_6",@"phonology_iphone_set3_green_7",@"phonology_iphone_set3_green_8",@"phonology_iphone_set3_green_9",@"phonology_iphone_set3_green_10",@"phonology_iphone_set3_green_11",@"phonology_iphone_set3_green_12",@"phonology_iphone_set3_green_13",@"phonology_iphone_set3_green_14",@"phonology_iphone_set3_green_15",@"phonology_iphone_set3_green_16",@"phonology_iphone_set3_green_17",@"phonology_iphone_set3_green_18",@"phonology_iphone_set4_green_1",@"phonology_iphone_set4_green_2",@"phonology_iphone_set4_green_3",@"phonology_iphone_set4_green_4",@"phonology_iphone_set4_green_5",@"phonology_iphone_set4_green_6",@"phonology_iphone_set4_green_7",@"phonology_iphone_set4_green_8",@"phonology_iphone_set4_green_9",@"phonology_iphone_set4_green_10",@"phonology_iphone_set4_green_11",@"phonology_iphone_set4_green_12",@"phonology_iphone_set4_green_13",@"phonology_iphone_set4_green_14",@"phonology_iphone_set4_green_15",@"phonology_iphone_set4_green_16",@"phonology_iphone_set4_green_17",@"phonology_iphone_set4_green_18",@"phonology_iphone_set5_green_1",@"phonology_iphone_set5_green_2",@"phonology_iphone_set5_green_3",@"phonology_iphone_set5_green_4",@"phonology_iphone_set5_green_5",@"phonology_iphone_set5_green_6",@"phonology_iphone_set5_green_7",@"phonology_iphone_set5_green_8",@"phonology_iphone_set5_green_9",@"phonology_iphone_set5_green_10",@"phonology_iphone_set5_green_11",@"phonology_iphone_set5_green_12",@"phonology_iphone_set5_green_13",@"phonology_iphone_set5_green_14",@"phonology_iphone_set5_green_15",@"phonology_iphone_set5_green_16",@"phonology_iphone_set5_green_17",@"phonology_iphone_set5_green_18",@"phonology_iphone_set6_green_1",@"phonology_iphone_set6_green_2",@"phonology_iphone_set6_green_3",@"phonology_iphone_set6_green_4",@"phonology_iphone_set6_green_5",@"phonology_iphone_set6_green_6",@"phonology_iphone_set6_green_7",@"phonology_iphone_set6_green_8",@"phonology_iphone_set6_green_9",@"phonology_iphone_set6_green_10",@"phonology_iphone_set6_green_11",@"phonology_iphone_set6_green_12",@"phonology_iphone_set6_green_13",@"phonology_iphone_set6_green_14",@"phonology_iphone_set6_green_15",@"phonology_iphone_set6_green_16",@"phonology_iphone_set6_green_17",@"phonology_iphone_set6_green_18", nil];
          
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_red_1",@"phonology_iphone_set1_red_2",@"phonology_iphone_set1_red_3",@"phonology_iphone_set1_red_4",@"phonology_iphone_set1_red_5",@"phonology_iphone_set1_red_6",@"phonology_iphone_set1_red_7",@"phonology_iphone_set1_red_8",@"phonology_iphone_set1_red_9",@"phonology_iphone_set1_red_10",@"phonology_iphone_set1_red_11",@"phonology_iphone_set1_red_12",@"phonology_iphone_set1_red_13",@"phonology_iphone_set1_red_14",@"phonology_iphone_set1_red_15",@"phonology_iphone_set1_red_16",@"phonology_iphone_set2_red_1",@"phonology_iphone_set2_red_2",@"phonology_iphone_set2_red_3",@"phonology_iphone_set2_red_4",@"phonology_iphone_set2_red_5",@"phonology_iphone_set2_red_6",@"phonology_iphone_set2_red_7",@"phonology_iphone_set2_red_8",@"phonology_iphone_set2_red_9",@"phonology_iphone_set2_red_10",@"phonology_iphone_set2_red_11",@"phonology_iphone_set2_red_12",@"phonology_iphone_set2_red_13",@"phonology_iphone_set2_red_14",@"phonology_iphone_set2_red_15",@"phonology_iphone_set2_red_16",@"phonology_iphone_set2_red_17",@"phonology_iphone_set2_red_18",@"phonology_iphone_set3_red_1",@"phonology_iphone_set3_red_2",@"phonology_iphone_set3_red_3",@"phonology_iphone_set3_red_4",@"phonology_iphone_set3_red_5",@"phonology_iphone_set3_red_6",@"phonology_iphone_set3_red_7",@"phonology_iphone_set3_red_8",@"phonology_iphone_set3_red_9",@"phonology_iphone_set3_red_10",@"phonology_iphone_set3_red_11",@"phonology_iphone_set3_red_12",@"phonology_iphone_set3_red_13",@"phonology_iphone_set3_red_14",@"phonology_iphone_set3_red_15",@"phonology_iphone_set3_red_16",@"phonology_iphone_set3_red_17",@"phonology_iphone_set3_red_18",@"phonology_iphone_set4_red_1",@"phonology_iphone_set4_red_2",@"phonology_iphone_set4_red_3",@"phonology_iphone_set4_red_4",@"phonology_iphone_set4_red_5",@"phonology_iphone_set4_red_6",@"phonology_iphone_set4_red_7",@"phonology_iphone_set4_red_8",@"phonology_iphone_set4_red_9",@"phonology_iphone_set4_red_10",@"phonology_iphone_set4_red_11",@"phonology_iphone_set4_red_12",@"phonology_iphone_set4_red_13",@"phonology_iphone_set4_red_14",@"phonology_iphone_set4_red_15",@"phonology_iphone_set4_red_16",@"phonology_iphone_set4_red_17",@"phonology_iphone_set4_red_18",@"phonology_iphone_set5_red_1",@"phonology_iphone_set5_red_2",@"phonology_iphone_set5_red_3",@"phonology_iphone_set5_red_4",@"phonology_iphone_set5_red_5",@"phonology_iphone_set5_red_6",@"phonology_iphone_set5_red_7",@"phonology_iphone_set5_red_8",@"phonology_iphone_set5_red_9",@"phonology_iphone_set5_red_10",@"phonology_iphone_set5_red_11",@"phonology_iphone_set5_red_12",@"phonology_iphone_set5_red_13",@"phonology_iphone_set5_red_14",@"phonology_iphone_set5_red_15",@"phonology_iphone_set5_red_16",@"phonology_iphone_set5_red_17",@"phonology_iphone_set5_red_18",@"phonology_iphone_set6_red_1",@"phonology_iphone_set6_red_2",@"phonology_iphone_set6_red_3",@"phonology_iphone_set6_red_4",@"phonology_iphone_set6_red_5",@"phonology_iphone_set6_red_6",@"phonology_iphone_set6_red_7",@"phonology_iphone_set6_red_8",@"phonology_iphone_set6_red_9",@"phonology_iphone_set6_red_10",@"phonology_iphone_set6_red_11",@"phonology_iphone_set6_red_12",@"phonology_iphone_set6_red_13",@"phonology_iphone_set6_red_14",@"phonology_iphone_set6_red_15",@"phonology_iphone_set6_red_16",@"phonology_iphone_set6_red_17",@"phonology_iphone_set6_red_18", nil];
          
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50",@"51",@"52",@"53",@"54",@"55",@"56",@"57",@"58",@"59",@"60",@"61",@"62",@"63",@"64",@"65",@"66",@"67",@"68",@"69",@"70",@"71",@"72",@"73",@"74",@"75",@"76",@"77",@"78",@"79",@"80",@"81",@"82",@"83",@"84",@"85",@"86",@"87",@"88",@"89",@"90",@"91",@"92",@"93",@"94",@"95",@"96",@"97",@"98",@"99",@"100",@"101",@"102",@"103",@"104",@"105"]];
          
          
          
          [self loadQuestionsforAll];
          
      }

  }
   
  //////*******IPHONE6********///////
  else if (appDel.i==4)
  {
      if([MenuBtnTag_iphone6 isEqualToString:[NSString stringWithFormat:@"rhyming words set a"]])
      {
          rhymeA=true;
          
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with cat?",@"what rhymes with hat?",@"what rhymes with clock?",@"what rhymes with block?",@"what rhymes with bed?",@"what rhymes with bread?",@"what rhymes with blue?",@"what rhymes with shoe?",@"what rhymes with corn?",@"what rhymes with horn?",@"what rhymes with chair?",@"what rhymes with bear?",@"what rhymes with dog?",@"what rhymes with frog?",@"what rhymes with pail?",@"what rhymes with snail?",nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"hat",@"cat",@"block",@"clock",@"bread",@"bed",@"shoe",@"blue",@"horn",@"corn",@"bear",@"chair",@"frog",@"dog",@"snail",@"pail",nil];
          
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_grey_1",@"phonology_iphone_set1_grey_2",@"phonology_iphone_set1_grey_3",@"phonology_iphone_set1_grey_4",@"phonology_iphone_set1_grey_5",@"phonology_iphone_set1_grey_6",@"phonology_iphone_set1_grey_7",@"phonology_iphone_set1_grey_8",@"phonology_iphone_set1_grey_9",@"phonology_iphone_set1_grey_10",@"phonology_iphone_set1_grey_11",@"phonology_iphone_set1_grey_12",@"phonology_iphone_set1_grey_13",@"phonology_iphone_set1_grey_14",@"phonology_iphone_set1_grey_15",@"phonology_iphone_set1_grey_16", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set1_original_1",@"phonology_iphone_set1_original_2",@"phonology_iphone_set1_original_3",@"phonology_iphone_set1_original_4",@"phonology_iphone_set1_original_5",@"phonology_iphone_set1_original_6",@"phonology_iphone_set1_original_7",@"phonology_iphone_set1_original_8",@"phonology_iphone_set1_original_9",@"phonology_iphone_set1_original_10",@"phonology_iphone_set1_original_11",@"phonology_iphone_set1_original_12",@"phonology_iphone_set1_original_13",@"phonology_iphone_set1_original_14",@"phonology_iphone_set1_original_15",@"phonology_iphone_set1_original_16", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_green_1",@"phonology_iphone_set1_green_2",@"phonology_iphone_set1_green_3",@"phonology_iphone_set1_green_4",@"phonology_iphone_set1_green_5",@"phonology_iphone_set1_green_6",@"phonology_iphone_set1_green_7",@"phonology_iphone_set1_green_8",@"phonology_iphone_set1_green_9",@"phonology_iphone_set1_green_10",@"phonology_iphone_set1_green_11",@"phonology_iphone_set1_green_12",@"phonology_iphone_set1_green_13",@"phonology_iphone_set1_green_14",@"phonology_iphone_set1_green_15",@"phonology_iphone_set1_green_16", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_red_1",@"phonology_iphone_set1_red_2",@"phonology_iphone_set1_red_3",@"phonology_iphone_set1_red_4",@"phonology_iphone_set1_red_5",@"phonology_iphone_set1_red_6",@"phonology_iphone_set1_red_7",@"phonology_iphone_set1_red_8",@"phonology_iphone_set1_red_9",@"phonology_iphone_set1_red_10",@"phonology_iphone_set1_red_11",@"phonology_iphone_set1_red_12",@"phonology_iphone_set1_red_13",@"phonology_iphone_set1_red_14",@"phonology_iphone_set1_red_15",@"phonology_iphone_set1_red_16", nil];
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15"]];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"cat",@"hat",@"clock",@"block",@"bed",@"bread",@"blue",@"shoe",@"corn",@"horn",@"chair",@"bear",@"dog",@"frog",@"pail",@"snail", nil];
          [self loadQuestions];
          
      }
      
      else if([MenuBtnTag_iphone6 isEqualToString:[NSString stringWithFormat:@"rhyming words set b"]])
      {
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with crown?",@"what rhymes with clown?",@"what rhymes with shell?",@"what rhymes with bell?",@"what rhymes with flag?",@"what rhymes with bag?",@"what rhymes with pie?",@"what rhymes with tie?",@"what rhymes with basket?",@"what rhymes with blanket?",@"what rhymes with moon?",@"what rhymes with spoon?",@"what rhymes with tree?",@"what rhymes with bee?",@"what rhymes with coat?",@"what rhymes with boat?",@"what rhymes with boots?",@"what rhymes with fruits?",nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"clown",@"crown",@"bell",@"shell",@"bag",@"flag",@"tie",@"pie",@"blanket",@"basket",@"spoon",@"moon",@"bee",@"tree",@"boat",@"coat",@"fruits",@"boots",nil];
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set2_grey_1",@"phonology_iphone_set2_grey_2",@"phonology_iphone_set2_grey_3",@"phonology_iphone_set2_grey_4",@"phonology_iphone_set2_grey_5",@"phonology_iphone_set2_grey_6",@"phonology_iphone_set2_grey_7",@"phonology_iphone_set2_grey_8",@"phonology_iphone_set2_grey_9",@"phonology_iphone_set2_grey_10",@"phonology_iphone_set2_grey_11",@"phonology_iphone_set2_grey_12",@"phonology_iphone_set2_grey_13",@"phonology_iphone_set2_grey_14",@"phonology_iphone_set2_grey_15",@"phonology_iphone_set2_grey_16",@"phonology_iphone_set2_grey_17",@"phonology_iphone_set2_grey_18", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set2_original_1",@"phonology_iphone_set2_original_2",@"phonology_iphone_set2_original_3",@"phonology_iphone_set2_original_4",@"phonology_iphone_set2_original_5",@"phonology_iphone_set2_original_6",@"phonology_iphone_set2_original_7",@"phonology_iphone_set2_original_8",@"phonology_iphone_set2_original_9",@"phonology_iphone_set2_original_10",@"phonology_iphone_set2_original_11",@"phonology_iphone_set2_original_12",@"phonology_iphone_set2_original_13",@"phonology_iphone_set2_original_14",@"phonology_iphone_set2_original_15",@"phonology_iphone_set2_original_16",@"phonology_iphone_set2_original_17",@"phonology_iphone_set2_original_18", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set2_green_1",@"phonology_iphone_set2_green_2",@"phonology_iphone_set2_green_3",@"phonology_iphone_set2_green_4",@"phonology_iphone_set2_green_5",@"phonology_iphone_set2_green_6",@"phonology_iphone_set2_green_7",@"phonology_iphone_set2_green_8",@"phonology_iphone_set2_green_9",@"phonology_iphone_set2_green_10",@"phonology_iphone_set2_green_11",@"phonology_iphone_set2_green_12",@"phonology_iphone_set2_green_13",@"phonology_iphone_set2_green_14",@"phonology_iphone_set2_green_15",@"phonology_iphone_set2_green_16",@"phonology_iphone_set2_green_17",@"phonology_iphone_set2_green_18", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set2_red_1",@"phonology_iphone_set2_red_2",@"phonology_iphone_set2_red_3",@"phonology_iphone_set2_red_4",@"phonology_iphone_set2_red_5",@"phonology_iphone_set2_red_6",@"phonology_iphone_set2_red_7",@"phonology_iphone_set2_red_8",@"phonology_iphone_set2_red_9",@"phonology_iphone_set2_red_10",@"phonology_iphone_set2_red_11",@"phonology_iphone_set2_red_12",@"phonology_iphone_set2_red_13",@"phonology_iphone_set2_red_14",@"phonology_iphone_set2_red_15",@"phonology_iphone_set2_red_16",@"phonology_iphone_set2_red_17",@"phonology_iphone_set2_red_18", nil];
          
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"crown",@"clown",@"shell",@"bell",@"flag",@"bag",@"pie",@"tie",@"basket",@"blanket",@"moon",@"spoon",@"tree",@"bee",@"coat",@"boat",@"boots",@"fruits", nil];
          [self loadQuestions];
      }
      
      else if([MenuBtnTag_iphone6 isEqualToString:[NSString stringWithFormat:@"rhyming words set c"]])
      {
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with ice?",@"what rhymes with rice?",@"what rhymes with van?",@"what rhymes with pan?",@"what rhymes with glad?",@"what rhymes with sad?",@"what rhymes with rug?",@"what rhymes with mug?",@"what rhymes with cone?",@"what rhymes with telephone?",@"what rhymes with sink?",@"what rhymes with pink?",@"what rhymes with airplane?",@"what rhymes with train?",@"what rhymes with duck?",@"what rhymes with truck?",@"what rhymes with nest?",@"what rhymes with chest?",nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"rice",@"ice",@"pan",@"van",@"sad",@"glad",@"mug",@"rug",@"telephone",@"cone",@"pink",@"sink",@"train",@"airplane",@"truck",@"duck",@"chest",@"nest",nil];
          
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set3_grey_1",@"phonology_iphone_set3_grey_2",@"phonology_iphone_set3_grey_3",@"phonology_iphone_set3_grey_4",@"phonology_iphone_set3_grey_5",@"phonology_iphone_set3_grey_6",@"phonology_iphone_set3_grey_7",@"phonology_iphone_set3_grey_8",@"phonology_iphone_set3_grey_9",@"phonology_iphone_set3_grey_10",@"phonology_iphone_set3_grey_11",@"phonology_iphone_set3_grey_12",@"phonology_iphone_set3_grey_13",@"phonology_iphone_set3_grey_14",@"phonology_iphone_set3_grey_15",@"phonology_iphone_set3_grey_16",@"phonology_iphone_set3_grey_17",@"phonology_iphone_set3_grey_18", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set3_original_1",@"phonology_iphone_set3_original_2",@"phonology_iphone_set3_original_3",@"phonology_iphone_set3_original_4",@"phonology_iphone_set3_original_5",@"phonology_iphone_set3_original_6",@"phonology_iphone_set3_original_7",@"phonology_iphone_set3_original_8",@"phonology_iphone_set3_original_9",@"phonology_iphone_set3_original_10",@"phonology_iphone_set3_original_11",@"phonology_iphone_set3_original_12",@"phonology_iphone_set3_original_13",@"phonology_iphone_set3_original_14",@"phonology_iphone_set3_original_15",@"phonology_iphone_set3_original_16",@"phonology_iphone_set3_original_17",@"phonology_iphone_set3_original_18", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set3_green_1",@"phonology_iphone_set3_green_2",@"phonology_iphone_set3_green_3",@"phonology_iphone_set3_green_4",@"phonology_iphone_set3_green_5",@"phonology_iphone_set3_green_6",@"phonology_iphone_set3_green_7",@"phonology_iphone_set3_green_8",@"phonology_iphone_set3_green_9",@"phonology_iphone_set3_green_10",@"phonology_iphone_set3_green_11",@"phonology_iphone_set3_green_12",@"phonology_iphone_set3_green_13",@"phonology_iphone_set3_green_14",@"phonology_iphone_set3_green_15",@"phonology_iphone_set3_green_16",@"phonology_iphone_set3_green_17",@"phonology_iphone_set3_green_18", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set3_red_1",@"phonology_iphone_set3_red_2",@"phonology_iphone_set3_red_3",@"phonology_iphone_set3_red_4",@"phonology_iphone_set3_red_5",@"phonology_iphone_set3_red_6",@"phonology_iphone_set3_red_7",@"phonology_iphone_set3_red_8",@"phonology_iphone_set3_red_9",@"phonology_iphone_set3_red_10",@"phonology_iphone_set3_red_11",@"phonology_iphone_set3_red_12",@"phonology_iphone_set3_red_13",@"phonology_iphone_set3_red_14",@"phonology_iphone_set3_red_15",@"phonology_iphone_set3_red_16",@"phonology_iphone_set3_red_17",@"phonology_iphone_set3_red_18", nil];
          
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"ice",@"rice",@"van",@"pan",@"glad",@"sad",@"rug",@"mug",@"cone",@"telephone",@"sink",@"pink",@"airplane",@"train",@"duck",@"truck",@"nest",@"chest", nil];
          
          [self loadQuestions];
          
      }
      
      else if([MenuBtnTag_iphone6 isEqualToString:[NSString stringWithFormat:@"rhyming words set d"]])
      {
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with juice?",@"what rhymes with goose?",@"what rhymes with door?",@"what rhymes with four?",@"what rhymes with swing?",@"what rhymes with ring?",@"what rhymes with nose?",@"what rhymes with hose?",@"what rhymes with fire?",@"what rhymes with tire?",@"what rhymes with stamp?",@"what rhymes with lamp?",@"what rhymes with can?",@"what rhymes with fan?",@"what rhymes with otter?",@"what rhymes with water?",@"what rhymes with pot?",@"what rhymes with knot?",nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"goose",@"juice",@"four",@"door",@"ring",@"swing",@"hose",@"nose",@"tire",@"fire",@"lamp",@"stamp",@"fan",@"can",@"water",@"otter",@"knot",@"pot",nil];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"juice",@"goose",@"door",@"four",@"swing",@"ring",@"nose",@"hose",@"fire",@"tire",@"stamp",@"lamp",@"can",@"fan",@"otter",@"water",@"pot",@"knot", nil];
          
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set4_grey_1",@"phonology_iphone_set4_grey_2",@"phonology_iphone_set4_grey_3",@"phonology_iphone_set4_grey_4",@"phonology_iphone_set4_grey_5",@"phonology_iphone_set4_grey_6",@"phonology_iphone_set4_grey_7",@"phonology_iphone_set4_grey_8",@"phonology_iphone_set4_grey_9",@"phonology_iphone_set4_grey_10",@"phonology_iphone_set4_grey_11",@"phonology_iphone_set4_grey_12",@"phonology_iphone_set4_grey_13",@"phonology_iphone_set4_grey_14",@"phonology_iphone_set4_grey_15",@"phonology_iphone_set4_grey_16",@"phonology_iphone_set4_grey_17",@"phonology_iphone_set4_grey_18", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set4_original_1",@"phonology_iphone_set4_original_2",@"phonology_iphone_set4_original_3",@"phonology_iphone_set4_original_4",@"phonology_iphone_set4_original_5",@"phonology_iphone_set4_original_6",@"phonology_iphone_set4_original_7",@"phonology_iphone_set4_original_8",@"phonology_iphone_set4_original_9",@"phonology_iphone_set4_original_10",@"phonology_iphone_set4_original_11",@"phonology_iphone_set4_original_12",@"phonology_iphone_set4_original_13",@"phonology_iphone_set4_original_14",@"phonology_iphone_set4_original_15",@"phonology_iphone_set4_original_16",@"phonology_iphone_set4_original_17",@"phonology_iphone_set4_original_18", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set4_green_1",@"phonology_iphone_set4_green_2",@"phonology_iphone_set4_green_3",@"phonology_iphone_set4_green_4",@"phonology_iphone_set4_green_5",@"phonology_iphone_set4_green_6",@"phonology_iphone_set4_green_7",@"phonology_iphone_set4_green_8",@"phonology_iphone_set4_green_9",@"phonology_iphone_set4_green_10",@"phonology_iphone_set4_green_11",@"phonology_iphone_set4_green_12",@"phonology_iphone_set4_green_13",@"phonology_iphone_set4_green_14",@"phonology_iphone_set4_green_15",@"phonology_iphone_set4_green_16",@"phonology_iphone_set4_green_17",@"phonology_iphone_set4_green_18", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set4_red_1",@"phonology_iphone_set4_red_2",@"phonology_iphone_set4_red_3",@"phonology_iphone_set4_red_4",@"phonology_iphone_set4_red_5",@"phonology_iphone_set4_red_6",@"phonology_iphone_set4_red_7",@"phonology_iphone_set4_red_8",@"phonology_iphone_set4_red_9",@"phonology_iphone_set4_red_10",@"phonology_iphone_set4_red_11",@"phonology_iphone_set4_red_12",@"phonology_iphone_set4_red_13",@"phonology_iphone_set4_red_14",@"phonology_iphone_set4_red_15",@"phonology_iphone_set4_red_16",@"phonology_iphone_set4_red_17",@"phonology_iphone_set4_red_18", nil];
          
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
          
          [self loadQuestions];
      }
      
      else if([MenuBtnTag_iphone6 isEqualToString:[NSString stringWithFormat:@"rhyming words set e"]])
      {
          rhymeE=true;
          
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with jar?",@"what rhymes with guitar?",@"what rhymes with pillow?",@"what rhymes with yellow?",@"what rhymes with red?",@"what rhymes with sled?",@"what rhymes with monkey?",@"what rhymes with donkey?",@"what rhymes with fish?",@"what rhymes with dish?",@"what rhymes with kite?",@"what rhymes with white?",@"what rhymes with rake?",@"what rhymes with cake?",@"what rhymes with doll?",@"what rhymes with ball?",@"what rhymes with carrot?",@"what rhymes with parrot?",nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"guitar",@"jar",@"yellow",@"pillow",@"sled",@"red",@"donkey",@"monkey",@"dish",@"fish",@"white",@"kite",@"cake",@"rake",@"ball",@"doll",@"parrot",@"carrot",nil];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"jar",@"guitar",@"pillow",@"yellow",@"red",@"sled",@"monkey",@"donkey",@"fish",@"dish",@"kite",@"white",@"rake",@"cake",@"doll",@"ball",@"carrot",@"parrot", nil];
          
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set5_grey_1",@"phonology_iphone_set5_grey_2",@"phonology_iphone_set5_grey_3",@"phonology_iphone_set5_grey_4",@"phonology_iphone_set5_grey_5",@"phonology_iphone_set5_grey_6",@"phonology_iphone_set5_grey_7",@"phonology_iphone_set5_grey_8",@"phonology_iphone_set5_grey_9",@"phonology_iphone_set5_grey_10",@"phonology_iphone_set5_grey_11",@"phonology_iphone_set5_grey_12",@"phonology_iphone_set5_grey_13",@"phonology_iphone_set5_grey_14",@"phonology_iphone_set5_grey_15",@"phonology_iphone_set5_grey_16",@"phonology_iphone_set5_grey_17",@"phonology_iphone_set5_grey_18", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set5_original_1",@"phonology_iphone_set5_original_2",@"phonology_iphone_set5_original_3",@"phonology_iphone_set5_original_4",@"phonology_iphone_set5_original_5",@"phonology_iphone_set5_original_6",@"phonology_iphone_set5_original_7",@"phonology_iphone_set5_original_8",@"phonology_iphone_set5_original_9",@"phonology_iphone_set5_original_10",@"phonology_iphone_set5_original_11",@"phonology_iphone_set5_original_12",@"phonology_iphone_set5_original_13",@"phonology_iphone_set5_original_14",@"phonology_iphone_set5_original_15",@"phonology_iphone_set5_original_16",@"phonology_iphone_set5_original_17",@"phonology_iphone_set5_original_18", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set5_green_1",@"phonology_iphone_set5_green_2",@"phonology_iphone_set5_green_3",@"phonology_iphone_set5_green_4",@"phonology_iphone_set5_green_5",@"phonology_iphone_set5_green_6",@"phonology_iphone_set5_green_7",@"phonology_iphone_set5_green_8",@"phonology_iphone_set5_green_9",@"phonology_iphone_set5_green_10",@"phonology_iphone_set5_green_11",@"phonology_iphone_set5_green_12",@"phonology_iphone_set5_green_13",@"phonology_iphone_set5_green_14",@"phonology_iphone_set5_green_15",@"phonology_iphone_set5_green_16",@"phonology_iphone_set5_green_17",@"phonology_iphone_set5_green_18", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set5_red_1",@"phonology_iphone_set5_red_2",@"phonology_iphone_set5_red_3",@"phonology_iphone_set5_red_4",@"phonology_iphone_set5_red_5",@"phonology_iphone_set5_red_6",@"phonology_iphone_set5_red_7",@"phonology_iphone_set5_red_8",@"phonology_iphone_set5_red_9",@"phonology_iphone_set5_red_10",@"phonology_iphone_set5_red_11",@"phonology_iphone_set5_red_12",@"phonology_iphone_set5_red_13",@"phonology_iphone_set5_red_14",@"phonology_iphone_set5_red_15",@"phonology_iphone_set5_red_16",@"phonology_iphone_set5_red_17",@"phonology_iphone_set5_red_18", nil];
          
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
          
          [self loadQuestions];
      }
      
      else if([MenuBtnTag_iphone6 isEqualToString:[NSString stringWithFormat:@"rhyming words set f"]])
      {
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with fox?",@"what rhymes with box?",@"what rhymes with hen?",@"what rhymes with pen?",@"what rhymes with pizza?",@"what rhymes with zebra?",@"what rhymes with helmet?",@"what rhymes with  blanket?",@"what rhymes with soap?",@"what rhymes with rope?",@"what rhymes with green?",@"what rhymes with thirteen?",@"what rhymes with stool?",@"what rhymes with pool?",@"what rhymes with car?",@"what rhymes with star?",@"what rhymes with three?",@"what rhymes with key?",nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"box",@"fox",@"pen",@"hen",@"zebra",@"pizza",@" blanket",@"helmet",@"rope",@"soap",@"thirteen",@"green",@"pool",@"stool",@"star",@"car",@"key",@"three",nil];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"fox",@"box",@"hen",@"pen",@"pizza",@"zebra",@"helmet",@" blanket",@"soap",@"rope",@"green",@"thirteen",@"stool",@"pool",@"car",@"star",@"three", @"key",nil];
          
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set6_grey_1",@"phonology_iphone_set6_grey_2",@"phonology_iphone_set6_grey_3",@"phonology_iphone_set6_grey_4",@"phonology_iphone_set6_grey_5",@"phonology_iphone_set6_grey_6",@"phonology_iphone_set6_grey_7",@"phonology_iphone_set6_grey_8",@"phonology_iphone_set6_grey_9",@"phonology_iphone_set6_grey_10",@"phonology_iphone_set6_grey_11",@"phonology_iphone_set6_grey_12",@"phonology_iphone_set6_grey_13",@"phonology_iphone_set6_grey_14",@"phonology_iphone_set6_grey_15",@"phonology_iphone_set6_grey_16",@"phonology_iphone_set6_grey_17",@"phonology_iphone_set6_grey_18", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set6_original_1",@"phonology_iphone_set6_original_2",@"phonology_iphone_set6_original_3",@"phonology_iphone_set6_original_4",@"phonology_iphone_set6_original_5",@"phonology_iphone_set6_original_6",@"phonology_iphone_set6_original_7",@"phonology_iphone_set6_original_8",@"phonology_iphone_set6_original_9",@"phonology_iphone_set6_original_10",@"phonology_iphone_set6_original_11",@"phonology_iphone_set6_original_12",@"phonology_iphone_set6_original_13",@"phonology_iphone_set6_original_14",@"phonology_iphone_set6_original_15",@"phonology_iphone_set6_original_16",@"phonology_iphone_set6_original_17",@"phonology_iphone_set6_original_18", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set6_green_1",@"phonology_iphone_set6_green_2",@"phonology_iphone_set6_green_3",@"phonology_iphone_set6_green_4",@"phonology_iphone_set6_green_5",@"phonology_iphone_set6_green_6",@"phonology_iphone_set6_green_7",@"phonology_iphone_set6_green_8",@"phonology_iphone_set6_green_9",@"phonology_iphone_set6_green_10",@"phonology_iphone_set6_green_11",@"phonology_iphone_set6_green_12",@"phonology_iphone_set6_green_13",@"phonology_iphone_set6_green_14",@"phonology_iphone_set6_green_15",@"phonology_iphone_set6_green_16",@"phonology_iphone_set6_green_17",@"phonology_iphone_set6_green_18", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set6_red_1",@"phonology_iphone_set6_red_2",@"phonology_iphone_set6_red_3",@"phonology_iphone_set6_red_4",@"phonology_iphone_set6_red_5",@"phonology_iphone_set6_red_6",@"phonology_iphone_set6_red_7",@"phonology_iphone_set6_red_8",@"phonology_iphone_set6_red_9",@"phonology_iphone_set6_red_10",@"phonology_iphone_set6_red_11",@"phonology_iphone_set6_red_12",@"phonology_iphone_set6_red_13",@"phonology_iphone_set6_red_14",@"phonology_iphone_set6_red_15",@"phonology_iphone_set6_red_16",@"phonology_iphone_set6_red_17",@"phonology_iphone_set6_red_18", nil];
          
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
          
          [self loadQuestions];
      }
      
      else if([MenuBtnTag_iphone6 isEqualToString:[NSString stringWithFormat:@"all rhyming words"]])
      {
          rhymeAforAll=true;
          
          rhymeEforAll=true;
          
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with cat?",@"what rhymes with hat?",@"what rhymes with clock?",@"what rhymes with block?",@"what rhymes with bed?",@"what rhymes with bread?",@"what rhymes with blue?",@"what rhymes with shoe?",@"what rhymes with corn?",@"what rhymes with horn?",@"what rhymes with chair?",@"what rhymes with bear?",@"what rhymes with dog?",@"what rhymes with frog?",@"what rhymes with pail?",@"what rhymes with snail?",@"what rhymes with crown?",@"what rhymes with clown?",@"what rhymes with shell?",@"what rhymes with bell?",@"what rhymes with flag?",@"what rhymes with bag?",@"what rhymes with pie?",@"what rhymes with tie?",@"what rhymes with basket?",@"what rhymes with blanket?",@"what rhymes with moon?",@"what rhymes with spoon?",@"what rhymes with tree?",@"what rhymes with bee?",@"what rhymes with coat?",@"what rhymes with boat?",@"what rhymes with boots?",@"what rhymes with fruits?",@"what rhymes with ice?",@"what rhymes with rice?",@"what rhymes with van?",@"what rhymes with pan?",@"what rhymes with glad?",@"what rhymes with sad?",@"what rhymes with rug?",@"what rhymes with mug?",@"what rhymes with cone?",@"what rhymes with telephone?",@"what rhymes with sink?",@"what rhymes with pink?",@"what rhymes with airplane?",@"what rhymes with train?",@"what rhymes with duck?",@"what rhymes with truck?",@"what rhymes with nest?",@"what rhymes with chest?",@"what rhymes with juice?",@"what rhymes with goose?",@"what rhymes with door?",@"what rhymes with four?",@"what rhymes with swing?",@"what rhymes with ring?",@"what rhymes with nose?",@"what rhymes with hose?",@"what rhymes with fire?",@"what rhymes with tire?",@"what rhymes with stamp?",@"what rhymes with lamp?",@"what rhymes with can?",@"what rhymes with fan?",@"what rhymes with otter?",@"what rhymes with water?",@"what rhymes with pot?",@"what rhymes with knot?",@"what rhymes with jar?",@"what rhymes with guitar?",@"what rhymes with pillow?",@"what rhymes with yellow?",@"what rhymes with red?",@"what rhymes with sled?",@"what rhymes with monkey?",@"what rhymes with donkey?",@"what rhymes with fish?",@"what rhymes with dish?",@"what rhymes with kite?",@"what rhymes with white?",@"what rhymes with rake?",@"what rhymes with cake?",@"what rhymes with doll?",@"what rhymes with ball?",@"what rhymes with carrot?",@"what rhymes with parrot?",@"what rhymes with fox?",@"what rhymes with box?",@"what rhymes with hen?",@"what rhymes with pen?",@"what rhymes with pizza?",@"what rhymes with zebra?",@"what rhymes with helmet?",@"what rhymes with  blanket?",@"what rhymes with soap?",@"what rhymes with rope?",@"what rhymes with green?",@"what rhymes with thirteen?",@"what rhymes with stool?",@"what rhymes with pool?",@"what rhymes with car?",@"what rhymes with star?",@"what rhymes with three?",@"what rhymes with key?", nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"hat",@"cat",@"block",@"clock",@"bread",@"bed",@"shoe",@"blue",@"horn",@"corn",@"bear",@"chair",@"frog",@"dog",@"snail",@"pail",@"clown",@"crown",@"bell",@"shell",@"bag",@"flag",@"tie",@"pie",@"blanket",@"basket",@"spoon",@"moon",@"bee",@"tree",@"boat",@"coat",@"fruits",@"boots",@"rice",@"ice",@"pan",@"van",@"sad",@"glad",@"mug",@"rug",@"telephone",@"cone",@"pink",@"sink",@"train",@"airplane",@"truck",@"duck",@"chest",@"nest",@"goose",@"juice",@"four",@"door",@"ring",@"swing",@"hose",@"nose",@"tire",@"fire",@"lamp",@"stamp",@"fan",@"can",@"water",@"otter",@"knot",@"pot",@"guitar",@"jar",@"yellow",@"pillow",@"sled",@"red",@"donkey",@"monkey",@"dish",@"fish",@"white",@"kite",@"cake",@"rake",@"ball",@"doll",@"parrot",@"carrot",@"box",@"fox",@"pen",@"hen",@"zebra",@"pizza",@" blanket",@"helmet",@"rope",@"soap",@"thirteen",@"green",@"pool",@"stool",@"star",@"car",@"key",@"three",nil];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"cat",@"hat",@"clock",@"block",@"bed",@"bread",@"blue",@"shoe",@"corn",@"horn",@"chair",@"bear",@"dog",@"frog",@"pail",@"snail",@"crown",@"clown",@"shell",@"bell",@"flag",@"bag",@"pie",@"tie",@"basket",@"blanket",@"moon",@"spoon",@"tree",@"bee",@"coat",@"boat",@"boots",@"fruits",@"ice",@"rice",@"van",@"pan",@"glad",@"sad",@"rug",@"mug",@"cone",@"telephone",@"sink",@"pink",@"airplane",@"train",@"duck",@"truck",@"nest",@"chest",@"juice",@"goose",@"door",@"four",@"swing",@"ring",@"nose",@"hose",@"fire",@"tire",@"stamp",@"lamp",@"can",@"fan",@"otter",@"water",@"pot",@"knot",@"jar",@"guitar",@"pillow",@"yellow",@"red",@"sled",@"monkey",@"donkey",@"fish",@"dish",@"kite",@"white",@"rake",@"cake",@"doll",@"ball",@"carrot",@"parrot",@"fox",@"box",@"hen",@"pen",@"pizza",@"zebra",@"helmet",@" blanket",@"soap",@"rope",@"green",@"thirteen",@"stool",@"pool",@"car",@"star",@"three", @"key", nil];
          
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_grey_1",@"phonology_iphone_set1_grey_2",@"phonology_iphone_set1_grey_3",@"phonology_iphone_set1_grey_4",@"phonology_iphone_set1_grey_5",@"phonology_iphone_set1_grey_6",@"phonology_iphone_set1_grey_7",@"phonology_iphone_set1_grey_8",@"phonology_iphone_set1_grey_9",@"phonology_iphone_set1_grey_10",@"phonology_iphone_set1_grey_11",@"phonology_iphone_set1_grey_12",@"phonology_iphone_set1_grey_13",@"phonology_iphone_set1_grey_14",@"phonology_iphone_set1_grey_15",@"phonology_iphone_set1_grey_16",@"phonology_iphone_set2_grey_1",@"phonology_iphone_set2_grey_2",@"phonology_iphone_set2_grey_3",@"phonology_iphone_set2_grey_4",@"phonology_iphone_set2_grey_5",@"phonology_iphone_set2_grey_6",@"phonology_iphone_set2_grey_7",@"phonology_iphone_set2_grey_8",@"phonology_iphone_set2_grey_9",@"phonology_iphone_set2_grey_10",@"phonology_iphone_set2_grey_11",@"phonology_iphone_set2_grey_12",@"phonology_iphone_set2_grey_13",@"phonology_iphone_set2_grey_14",@"phonology_iphone_set2_grey_15",@"phonology_iphone_set2_grey_16",@"phonology_iphone_set2_grey_17",@"phonology_iphone_set2_grey_18",@"phonology_iphone_set3_grey_1",@"phonology_iphone_set3_grey_2",@"phonology_iphone_set3_grey_3",@"phonology_iphone_set3_grey_4",@"phonology_iphone_set3_grey_5",@"phonology_iphone_set3_grey_6",@"phonology_iphone_set3_grey_7",@"phonology_iphone_set3_grey_8",@"phonology_iphone_set3_grey_9",@"phonology_iphone_set3_grey_10",@"phonology_iphone_set3_grey_11",@"phonology_iphone_set3_grey_12",@"phonology_iphone_set3_grey_13",@"phonology_iphone_set3_grey_14",@"phonology_iphone_set3_grey_15",@"phonology_iphone_set3_grey_16",@"phonology_ipad_set3_grey_17",@"phonology_ipad_set3_grey_18",@"phonology_iphone_set4_grey_1",@"phonology_iphone_set4_grey_2",@"phonology_iphone_set4_grey_3",@"phonology_iphone_set4_grey_4",@"phonology_iphone_set4_grey_5",@"phonology_iphone_set4_grey_6",@"phonology_iphone_set4_grey_7",@"phonology_iphone_set4_grey_8",@"phonology_iphone_set4_grey_9",@"phonology_iphone_set4_grey_10",@"phonology_iphone_set4_grey_11",@"phonology_iphone_set4_grey_12",@"phonology_iphone_set4_grey_13",@"phonology_iphone_set4_grey_14",@"phonology_iphone_set4_grey_15",@"phonology_iphone_set4_grey_16",@"phonology_iphone_set4_grey_17",@"phonology_iphone_set4_grey_18",@"phonology_ipad_set5_grey_1",@"phonology_ipad_set5_grey_2",@"phonology_iphone_set5_grey_3",@"phonology_iphone_set5_grey_4",@"phonology_iphone_set5_grey_5",@"phonology_iphone_set5_grey_6",@"phonology_iphone_set5_grey_7",@"phonology_iphone_set5_grey_8",@"phonology_iphone_set5_grey_9",@"phonology_iphone_set5_grey_10",@"phonology_iphone_set5_grey_11",@"phonology_iphone_set5_grey_12",@"phonology_iphone_set5_grey_13",@"phonology_iphone_set5_grey_14",@"phonology_iphone_set5_grey_15",@"phonology_ipad_set5_grey_16",@"phonology_ipad_set5_grey_17",@"phonology_iphone_set5_grey_18",@"phonology_iphone_set6_grey_1",@"phonology_iphone_set6_grey_2",@"phonology_iphone_set6_grey_3",@"phonology_iphone_set6_grey_4",@"phonology_iphone_set6_grey_5",@"phonology_iphone_set6_grey_6",@"phonology_iphone_set6_grey_7",@"phonology_iphone_set6_grey_8",@"phonology_iphone_set6_grey_9",@"phonology_iphone_set6_grey_10",@"phonology_iphone_set6_grey_11",@"phonology_iphone_set6_grey_12",@"phonology_iphone_set6_grey_13",@"phonology_iphone_set6_grey_14",@"phonology_iphone_set6_grey_15",@"phonology_iphone_set6_grey_16",@"phonology_iphone_set6_grey_17",@"phonology_iphone_set6_grey_18", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set1_original_1",@"phonology_iphone_set1_original_2",@"phonology_iphone_set1_original_3",@"phonology_iphone_set1_original_4",@"phonology_iphone_set1_original_5",@"phonology_iphone_set1_original_6",@"phonology_iphone_set1_original_7",@"phonology_iphone_set1_original_8",@"phonology_iphone_set1_original_9",@"phonology_iphone_set1_original_10",@"phonology_iphone_set1_original_11",@"phonology_iphone_set1_original_12",@"phonology_iphone_set1_original_13",@"phonology_iphone_set1_original_14",@"phonology_iphone_set1_original_15",@"phonology_iphone_set1_original_16",@"phonology_iphone_set2_original_1",@"phonology_iphone_set2_original_2",@"phonology_iphone_set2_original_3",@"phonology_iphone_set2_original_4",@"phonology_iphone_set2_original_5",@"phonology_iphone_set2_original_6",@"phonology_iphone_set2_original_7",@"phonology_iphone_set2_original_8",@"phonology_iphone_set2_original_9",@"phonology_iphone_set2_original_10",@"phonology_iphone_set2_original_11",@"phonology_iphone_set2_original_12",@"phonology_iphone_set2_original_13",@"phonology_iphone_set2_original_14",@"phonology_iphone_set2_original_15",@"phonology_iphone_set2_original_16",@"phonology_iphone_set2_original_17",@"phonology_iphone_set2_original_18",@"phonology_iphone_set3_original_1",@"phonology_iphone_set3_original_2",@"phonology_iphone_set3_original_3",@"phonology_iphone_set3_original_4",@"phonology_iphone_set3_original_5",@"phonology_iphone_set3_original_6",@"phonology_iphone_set3_original_7",@"phonology_iphone_set3_original_8",@"phonology_iphone_set3_original_9",@"phonology_iphone_set3_original_10",@"phonology_iphone_set3_original_11",@"phonology_iphone_set3_original_12",@"phonology_iphone_set3_original_13",@"phonology_iphone_set3_original_14",@"phonology_iphone_set3_original_15",@"phonology_iphone_set3_original_16",@"phonology_iphone_set3_original_17",@"phonology_iphone_set3_original_18",@"phonology_iphone_set4_original_1",@"phonology_iphone_set4_original_2",@"phonology_iphone_set4_original_3",@"phonology_iphone_set4_original_4",@"phonology_iphone_set4_original_5",@"phonology_iphone_set4_original_6",@"phonology_iphone_set4_original_7",@"phonology_iphone_set4_original_8",@"phonology_iphone_set4_original_9",@"phonology_iphone_set4_original_10",@"phonology_iphone_set4_original_11",@"phonology_iphone_set4_original_12",@"phonology_iphone_set4_original_13",@"phonology_iphone_set4_original_14",@"phonology_iphone_set4_original_15",@"phonology_iphone_set4_original_16",@"phonology_iphone_set4_original_17",@"phonology_iphone_set4_original_18",@"phonology_iphone_set5_original_1",@"phonology_iphone_set5_original_2",@"phonology_iphone_set5_original_3",@"phonology_iphone_set5_original_4",@"phonology_iphone_set5_original_5",@"phonology_iphone_set5_original_6",@"phonology_iphone_set5_original_7",@"phonology_iphone_set5_original_8",@"phonology_iphone_set5_original_9",@"phonology_iphone_set5_original_10",@"phonology_iphone_set5_original_11",@"phonology_iphone_set5_original_12",@"phonology_iphone_set5_original_13",@"phonology_iphone_set5_original_14",@"phonology_iphone_set5_original_15",@"phonology_iphone_set5_original_16",@"phonology_iphone_set5_original_17",@"phonology_iphone_set5_original_18",@"phonology_iphone_set6_original_1",@"phonology_iphone_set6_original_2",@"phonology_iphone_set6_original_3",@"phonology_iphone_set6_original_4",@"phonology_iphone_set6_original_5",@"phonology_iphone_set6_original_6",@"phonology_iphone_set6_original_7",@"phonology_iphone_set6_original_8",@"phonology_iphone_set6_original_9",@"phonology_iphone_set6_original_10",@"phonology_iphone_set6_original_11",@"phonology_iphone_set6_original_12",@"phonology_iphone_set6_original_13",@"phonology_iphone_set6_original_14",@"phonology_iphone_set6_original_15",@"phonology_iphone_set6_original_16",@"phonology_iphone_set6_original_17",@"phonology_iphone_set6_original_18", nil];
          
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_green_1",@"phonology_iphone_set1_green_2",@"phonology_iphone_set1_green_3",@"phonology_iphone_set1_green_4",@"phonology_iphone_set1_green_5",@"phonology_iphone_set1_green_6",@"phonology_iphone_set1_green_7",@"phonology_iphone_set1_green_8",@"phonology_iphone_set1_green_9",@"phonology_iphone_set1_green_10",@"phonology_iphone_set1_green_11",@"phonology_iphone_set1_green_12",@"phonology_iphone_set1_green_13",@"phonology_iphone_set1_green_14",@"phonology_iphone_set1_green_15",@"phonology_iphone_set1_green_16",@"phonology_iphone_set2_green_1",@"phonology_iphone_set2_green_2",@"phonology_iphone_set2_green_3",@"phonology_iphone_set2_green_4",@"phonology_iphone_set2_green_5",@"phonology_iphone_set2_green_6",@"phonology_iphone_set2_green_7",@"phonology_iphone_set2_green_8",@"phonology_iphone_set2_green_9",@"phonology_iphone_set2_green_10",@"phonology_iphone_set2_green_11",@"phonology_iphone_set2_green_12",@"phonology_iphone_set2_green_13",@"phonology_iphone_set2_green_14",@"phonology_iphone_set2_green_15",@"phonology_iphone_set2_green_16",@"phonology_iphone_set2_green_17",@"phonology_iphone_set2_green_18",@"phonology_iphone_set3_green_1",@"phonology_iphone_set3_green_2",@"phonology_iphone_set3_green_3",@"phonology_iphone_set3_green_4",@"phonology_iphone_set3_green_5",@"phonology_iphone_set3_green_6",@"phonology_iphone_set3_green_7",@"phonology_iphone_set3_green_8",@"phonology_iphone_set3_green_9",@"phonology_iphone_set3_green_10",@"phonology_iphone_set3_green_11",@"phonology_iphone_set3_green_12",@"phonology_iphone_set3_green_13",@"phonology_iphone_set3_green_14",@"phonology_iphone_set3_green_15",@"phonology_iphone_set3_green_16",@"phonology_iphone_set3_green_17",@"phonology_iphone_set3_green_18",@"phonology_iphone_set4_green_1",@"phonology_iphone_set4_green_2",@"phonology_iphone_set4_green_3",@"phonology_iphone_set4_green_4",@"phonology_iphone_set4_green_5",@"phonology_iphone_set4_green_6",@"phonology_iphone_set4_green_7",@"phonology_iphone_set4_green_8",@"phonology_iphone_set4_green_9",@"phonology_iphone_set4_green_10",@"phonology_iphone_set4_green_11",@"phonology_iphone_set4_green_12",@"phonology_iphone_set4_green_13",@"phonology_iphone_set4_green_14",@"phonology_iphone_set4_green_15",@"phonology_iphone_set4_green_16",@"phonology_iphone_set4_green_17",@"phonology_iphone_set4_green_18",@"phonology_iphone_set5_green_1",@"phonology_iphone_set5_green_2",@"phonology_iphone_set5_green_3",@"phonology_iphone_set5_green_4",@"phonology_iphone_set5_green_5",@"phonology_iphone_set5_green_6",@"phonology_iphone_set5_green_7",@"phonology_iphone_set5_green_8",@"phonology_iphone_set5_green_9",@"phonology_iphone_set5_green_10",@"phonology_iphone_set5_green_11",@"phonology_iphone_set5_green_12",@"phonology_iphone_set5_green_13",@"phonology_iphone_set5_green_14",@"phonology_iphone_set5_green_15",@"phonology_iphone_set5_green_16",@"phonology_iphone_set5_green_17",@"phonology_iphone_set5_green_18",@"phonology_iphone_set6_green_1",@"phonology_iphone_set6_green_2",@"phonology_iphone_set6_green_3",@"phonology_iphone_set6_green_4",@"phonology_iphone_set6_green_5",@"phonology_iphone_set6_green_6",@"phonology_iphone_set6_green_7",@"phonology_iphone_set6_green_8",@"phonology_iphone_set6_green_9",@"phonology_iphone_set6_green_10",@"phonology_iphone_set6_green_11",@"phonology_iphone_set6_green_12",@"phonology_iphone_set6_green_13",@"phonology_iphone_set6_green_14",@"phonology_iphone_set6_green_15",@"phonology_iphone_set6_green_16",@"phonology_iphone_set6_green_17",@"phonology_iphone_set6_green_18", nil];
          
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_red_1",@"phonology_iphone_set1_red_2",@"phonology_iphone_set1_red_3",@"phonology_iphone_set1_red_4",@"phonology_iphone_set1_red_5",@"phonology_iphone_set1_red_6",@"phonology_iphone_set1_red_7",@"phonology_iphone_set1_red_8",@"phonology_iphone_set1_red_9",@"phonology_iphone_set1_red_10",@"phonology_iphone_set1_red_11",@"phonology_iphone_set1_red_12",@"phonology_iphone_set1_red_13",@"phonology_iphone_set1_red_14",@"phonology_iphone_set1_red_15",@"phonology_iphone_set1_red_16",@"phonology_iphone_set2_red_1",@"phonology_iphone_set2_red_2",@"phonology_iphone_set2_red_3",@"phonology_iphone_set2_red_4",@"phonology_iphone_set2_red_5",@"phonology_iphone_set2_red_6",@"phonology_iphone_set2_red_7",@"phonology_iphone_set2_red_8",@"phonology_iphone_set2_red_9",@"phonology_iphone_set2_red_10",@"phonology_iphone_set2_red_11",@"phonology_iphone_set2_red_12",@"phonology_iphone_set2_red_13",@"phonology_iphone_set2_red_14",@"phonology_iphone_set2_red_15",@"phonology_iphone_set2_red_16",@"phonology_iphone_set2_red_17",@"phonology_iphone_set2_red_18",@"phonology_iphone_set3_red_1",@"phonology_iphone_set3_red_2",@"phonology_iphone_set3_red_3",@"phonology_iphone_set3_red_4",@"phonology_iphone_set3_red_5",@"phonology_iphone_set3_red_6",@"phonology_iphone_set3_red_7",@"phonology_iphone_set3_red_8",@"phonology_iphone_set3_red_9",@"phonology_iphone_set3_red_10",@"phonology_iphone_set3_red_11",@"phonology_iphone_set3_red_12",@"phonology_iphone_set3_red_13",@"phonology_iphone_set3_red_14",@"phonology_iphone_set3_red_15",@"phonology_iphone_set3_red_16",@"phonology_iphone_set3_red_17",@"phonology_iphone_set3_red_18",@"phonology_iphone_set4_red_1",@"phonology_iphone_set4_red_2",@"phonology_iphone_set4_red_3",@"phonology_iphone_set4_red_4",@"phonology_iphone_set4_red_5",@"phonology_iphone_set4_red_6",@"phonology_iphone_set4_red_7",@"phonology_iphone_set4_red_8",@"phonology_iphone_set4_red_9",@"phonology_iphone_set4_red_10",@"phonology_iphone_set4_red_11",@"phonology_iphone_set4_red_12",@"phonology_iphone_set4_red_13",@"phonology_iphone_set4_red_14",@"phonology_iphone_set4_red_15",@"phonology_iphone_set4_red_16",@"phonology_iphone_set4_red_17",@"phonology_iphone_set4_red_18",@"phonology_iphone_set5_red_1",@"phonology_iphone_set5_red_2",@"phonology_iphone_set5_red_3",@"phonology_iphone_set5_red_4",@"phonology_iphone_set5_red_5",@"phonology_iphone_set5_red_6",@"phonology_iphone_set5_red_7",@"phonology_iphone_set5_red_8",@"phonology_iphone_set5_red_9",@"phonology_iphone_set5_red_10",@"phonology_iphone_set5_red_11",@"phonology_iphone_set5_red_12",@"phonology_iphone_set5_red_13",@"phonology_iphone_set5_red_14",@"phonology_iphone_set5_red_15",@"phonology_iphone_set5_red_16",@"phonology_iphone_set5_red_17",@"phonology_iphone_set5_red_18",@"phonology_iphone_set6_red_1",@"phonology_iphone_set6_red_2",@"phonology_iphone_set6_red_3",@"phonology_iphone_set6_red_4",@"phonology_iphone_set6_red_5",@"phonology_iphone_set6_red_6",@"phonology_iphone_set6_red_7",@"phonology_iphone_set6_red_8",@"phonology_iphone_set6_red_9",@"phonology_iphone_set6_red_10",@"phonology_iphone_set6_red_11",@"phonology_iphone_set6_red_12",@"phonology_iphone_set6_red_13",@"phonology_iphone_set6_red_14",@"phonology_iphone_set6_red_15",@"phonology_iphone_set6_red_16",@"phonology_iphone_set6_red_17",@"phonology_iphone_set6_red_18", nil];
          
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50",@"51",@"52",@"53",@"54",@"55",@"56",@"57",@"58",@"59",@"60",@"61",@"62",@"63",@"64",@"65",@"66",@"67",@"68",@"69",@"70",@"71",@"72",@"73",@"74",@"75",@"76",@"77",@"78",@"79",@"80",@"81",@"82",@"83",@"84",@"85",@"86",@"87",@"88",@"89",@"90",@"91",@"92",@"93",@"94",@"95",@"96",@"97",@"98",@"99",@"100",@"101",@"102",@"103",@"104",@"105"]];
          
          
          
          [self loadQuestionsforAll];
          
      }
      
  }
    
 //////******IPHONE6 PLUS******//////
  else if (appDel.i==5)
  {
      if([MenuBtnTag_iphone6plus isEqualToString:[NSString stringWithFormat:@"rhyming words set a"]])
      {
          rhymeA=true;
          
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with cat?",@"what rhymes with hat?",@"what rhymes with clock?",@"what rhymes with block?",@"what rhymes with bed?",@"what rhymes with bread?",@"what rhymes with blue?",@"what rhymes with shoe?",@"what rhymes with corn?",@"what rhymes with horn?",@"what rhymes with chair?",@"what rhymes with bear?",@"what rhymes with dog?",@"what rhymes with frog?",@"what rhymes with pail?",@"what rhymes with snail?",nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"hat",@"cat",@"block",@"clock",@"bread",@"bed",@"shoe",@"blue",@"horn",@"corn",@"bear",@"chair",@"frog",@"dog",@"snail",@"pail",nil];
          
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_grey_1",@"phonology_iphone_set1_grey_2",@"phonology_iphone_set1_grey_3",@"phonology_iphone_set1_grey_4",@"phonology_iphone_set1_grey_5",@"phonology_iphone_set1_grey_6",@"phonology_iphone_set1_grey_7",@"phonology_iphone_set1_grey_8",@"phonology_iphone_set1_grey_9",@"phonology_iphone_set1_grey_10",@"phonology_iphone_set1_grey_11",@"phonology_iphone_set1_grey_12",@"phonology_iphone_set1_grey_13",@"phonology_iphone_set1_grey_14",@"phonology_iphone_set1_grey_15",@"phonology_iphone_set1_grey_16",nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set1_original_1",@"phonology_iphone_set1_original_2",@"phonology_iphone_set1_original_3",@"phonology_iphone_set1_original_4",@"phonology_iphone_set1_original_5",@"phonology_iphone_set1_original_6",@"phonology_iphone_set1_original_7",@"phonology_iphone_set1_original_8",@"phonology_iphone_set1_original_9",@"phonology_iphone_set1_original_10",@"phonology_iphone_set1_original_11",@"phonology_iphone_set1_original_12",@"phonology_iphone_set1_original_13",@"phonology_iphone_set1_original_14",@"phonology_iphone_set1_original_15",@"phonology_iphone_set1_original_16", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_green_1",@"phonology_iphone_set1_green_2",@"phonology_iphone_set1_green_3",@"phonology_iphone_set1_green_4",@"phonology_iphone_set1_green_5",@"phonology_iphone_set1_green_6",@"phonology_iphone_set1_green_7",@"phonology_iphone_set1_green_8",@"phonology_iphone_set1_green_9",@"phonology_iphone_set1_green_10",@"phonology_iphone_set1_green_11",@"phonology_iphone_set1_green_12",@"phonology_iphone_set1_green_13",@"phonology_iphone_set1_green_14",@"phonology_iphone_set1_green_15",@"phonology_iphone_set1_green_16", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_red_1",@"phonology_iphone_set1_red_2",@"phonology_iphone_set1_red_3",@"phonology_iphone_set1_red_4",@"phonology_iphone_set1_red_5",@"phonology_iphone_set1_red_6",@"phonology_iphone_set1_red_7",@"phonology_iphone_set1_red_8",@"phonology_iphone_set1_red_9",@"phonology_iphone_set1_red_10",@"phonology_iphone_set1_red_11",@"phonology_iphone_set1_red_12",@"phonology_iphone_set1_red_13",@"phonology_iphone_set1_red_14",@"phonology_iphone_set1_red_15",@"phonology_iphone_set1_red_16", nil];
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15"]];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"cat",@"hat",@"clock",@"block",@"bed",@"bread",@"blue",@"shoe",@"corn",@"horn",@"chair",@"bear",@"dog",@"frog",@"pail",@"snail", nil];
          [self loadQuestions];
          
      }
      
      else if([MenuBtnTag_iphone6plus isEqualToString:[NSString stringWithFormat:@"rhyming words set b"]])
      {
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with crown?",@"what rhymes with clown?",@"what rhymes with shell?",@"what rhymes with bell?",@"what rhymes with flag?",@"what rhymes with bag?",@"what rhymes with pie?",@"what rhymes with tie?",@"what rhymes with basket?",@"what rhymes with blanket?",@"what rhymes with moon?",@"what rhymes with spoon?",@"what rhymes with tree?",@"what rhymes with bee?",@"what rhymes with coat?",@"what rhymes with boat?",@"what rhymes with boots?",@"what rhymes with fruits?",nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"clown",@"crown",@"bell",@"shell",@"bag",@"flag",@"tie",@"pie",@"blanket",@"basket",@"spoon",@"moon",@"bee",@"tree",@"boat",@"coat",@"fruits",@"boots",nil];
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set2_grey_1",@"phonology_iphone_set2_grey_2",@"phonology_iphone_set2_grey_3",@"phonology_iphone_set2_grey_4",@"phonology_iphone_set2_grey_5",@"phonology_iphone_set2_grey_6",@"phonology_iphone_set2_grey_7",@"phonology_iphone_set2_grey_8",@"phonology_iphone_set2_grey_9",@"phonology_iphone_set2_grey_10",@"phonology_iphone_set2_grey_11",@"phonology_iphone_set2_grey_12",@"phonology_iphone_set2_grey_13",@"phonology_iphone_set2_grey_14",@"phonology_iphone_set2_grey_15",@"phonology_iphone_set2_grey_16",@"phonology_iphone_set2_grey_17",@"phonology_iphone_set2_grey_18", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set2_original_1",@"phonology_iphone_set2_original_2",@"phonology_iphone_set2_original_3",@"phonology_iphone_set2_original_4",@"phonology_iphone_set2_original_5",@"phonology_iphone_set2_original_6",@"phonology_iphone_set2_original_7",@"phonology_iphone_set2_original_8",@"phonology_iphone_set2_original_9",@"phonology_iphone_set2_original_10",@"phonology_iphone_set2_original_11",@"phonology_iphone_set2_original_12",@"phonology_iphone_set2_original_13",@"phonology_iphone_set2_original_14",@"phonology_iphone_set2_original_15",@"phonology_iphone_set2_original_16",@"phonology_iphone_set2_original_17",@"phonology_iphone_set2_original_18", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set2_green_1",@"phonology_iphone_set2_green_2",@"phonology_iphone_set2_green_3",@"phonology_iphone_set2_green_4",@"phonology_iphone_set2_green_5",@"phonology_iphone_set2_green_6",@"phonology_iphone_set2_green_7",@"phonology_iphone_set2_green_8",@"phonology_iphone_set2_green_9",@"phonology_iphone_set2_green_10",@"phonology_iphone_set2_green_11",@"phonology_iphone_set2_green_12",@"phonology_iphone_set2_green_13",@"phonology_iphone_set2_green_14",@"phonology_iphone_set2_green_15",@"phonology_iphone_set2_green_16",@"phonology_iphone_set2_green_17",@"phonology_iphone_set2_green_18", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set2_red_1",@"phonology_iphone_set2_red_2",@"phonology_iphone_set2_red_3",@"phonology_iphone_set2_red_4",@"phonology_iphone_set2_red_5",@"phonology_iphone_set2_red_6",@"phonology_iphone_set2_red_7",@"phonology_iphone_set2_red_8",@"phonology_iphone_set2_red_9",@"phonology_iphone_set2_red_10",@"phonology_iphone_set2_red_11",@"phonology_iphone_set2_red_12",@"phonology_iphone_set2_red_13",@"phonology_iphone_set2_red_14",@"phonology_iphone_set2_red_15",@"phonology_iphone_set2_red_16",@"phonology_iphone_set2_red_17",@"phonology_iphone_set2_red_18", nil];
          
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"crown",@"clown",@"shell",@"bell",@"flag",@"bag",@"pie",@"tie",@"basket",@"blanket",@"moon",@"spoon",@"tree",@"bee",@"coat",@"boat",@"boots",@"fruits", nil];
          [self loadQuestions];
      }
      
      else if([MenuBtnTag_iphone6plus isEqualToString:[NSString stringWithFormat:@"rhyming words set c"]])
      {
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with ice?",@"what rhymes with rice?",@"what rhymes with van?",@"what rhymes with pan?",@"what rhymes with glad?",@"what rhymes with sad?",@"what rhymes with rug?",@"what rhymes with mug?",@"what rhymes with cone?",@"what rhymes with telephone?",@"what rhymes with sink?",@"what rhymes with pink?",@"what rhymes with airplane?",@"what rhymes with train?",@"what rhymes with duck?",@"what rhymes with truck?",@"what rhymes with nest?",@"what rhymes with chest?",nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"rice",@"ice",@"pan",@"van",@"sad",@"glad",@"mug",@"rug",@"telephone",@"cone",@"pink",@"sink",@"train",@"airplane",@"truck",@"duck",@"chest",@"nest",nil];
          
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set3_grey_1",@"phonology_iphone_set3_grey_2",@"phonology_iphone_set3_grey_3",@"phonology_iphone_set3_grey_4",@"phonology_iphone_set3_grey_5",@"phonology_iphone_set3_grey_6",@"phonology_iphone_set3_grey_7",@"phonology_iphone_set3_grey_8",@"phonology_iphone_set3_grey_9",@"phonology_iphone_set3_grey_10",@"phonology_iphone_set3_grey_11",@"phonology_iphone_set3_grey_12",@"phonology_iphone_set3_grey_13",@"phonology_iphone_set3_grey_14",@"phonology_iphone_set3_grey_15",@"phonology_iphone_set3_grey_16",@"phonology_iphone_set3_grey_17",@"phonology_iphone_set3_grey_18", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set3_original_1",@"phonology_iphone_set3_original_2",@"phonology_iphone_set3_original_3",@"phonology_iphone_set3_original_4",@"phonology_iphone_set3_original_5",@"phonology_iphone_set3_original_6",@"phonology_iphone_set3_original_7",@"phonology_iphone_set3_original_8",@"phonology_iphone_set3_original_9",@"phonology_iphone_set3_original_10",@"phonology_iphone_set3_original_11",@"phonology_iphone_set3_original_12",@"phonology_iphone_set3_original_13",@"phonology_iphone_set3_original_14",@"phonology_iphone_set3_original_15",@"phonology_iphone_set3_original_16",@"phonology_iphone_set3_original_17",@"phonology_iphone_set3_original_18", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set3_green_1",@"phonology_iphone_set3_green_2",@"phonology_iphone_set3_green_3",@"phonology_iphone_set3_green_4",@"phonology_iphone_set3_green_5",@"phonology_iphone_set3_green_6",@"phonology_iphone_set3_green_7",@"phonology_iphone_set3_green_8",@"phonology_iphone_set3_green_9",@"phonology_iphone_set3_green_10",@"phonology_iphone_set3_green_11",@"phonology_iphone_set3_green_12",@"phonology_iphone_set3_green_13",@"phonology_iphone_set3_green_14",@"phonology_iphone_set3_green_15",@"phonology_iphone_set3_green_16",@"phonology_iphone_set3_green_17",@"phonology_iphone_set3_green_18", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set3_red_1",@"phonology_iphone_set3_red_2",@"phonology_iphone_set3_red_3",@"phonology_iphone_set3_red_4",@"phonology_iphone_set3_red_5",@"phonology_iphone_set3_red_6",@"phonology_iphone_set3_red_7",@"phonology_iphone_set3_red_8",@"phonology_iphone_set3_red_9",@"phonology_iphone_set3_red_10",@"phonology_iphone_set3_red_11",@"phonology_iphone_set3_red_12",@"phonology_iphone_set3_red_13",@"phonology_iphone_set3_red_14",@"phonology_iphone_set3_red_15",@"phonology_iphone_set3_red_16",@"phonology_iphone_set3_red_17",@"phonology_iphone_set3_red_18", nil];
          
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"ice",@"rice",@"van",@"pan",@"glad",@"sad",@"rug",@"mug",@"cone",@"telephone",@"sink",@"pink",@"airplane",@"train",@"duck",@"truck",@"nest",@"chest", nil];
          
          [self loadQuestions];
          
      }
      
      else if([MenuBtnTag_iphone6plus isEqualToString:[NSString stringWithFormat:@"rhyming words set d"]])
      {
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with juice?",@"what rhymes with goose?",@"what rhymes with door?",@"what rhymes with four?",@"what rhymes with swing?",@"what rhymes with ring?",@"what rhymes with nose?",@"what rhymes with hose?",@"what rhymes with fire?",@"what rhymes with tire?",@"what rhymes with stamp?",@"what rhymes with lamp?",@"what rhymes with can?",@"what rhymes with fan?",@"what rhymes with otter?",@"what rhymes with water?",@"what rhymes with pot?",@"what rhymes with knot?",nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"goose",@"juice",@"four",@"door",@"ring",@"swing",@"hose",@"nose",@"tire",@"fire",@"lamp",@"stamp",@"fan",@"can",@"water",@"otter",@"knot",@"pot",nil];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"juice",@"goose",@"door",@"four",@"swing",@"ring",@"nose",@"hose",@"fire",@"tire",@"stamp",@"lamp",@"can",@"fan",@"otter",@"water",@"pot",@"knot", nil];
          
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set4_grey_1",@"phonology_iphone_set4_grey_2",@"phonology_iphone_set4_grey_3",@"phonology_iphone_set4_grey_4",@"phonology_iphone_set4_grey_5",@"phonology_iphone_set4_grey_6",@"phonology_iphone_set4_grey_7",@"phonology_iphone_set4_grey_8",@"phonology_iphone_set4_grey_9",@"phonology_iphone_set4_grey_10",@"phonology_iphone_set4_grey_11",@"phonology_iphone_set4_grey_12",@"phonology_iphone_set4_grey_13",@"phonology_iphone_set4_grey_14",@"phonology_iphone_set4_grey_15",@"phonology_iphone_set4_grey_16",@"phonology_iphone_set4_grey_17",@"phonology_iphone_set4_grey_18", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set4_original_1",@"phonology_iphone_set4_original_2",@"phonology_iphone_set4_original_3",@"phonology_iphone_set4_original_4",@"hone_set4_original_5",@"phonology_iphone_set4_original_6",@"phonology_iphone_set4_original_7",@"phonology_iphone_set4_original_8",@"phonology_iphone_set4_original_9",@"phonology_iphone_set4_original_10",@"phonology_iphone_set4_original_11",@"phonology_iphone_set4_original_12",@"phonology_iphone_set4_original_13",@"phonology_iphone_set4_original_14",@"phonology_iphone_set4_original_15",@"phonology_iphone_set4_original_16",@"phonology_iphone_set4_original_17",@"phonology_iphone_set4_original_18", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set4_green_1",@"phonology_iphone_set4_green_2",@"phonology_iphone_set4_green_3",@"phonology_iphone_set4_green_4",@"phonology_iphone_set4_green_5",@"phonology_iphone_set4_green_6",@"phonology_iphone_set4_green_7",@"phonology_iphone_set4_green_8",@"phonology_iphone_set4_green_9",@"phonology_iphone_set4_green_10",@"phonology_iphone_set4_green_11",@"phonology_iphone_set4_green_12",@"phonology_iphone_set4_green_13",@"phonology_iphone_set4_green_14",@"phonology_iphone_set4_green_15",@"phonology_iphone_set4_green_16",@"phonology_iphone_set4_green_17",@"phonology_iphone_set4_green_18", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set4_red_1",@"phonology_iphone_set4_red_2",@"phonology_iphone_set4_red_3",@"phonology_iphone_set4_red_4",@"phonology_iphone_set4_red_5",@"phonology_iphone_set4_red_6",@"phonology_iphone_set4_red_7",@"phonology_iphone_set4_red_8",@"phonology_iphone_set4_red_9",@"phonology_iphone_set4_red_10",@"phonology_iphone_set4_red_11",@"phonology_iphone_set4_red_12",@"phonology_iphone_set4_red_13",@"phonology_iphone_set4_red_14",@"phonology_iphone_set4_red_15",@"phonology_iphone_set4_red_16",@"phonology_iphone_set4_red_17",@"phonology_iphone_set4_red_18", nil];
          
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
          
          [self loadQuestions];
      }
      
      else if([MenuBtnTag_iphone6plus isEqualToString:[NSString stringWithFormat:@"rhyming words set e"]])
      {
          rhymeE=true;
          
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with jar?",@"what rhymes with guitar?",@"what rhymes with pillow?",@"what rhymes with yellow?",@"what rhymes with red?",@"what rhymes with sled?",@"what rhymes with monkey?",@"what rhymes with donkey?",@"what rhymes with fish?",@"what rhymes with dish?",@"what rhymes with kite?",@"what rhymes with white?",@"what rhymes with rake?",@"what rhymes with cake?",@"what rhymes with doll?",@"what rhymes with ball?",@"what rhymes with carrot?",@"what rhymes with parrot?",nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"guitar",@"jar",@"yellow",@"pillow",@"sled",@"red",@"donkey",@"monkey",@"dish",@"fish",@"white",@"kite",@"cake",@"rake",@"ball",@"doll",@"parrot",@"carrot",nil];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"jar",@"guitar",@"pillow",@"yellow",@"red",@"sled",@"monkey",@"donkey",@"fish",@"dish",@"kite",@"white",@"rake",@"cake",@"doll",@"ball",@"carrot",@"parrot", nil];
          
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set5_grey_1",@"phonology_iphone_set5_grey_2",@"phonology_iphone_set5_grey_3",@"phonology_iphone_set5_grey_4",@"phonology_iphone_set5_grey_5",@"phonology_iphone_set5_grey_6",@"phonology_iphone_set5_grey_7",@"phonology_iphone_set5_grey_8",@"phonology_iphone_set5_grey_9",@"phonology_iphone_set5_grey_10",@"phonology_iphone_set5_grey_11",@"phonology_iphone_set5_grey_12",@"phonology_iphone_set5_grey_13",@"phonology_iphone_set5_grey_14",@"phonology_iphone_set5_grey_15",@"phonology_iphone_set5_grey_16",@"phonology_iphone_set5_grey_17",@"phonology_iphone_set5_grey_18", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set5_original_1",@"phonology_iphone_set5_original_2",@"phonology_iphone_set5_original_3",@"phonology_iphone_set5_original_4",@"phonology_iphone_set5_original_5",@"phonology_iphone_set5_original_6",@"phonology_iphone_set5_original_7",@"phonology_iphone_set5_original_8",@"phonology_iphone_set5_original_9",@"phonology_iphone_set5_original_10",@"phonology_iphone_set5_original_11",@"phonology_iphone_set5_original_12",@"phonology_iphone_set5_original_13",@"phonology_iphone_set5_original_14",@"phonology_iphone_set5_original_15",@"phonology_iphone_set5_original_16",@"phonology_iphone_set5_original_17",@"phonology_iphone_set5_original_18", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set5_green_1",@"phonology_iphone_set5_green_2",@"phonology_iphone_set5_green_3",@"phonology_iphone_set5_green_4",@"phonology_iphone_set5_green_5",@"phonology_iphone_set5_green_6",@"phonology_iphone_set5_green_7",@"phonology_iphone_set5_green_8",@"phonology_iphone_set5_green_9",@"phonology_iphone_set5_green_10",@"phonology_iphone_set5_green_11",@"phonology_iphone_set5_green_12",@"phonology_iphone_set5_green_13",@"phonology_iphone_set5_green_14",@"phonology_iphone_set5_green_15",@"phonology_iphone_set5_green_16",@"phonology_iphone_set5_green_17",@"phonology_iphone_set5_green_18", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set5_red_1",@"phonology_iphone_set5_red_2",@"phonology_iphone_set5_red_3",@"phonology_iphone_set5_red_4",@"phonology_iphone_set5_red_5",@"phonology_iphone_set5_red_6",@"phonology_iphone_set5_red_7",@"phonology_iphone_set5_red_8",@"phonology_iphone_set5_red_9",@"phonology_iphone_set5_red_10",@"phonology_iphone_set5_red_11",@"phonology_iphone_set5_red_12",@"phonology_iphone_set5_red_13",@"phonology_iphone_set5_red_14",@"phonology_iphone_set5_red_15",@"phonology_iphone_set5_red_16",@"phonology_iphone_set5_red_17",@"phonology_iphone_set5_red_18", nil];
          
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
          
          [self loadQuestions];
      }
      
      else if([MenuBtnTag_iphone6plus isEqualToString:[NSString stringWithFormat:@"rhyming words set f"]])
      {
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with fox?",@"what rhymes with box?",@"what rhymes with hen?",@"what rhymes with pen?",@"what rhymes with pizza?",@"what rhymes with zebra?",@"what rhymes with helmet?",@"what rhymes with  blanket?",@"what rhymes with soap?",@"what rhymes with rope?",@"what rhymes with green?",@"what rhymes with thirteen?",@"what rhymes with stool?",@"what rhymes with pool?",@"what rhymes with car?",@"what rhymes with star?",@"what rhymes with three?",@"what rhymes with key?",nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"box",@"fox",@"pen",@"hen",@"zebra",@"pizza",@" blanket",@"helmet",@"rope",@"soap",@"thirteen",@"green",@"pool",@"stool",@"star",@"car",@"key",@"three",nil];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"fox",@"box",@"hen",@"pen",@"pizza",@"zebra",@"helmet",@" blanket",@"soap",@"rope",@"green",@"thirteen",@"stool",@"pool",@"car",@"star",@"three", @"key",nil];
          
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set6_grey_1",@"phonology_iphone_set6_grey_2",@"phonology_iphone_set6_grey_3",@"phonology_iphone_set6_grey_4",@"phonology_iphone_set6_grey_5",@"phonology_iphone_set6_grey_6",@"phonology_iphone_set6_grey_7",@"phonology_iphone_set6_grey_8",@"phonology_iphone_set6_grey_9",@"phonology_iphone_set6_grey_10",@"phonology_iphone_set6_grey_11",@"phonology_iphone_set6_grey_12",@"phonology_iphone_set6_grey_13",@"phonology_iphone_set6_grey_14",@"phonology_iphone_set6_grey_15",@"phonology_iphone_set6_grey_16",@"phonology_iphone_set6_grey_17",@"phonology_iphone_set6_grey_18", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set6_original_1",@"phonology_iphone_set6_original_2",@"phonology_iphone_set6_original_3",@"phonology_iphone_set6_original_4",@"phonology_iphone_set6_original_5",@"phonology_iphone_set6_original_6",@"phonology_iphone_set6_original_7",@"phonology_iphone_set6_original_8",@"phonology_iphone_set6_original_9",@"phonology_iphone_set6_original_10",@"phonology_iphone_set6_original_11",@"phonology_iphone_set6_original_12",@"phonology_iphone_set6_original_13",@"phonology_iphone_set6_original_14",@"phonology_iphone_set6_original_15",@"phonology_iphone_set6_original_16",@"phonology_iphone_set6_original_17",@"phonology_iphone_set6_original_18", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set6_green_1",@"phonology_iphone_set6_green_2",@"phonology_iphone_set6_green_3",@"phonology_iphone_set6_green_4",@"phonology_iphone_set6_green_5",@"phonology_iphone_set6_green_6",@"phonology_iphone_set6_green_7",@"phonology_iphone_set6_green_8",@"phonology_iphone_set6_green_9",@"phonology_iphone_set6_green_10",@"phonology_iphone_set6_green_11",@"phonology_iphone_set6_green_12",@"phonology_iphone_set6_green_13",@"phonology_iphone_set6_green_14",@"phonology_iphone_set6_green_15",@"phonology_iphone_set6_green_16",@"phonology_iphone_set6_green_17",@"phonology_iphone_set6_green_18", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set6_red_1",@"phonology_iphone_set6_red_2",@"phonology_iphone_set6_red_3",@"phonology_iphone_set6_red_4",@"phonology_iphone_set6_red_5",@"phonology_iphone_set6_red_6",@"phonology_iphone_set6_red_7",@"phonology_iphone_set6_red_8",@"phonology_iphone_set6_red_9",@"phonology_iphone_set6_red_10",@"phonology_iphone_set6_red_11",@"phonology_iphone_set6_red_12",@"phonology_iphone_set6_red_13",@"phonology_iphone_set6_red_14",@"phonology_iphone_set6_red_15",@"phonology_iphone_set6_red_16",@"phonology_iphone_set6_red_17",@"phonology_iphone_set6_red_18", nil];
          
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
          
          [self loadQuestions];
      }
      
      else if([MenuBtnTag_iphone6plus isEqualToString:[NSString stringWithFormat:@"all rhyming words"]])
      {
          rhymeAforAll=true;
          
          rhymeEforAll=true;
          
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with cat?",@"what rhymes with hat?",@"what rhymes with clock?",@"what rhymes with block?",@"what rhymes with bed?",@"what rhymes with bread?",@"what rhymes with blue?",@"what rhymes with shoe?",@"what rhymes with corn?",@"what rhymes with horn?",@"what rhymes with chair?",@"what rhymes with bear?",@"what rhymes with dog?",@"what rhymes with frog?",@"what rhymes with pail?",@"what rhymes with snail?",@"what rhymes with crown?",@"what rhymes with clown?",@"what rhymes with shell?",@"what rhymes with bell?",@"what rhymes with flag?",@"what rhymes with bag?",@"what rhymes with pie?",@"what rhymes with tie?",@"what rhymes with basket?",@"what rhymes with blanket?",@"what rhymes with moon?",@"what rhymes with spoon?",@"what rhymes with tree?",@"what rhymes with bee?",@"what rhymes with coat?",@"what rhymes with boat?",@"what rhymes with boots?",@"what rhymes with fruits?",@"what rhymes with ice?",@"what rhymes with rice?",@"what rhymes with van?",@"what rhymes with pan?",@"what rhymes with glad?",@"what rhymes with sad?",@"what rhymes with rug?",@"what rhymes with mug?",@"what rhymes with cone?",@"what rhymes with telephone?",@"what rhymes with sink?",@"what rhymes with pink?",@"what rhymes with airplane?",@"what rhymes with train?",@"what rhymes with duck?",@"what rhymes with truck?",@"what rhymes with nest?",@"what rhymes with chest?",@"what rhymes with juice?",@"what rhymes with goose?",@"what rhymes with door?",@"what rhymes with four?",@"what rhymes with swing?",@"what rhymes with ring?",@"what rhymes with nose?",@"what rhymes with hose?",@"what rhymes with fire?",@"what rhymes with tire?",@"what rhymes with stamp?",@"what rhymes with lamp?",@"what rhymes with can?",@"what rhymes with fan?",@"what rhymes with otter?",@"what rhymes with water?",@"what rhymes with pot?",@"what rhymes with knot?",@"what rhymes with jar?",@"what rhymes with guitar?",@"what rhymes with pillow?",@"what rhymes with yellow?",@"what rhymes with red?",@"what rhymes with sled?",@"what rhymes with monkey?",@"what rhymes with donkey?",@"what rhymes with fish?",@"what rhymes with dish?",@"what rhymes with kite?",@"what rhymes with white?",@"what rhymes with rake?",@"what rhymes with cake?",@"what rhymes with doll?",@"what rhymes with ball?",@"what rhymes with carrot?",@"what rhymes with parrot?",@"what rhymes with fox?",@"what rhymes with box?",@"what rhymes with hen?",@"what rhymes with pen?",@"what rhymes with pizza?",@"what rhymes with zebra?",@"what rhymes with helmet?",@"what rhymes with  blanket?",@"what rhymes with soap?",@"what rhymes with rope?",@"what rhymes with green?",@"what rhymes with thirteen?",@"what rhymes with stool?",@"what rhymes with pool?",@"what rhymes with car?",@"what rhymes with star?",@"what rhymes with three?",@"what rhymes with key?", nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"hat",@"cat",@"block",@"clock",@"bread",@"bed",@"shoe",@"blue",@"horn",@"corn",@"bear",@"chair",@"frog",@"dog",@"snail",@"pail",@"clown",@"crown",@"bell",@"shell",@"bag",@"flag",@"tie",@"pie",@"blanket",@"basket",@"spoon",@"moon",@"bee",@"tree",@"boat",@"coat",@"fruits",@"boots",@"rice",@"ice",@"pan",@"van",@"sad",@"glad",@"mug",@"rug",@"telephone",@"cone",@"pink",@"sink",@"train",@"airplane",@"truck",@"duck",@"chest",@"nest",@"goose",@"juice",@"four",@"door",@"ring",@"swing",@"hose",@"nose",@"tire",@"fire",@"lamp",@"stamp",@"fan",@"can",@"water",@"otter",@"knot",@"pot",@"guitar",@"jar",@"yellow",@"pillow",@"sled",@"red",@"donkey",@"monkey",@"dish",@"fish",@"white",@"kite",@"cake",@"rake",@"ball",@"doll",@"parrot",@"carrot",@"box",@"fox",@"pen",@"hen",@"zebra",@"pizza",@" blanket",@"helmet",@"rope",@"soap",@"thirteen",@"green",@"pool",@"stool",@"star",@"car",@"key",@"three",nil];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"cat",@"hat",@"clock",@"block",@"bed",@"bread",@"blue",@"shoe",@"corn",@"horn",@"chair",@"bear",@"dog",@"frog",@"pail",@"snail",@"crown",@"clown",@"shell",@"bell",@"flag",@"bag",@"pie",@"tie",@"basket",@"blanket",@"moon",@"spoon",@"tree",@"bee",@"coat",@"boat",@"boots",@"fruits",@"ice",@"rice",@"van",@"pan",@"glad",@"sad",@"rug",@"mug",@"cone",@"telephone",@"sink",@"pink",@"airplane",@"train",@"duck",@"truck",@"nest",@"chest",@"juice",@"goose",@"door",@"four",@"swing",@"ring",@"nose",@"hose",@"fire",@"tire",@"stamp",@"lamp",@"can",@"fan",@"otter",@"water",@"pot",@"knot",@"jar",@"guitar",@"pillow",@"yellow",@"red",@"sled",@"monkey",@"donkey",@"fish",@"dish",@"kite",@"white",@"rake",@"cake",@"doll",@"ball",@"carrot",@"parrot",@"fox",@"box",@"hen",@"pen",@"pizza",@"zebra",@"helmet",@" blanket",@"soap",@"rope",@"green",@"thirteen",@"stool",@"pool",@"car",@"star",@"three", @"key", nil];
          
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_grey_1",@"phonology_iphone_set1_grey_2",@"phonology_iphone_set1_grey_3",@"phonology_iphone_set1_grey_4",@"phonology_iphone_set1_grey_5",@"phonology_iphone_set1_grey_6",@"phonology_iphone_set1_grey_7",@"phonology_iphone_set1_grey_8",@"phonology_iphone_set1_grey_9",@"phonology_iphone_set1_grey_10",@"phonology_iphone_set1_grey_11",@"phonology_iphone_set1_grey_12",@"phonology_iphone_set1_grey_13",@"phonology_iphone_set1_grey_14",@"phonology_iphone_set1_grey_15",@"phonology_iphone_set1_grey_16",@"phonology_iphone_set2_grey_1",@"phonology_iphone_set2_grey_2",@"phonology_iphone_set2_grey_3",@"phonology_iphone_set2_grey_4",@"phonology_iphone_set2_grey_5",@"phonology_iphone_set2_grey_6",@"phonology_iphone_set2_grey_7",@"phonology_iphone_set2_grey_8",@"phonology_iphone_set2_grey_9",@"phonology_iphone_set2_grey_10",@"phonology_iphone_set2_grey_11",@"phonology_iphone_set2_grey_12",@"phonology_iphone_set2_grey_13",@"phonology_iphone_set2_grey_14",@"phonology_iphone_set2_grey_15",@"phonology_iphone_set2_grey_16",@"phonology_iphone_set2_grey_17",@"phonology_iphone_set2_grey_18",@"phonology_iphone_set3_grey_1",@"phonology_iphone_set3_grey_2",@"phonology_iphone_set3_grey_3",@"phonology_iphone_set3_grey_4",@"phonology_iphone_set3_grey_5",@"phonology_iphone_set3_grey_6",@"phonology_iphone_set3_grey_7",@"phonology_iphone_set3_grey_8",@"phonology_iphone_set3_grey_9",@"phonology_iphone_set3_grey_10",@"phonology_iphone_set3_grey_11",@"phonology_iphone_set3_grey_12",@"phonology_iphone_set3_grey_13",@"phonology_iphone_set3_grey_14",@"phonology_iphone_set3_grey_15",@"phonology_iphone_set3_grey_16",@"phonology_ipad_set3_grey_17",@"phonology_ipad_set3_grey_18",@"phonology_iphone_set4_grey_1",@"phonology_iphone_set4_grey_2",@"phonology_iphone_set4_grey_3",@"phonology_iphone_set4_grey_4",@"phonology_iphone_set4_grey_5",@"phonology_iphone_set4_grey_6",@"phonology_iphone_set4_grey_7",@"phonology_iphone_set4_grey_8",@"phonology_iphone_set4_grey_9",@"phonology_iphone_set4_grey_10",@"phonology_iphone_set4_grey_11",@"phonology_iphone_set4_grey_12",@"phonology_iphone_set4_grey_13",@"phonology_iphone_set4_grey_14",@"phonology_iphone_set4_grey_15",@"phonology_iphone_set4_grey_16",@"phonology_iphone_set4_grey_17",@"phonology_iphone_set4_grey_18",@"phonology_ipad_set5_grey_1",@"phonology_ipad_set5_grey_2",@"phonology_iphone_set5_grey_3",@"phonology_iphone_set5_grey_4",@"phonology_iphone_set5_grey_5",@"phonology_iphone_set5_grey_6",@"phonology_iphone_set5_grey_7",@"phonology_iphone_set5_grey_8",@"phonology_iphone_set5_grey_9",@"phonology_iphone_set5_grey_10",@"phonology_iphone_set5_grey_11",@"phonology_iphone_set5_grey_12",@"phonology_iphone_set5_grey_13",@"phonology_iphone_set5_grey_14",@"phonology_iphone_set5_grey_15",@"phonology_ipad_set5_grey_16",@"phonology_ipad_set5_grey_17",@"phonology_iphone_set5_grey_18",@"phonology_iphone_set6_grey_1",@"phonology_iphone_set6_grey_2",@"phonology_iphone_set6_grey_3",@"phonology_iphone_set6_grey_4",@"phonology_iphone_set6_grey_5",@"phonology_iphone_set6_grey_6",@"phonology_iphone_set6_grey_7",@"phonology_iphone_set6_grey_8",@"phonology_iphone_set6_grey_9",@"phonology_iphone_set6_grey_10",@"phonology_iphone_set6_grey_11",@"phonology_iphone_set6_grey_12",@"phonology_iphone_set6_grey_13",@"phonology_iphone_set6_grey_14",@"phonology_iphone_set6_grey_15",@"phonology_iphone_set6_grey_16",@"phonology_iphone_set6_grey_17",@"phonology_iphone_set6_grey_18", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_iphone_set1_original_1",@"phonology_iphone_set1_original_2",@"phonology_iphone_set1_original_3",@"phonology_iphone_set1_original_4",@"phonology_iphone_set1_original_5",@"phonology_iphone_set1_original_6",@"phonology_iphone_set1_original_7",@"phonology_iphone_set1_original_8",@"phonology_iphone_set1_original_9",@"phonology_iphone_set1_original_10",@"phonology_iphone_set1_original_11",@"phonology_iphone_set1_original_12",@"phonology_iphone_set1_original_13",@"phonology_iphone_set1_original_14",@"phonology_iphone_set1_original_15",@"phonology_iphone_set1_original_16",@"phonology_iphone_set2_original_1",@"phonology_iphone_set2_original_2",@"phonology_iphone_set2_original_3",@"phonology_iphone_set2_original_4",@"phonology_iphone_set2_original_5",@"phonology_iphone_set2_original_6",@"phonology_iphone_set2_original_7",@"phonology_iphone_set2_original_8",@"phonology_iphone_set2_original_9",@"phonology_iphone_set2_original_10",@"phonology_iphone_set2_original_11",@"phonology_iphone_set2_original_12",@"phonology_iphone_set2_original_13",@"phonology_iphone_set2_original_14",@"phonology_iphone_set2_original_15",@"phonology_iphone_set2_original_16",@"phonology_iphone_set2_original_17",@"phonology_iphone_set2_original_18",@"phonology_iphone_set3_original_1",@"phonology_iphone_set3_original_2",@"phonology_iphone_set3_original_3",@"phonology_iphone_set3_original_4",@"phonology_iphone_set3_original_5",@"phonology_iphone_set3_original_6",@"phonology_iphone_set3_original_7",@"phonology_iphone_set3_original_8",@"phonology_iphone_set3_original_9",@"phonology_iphone_set3_original_10",@"phonology_iphone_set3_original_11",@"phonology_iphone_set3_original_12",@"phonology_iphone_set3_original_13",@"phonology_iphone_set3_original_14",@"phonology_iphone_set3_original_15",@"phonology_iphone_set3_original_16",@"phonology_iphone_set3_original_17",@"phonology_iphone_set3_original_18",@"phonology_iphone_set4_original_1",@"phonology_iphone_set4_original_2",@"phonology_iphone_set4_original_3",@"phonology_iphone_set4_original_4",@"phonology_iphone_set4_original_5",@"phonology_iphone_set4_original_6",@"phonology_iphone_set4_original_7",@"phonology_iphone_set4_original_8",@"phonology_iphone_set4_original_9",@"phonology_iphone_set4_original_10",@"phonology_iphone_set4_original_11",@"phonology_iphone_set4_original_12",@"phonology_iphone_set4_original_13",@"phonology_iphone_set4_original_14",@"phonology_iphone_set4_original_15",@"phonology_iphone_set4_original_16",@"phonology_iphone_set4_original_17",@"phonology_iphone_set4_original_18",@"phonology_iphone_set5_original_1",@"phonology_iphone_set5_original_2",@"phonology_iphone_set5_original_3",@"phonology_iphone_set5_original_4",@"phonology_iphone_set5_original_5",@"phonology_iphone_set5_original_6",@"phonology_iphone_set5_original_7",@"phonology_iphone_set5_original_8",@"phonology_iphone_set5_original_9",@"phonology_iphone_set5_original_10",@"phonology_iphone_set5_original_11",@"phonology_iphone_set5_original_12",@"phonology_iphone_set5_original_13",@"phonology_iphone_set5_original_14",@"phonology_iphone_set5_original_15",@"phonology_iphone_set5_original_16",@"phonology_iphone_set5_original_17",@"phonology_iphone_set5_original_18",@"phonology_iphone_set6_original_1",@"phonology_iphone_set6_original_2",@"phonology_iphone_set6_original_3",@"phonology_iphone_set6_original_4",@"phonology_iphone_set6_original_5",@"phonology_iphone_set6_original_6",@"phonology_iphone_set6_original_7",@"phonology_iphone_set6_original_8",@"phonology_iphone_set6_original_9",@"phonology_iphone_set6_original_10",@"phonology_iphone_set6_original_11",@"phonology_iphone_set6_original_12",@"phonology_iphone_set6_original_13",@"phonology_iphone_set6_original_14",@"phonology_iphone_set6_original_15",@"phonology_iphone_set6_original_16",@"phonology_iphone_set6_original_17",@"phonology_iphone_set6_original_18", nil];
          
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_green_1",@"phonology_iphone_set1_green_2",@"phonology_iphone_set1_green_3",@"phonology_iphone_set1_green_4",@"phonology_iphone_set1_green_5",@"phonology_iphone_set1_green_6",@"phonology_iphone_set1_green_7",@"phonology_iphone_set1_green_8",@"phonology_iphone_set1_green_9",@"phonology_iphone_set1_green_10",@"phonology_iphone_set1_green_11",@"phonology_iphone_set1_green_12",@"phonology_iphone_set1_green_13",@"phonology_iphone_set1_green_14",@"phonology_iphone_set1_green_15",@"phonology_iphone_set1_green_16",@"phonology_iphone_set2_green_1",@"phonology_iphone_set2_green_2",@"phonology_iphone_set2_green_3",@"phonology_iphone_set2_green_4",@"phonology_iphone_set2_green_5",@"phonology_iphone_set2_green_6",@"phonology_iphone_set2_green_7",@"phonology_iphone_set2_green_8",@"phonology_iphone_set2_green_9",@"phonology_iphone_set2_green_10",@"phonology_iphone_set2_green_11",@"phonology_iphone_set2_green_12",@"phonology_iphone_set2_green_13",@"phonology_iphone_set2_green_14",@"phonology_iphone_set2_green_15",@"phonology_iphone_set2_green_16",@"phonology_iphone_set2_green_17",@"phonology_iphone_set2_green_18",@"phonology_iphone_set3_green_1",@"phonology_iphone_set3_green_2",@"phonology_iphone_set3_green_3",@"phonology_iphone_set3_green_4",@"phonology_iphone_set3_green_5",@"phonology_iphone_set3_green_6",@"phonology_iphone_set3_green_7",@"phonology_iphone_set3_green_8",@"phonology_iphone_set3_green_9",@"phonology_iphone_set3_green_10",@"phonology_iphone_set3_green_11",@"phonology_iphone_set3_green_12",@"phonology_iphone_set3_green_13",@"phonology_iphone_set3_green_14",@"phonology_iphone_set3_green_15",@"phonology_iphone_set3_green_16",@"phonology_iphone_set3_green_17",@"phonology_iphone_set3_green_18",@"phonology_iphone_set4_green_1",@"phonology_iphone_set4_green_2",@"phonology_iphone_set4_green_3",@"phonology_iphone_set4_green_4",@"phonology_iphone_set4_green_5",@"phonology_iphone_set4_green_6",@"phonology_iphone_set4_green_7",@"phonology_iphone_set4_green_8",@"phonology_iphone_set4_green_9",@"phonology_iphone_set4_green_10",@"phonology_iphone_set4_green_11",@"phonology_iphone_set4_green_12",@"phonology_iphone_set4_green_13",@"phonology_iphone_set4_green_14",@"phonology_iphone_set4_green_15",@"phonology_iphone_set4_green_16",@"phonology_iphone_set4_green_17",@"phonology_iphone_set4_green_18",@"phonology_iphone_set5_green_1",@"phonology_iphone_set5_green_2",@"phonology_iphone_set5_green_3",@"phonology_iphone_set5_green_4",@"phonology_iphone_set5_green_5",@"phonology_iphone_set5_green_6",@"phonology_iphone_set5_green_7",@"phonology_iphone_set5_green_8",@"phonology_iphone_set5_green_9",@"phonology_iphone_set5_green_10",@"phonology_iphone_set5_green_11",@"phonology_iphone_set5_green_12",@"phonology_iphone_set5_green_13",@"phonology_iphone_set5_green_14",@"phonology_iphone_set5_green_15",@"phonology_iphone_set5_green_16",@"phonology_iphone_set5_green_17",@"phonology_iphone_set5_green_18",@"phonology_iphone_set6_green_1",@"phonology_iphone_set6_green_2",@"phonology_iphone_set6_green_3",@"phonology_iphone_set6_green_4",@"phonology_iphone_set6_green_5",@"phonology_iphone_set6_green_6",@"phonology_iphone_set6_green_7",@"phonology_iphone_set6_green_8",@"phonology_iphone_set6_green_9",@"phonology_iphone_set6_green_10",@"phonology_iphone_set6_green_11",@"phonology_iphone_set6_green_12",@"phonology_iphone_set6_green_13",@"phonology_iphone_set6_green_14",@"phonology_iphone_set6_green_15",@"phonology_iphone_set6_green_16",@"phonology_iphone_set6_green_17",@"phonology_iphone_set6_green_18", nil];
          
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_iphone_set1_red_1",@"phonology_iphone_set1_red_2",@"phonology_iphone_set1_red_3",@"phonology_iphone_set1_red_4",@"phonology_iphone_set1_red_5",@"phonology_iphone_set1_red_6",@"phonology_iphone_set1_red_7",@"phonology_iphone_set1_red_8",@"phonology_iphone_set1_red_9",@"phonology_iphone_set1_red_10",@"phonology_iphone_set1_red_11",@"phonology_iphone_set1_red_12",@"phonology_iphone_set1_red_13",@"phonology_iphone_set1_red_14",@"phonology_iphone_set1_red_15",@"phonology_iphone_set1_red_16",@"phonology_iphone_set2_red_1",@"phonology_iphone_set2_red_2",@"phonology_iphone_set2_red_3",@"phonology_iphone_set2_red_4",@"phonology_iphone_set2_red_5",@"phonology_iphone_set2_red_6",@"phonology_iphone_set2_red_7",@"phonology_iphone_set2_red_8",@"phonology_iphone_set2_red_9",@"phonology_iphone_set2_red_10",@"phonology_iphone_set2_red_11",@"phonology_iphone_set2_red_12",@"phonology_iphone_set2_red_13",@"phonology_iphone_set2_red_14",@"phonology_iphone_set2_red_15",@"phonology_iphone_set2_red_16",@"phonology_iphone_set2_red_17",@"phonology_iphone_set2_red_18",@"phonology_iphone_set3_red_1",@"phonology_iphone_set3_red_2",@"phonology_iphone_set3_red_3",@"phonology_iphone_set3_red_4",@"phonology_iphone_set3_red_5",@"phonology_iphone_set3_red_6",@"phonology_iphone_set3_red_7",@"phonology_iphone_set3_red_8",@"phonology_iphone_set3_red_9",@"phonology_iphone_set3_red_10",@"phonology_iphone_set3_red_11",@"phonology_iphone_set3_red_12",@"phonology_iphone_set3_red_13",@"phonology_iphone_set3_red_14",@"phonology_iphone_set3_red_15",@"phonology_iphone_set3_red_16",@"phonology_iphone_set3_red_17",@"phonology_iphone_set3_red_18",@"phonology_iphone_set4_red_1",@"phonology_iphone_set4_red_2",@"phonology_iphone_set4_red_3",@"phonology_iphone_set4_red_4",@"phonology_iphone_set4_red_5",@"phonology_iphone_set4_red_6",@"phonology_iphone_set4_red_7",@"phonology_iphone_set4_red_8",@"phonology_iphone_set4_red_9",@"phonology_iphone_set4_red_10",@"phonology_iphone_set4_red_11",@"phonology_iphone_set4_red_12",@"phonology_iphone_set4_red_13",@"phonology_iphone_set4_red_14",@"phonology_iphone_set4_red_15",@"phonology_iphone_set4_red_16",@"phonology_iphone_set4_red_17",@"phonology_iphone_set4_red_18",@"phonology_iphone_set5_red_1",@"phonology_iphone_set5_red_2",@"phonology_iphone_set5_red_3",@"phonology_iphone_set5_red_4",@"phonology_iphone_set5_red_5",@"phonology_iphone_set5_red_6",@"phonology_iphone_set5_red_7",@"phonology_iphone_set5_red_8",@"phonology_iphone_set5_red_9",@"phonology_iphone_set5_red_10",@"phonology_iphone_set5_red_11",@"phonology_iphone_set5_red_12",@"phonology_iphone_set5_red_13",@"phonology_iphone_set5_red_14",@"phonology_iphone_set5_red_15",@"phonology_iphone_set5_red_16",@"phonology_iphone_set5_red_17",@"phonology_iphone_set5_red_18",@"phonology_iphone_set6_red_1",@"phonology_iphone_set6_red_2",@"phonology_iphone_set6_red_3",@"phonology_iphone_set6_red_4",@"phonology_iphone_set6_red_5",@"phonology_iphone_set6_red_6",@"phonology_iphone_set6_red_7",@"phonology_iphone_set6_red_8",@"phonology_iphone_set6_red_9",@"phonology_iphone_set6_red_10",@"phonology_iphone_set6_red_11",@"phonology_iphone_set6_red_12",@"phonology_iphone_set6_red_13",@"phonology_iphone_set6_red_14",@"phonology_iphone_set6_red_15",@"phonology_iphone_set6_red_16",@"phonology_iphone_set6_red_17",@"phonology_iphone_set6_red_18", nil];
          
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50",@"51",@"52",@"53",@"54",@"55",@"56",@"57",@"58",@"59",@"60",@"61",@"62",@"63",@"64",@"65",@"66",@"67",@"68",@"69",@"70",@"71",@"72",@"73",@"74",@"75",@"76",@"77",@"78",@"79",@"80",@"81",@"82",@"83",@"84",@"85",@"86",@"87",@"88",@"89",@"90",@"91",@"92",@"93",@"94",@"95",@"96",@"97",@"98",@"99",@"100",@"101",@"102",@"103",@"104",@"105"]];
          
          
          
          [self loadQuestionsforAll];
          
      }
      
  }
  

    
    
  //////******IPAD******///////
  else if(appDel.i==3)
  {
   if([MenuBtnTag_ipad isEqualToString:[NSString stringWithFormat:@"rhyming words set a"]])
    {
        rhymeA=true;
        
        self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with cat?",@"what rhymes with hat?",@"what rhymes with clock?",@"what rhymes with block?",@"what rhymes with bed?",@"what rhymes with bread?",@"what rhymes with blue?",@"what rhymes with shoe?",@"what rhymes with corn?",@"what rhymes with horn?",@"what rhymes with chair?",@"what rhymes with bear?",@"what rhymes with dog?",@"what rhymes with frog?",@"what rhymes with pail?",@"what rhymes with snail?",nil];
        
        
        self.answer_text=[[NSMutableArray alloc]initWithObjects:@"hat",@"cat",@"block",@"clock",@"bread",@"bed",@"shoe",@"blue",@"horn",@"corn",@"bear",@"chair",@"frog",@"dog",@"snail",@"pail",nil];
        
         self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
       self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_ipad_set1_grey_1",@"phonology_ipad_set1_grey_2",@"phonology_ipad_set1_grey_3",@"phonology_ipad_set1_grey_4",@"phonology_ipad_set1_grey_5",@"phonology_ipad_set1_grey_6",@"phonology_ipad_set1_grey_7",@"phonology_ipad_set1_grey_8",@"phonology_ipad_set1_grey_9",@"phonology_ipad_set1_grey_10",@"phonology_ipad_set1_grey_11",@"phonology_ipad_set1_grey_12",@"phonology_ipad_set1_grey_13",@"phonology_ipad_set1_grey_14",@"phonology_ipad_set1_grey_15",@"phonology_ipad_set1_grey_16", nil];
        
      self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_ipad_set1_original_1",@"phonology_ipad_set1_original_2",@"phonology_ipad_set1_original_3",@"phonology_ipad_set1_original_4",@"phonology_ipad_set1_original_5",@"phonology_ipad_set1_original_6",@"phonology_ipad_set1_original_7",@"phonology_ipad_set1_original_8",@"phonology_ipad_set1_original_9",@"phonology_ipad_set1_original_10",@"phonology_ipad_set1_original_11",@"phonology_ipad_set1_original_12",@"phonology_ipad_set1_original_13",@"phonology_ipad_set1_original_14",@"phonology_ipad_set1_original_15",@"phonology_ipad_set1_original_16", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_ipad_set1_green_1",@"phonology_ipad_set1_green_2",@"phonology_ipad_set1_green_3",@"phonology_ipad_set1_green_4",@"phonology_ipad_set1_green_5",@"phonology_ipad_set1_green_6",@"phonology_ipad_set1_green_7",@"phonology_ipad_set1_green_8",@"phonology_ipad_set1_green_9",@"phonology_ipad_set1_green_10",@"phonology_ipad_set1_green_11",@"phonology_ipad_set1_green_12",@"phonology_ipad_set1_green_13",@"phonology_ipad_set1_green_14",@"phonology_ipad_set1_green_15",@"phonology_ipad_set1_green_16", nil];
          
         self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_ipad_set1_red_1",@"phonology_ipad_set1_red_2",@"phonology_ipad_set1_red_3",@"phonology_ipad_set1_red_4",@"phonology_ipad_set1_red_5",@"phonology_ipad_set1_red_6",@"phonology_ipad_set1_red_7",@"phonology_ipad_set1_red_8",@"phonology_ipad_set1_red_9",@"phonology_ipad_set1_red_10",@"phonology_ipad_set1_red_11",@"phonology_ipad_set1_red_12",@"phonology_ipad_set1_red_13",@"phonology_ipad_set1_red_14",@"phonology_ipad_set1_red_15",@"phonology_ipad_set1_red_16", nil];
        dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15"]];
        
        self.image_title=[[NSMutableArray alloc]initWithObjects:@"cat",@"hat",@"clock",@"block",@"bed",@"bread",@"blue",@"shoe",@"corn",@"horn",@"chair",@"bear",@"dog",@"frog",@"pail",@"snail", nil];
        [self loadQuestions];
        
      }
     else if([MenuBtnTag_ipad isEqualToString:[NSString stringWithFormat:@"rhyming words set b"]])
      {
           self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with crown?",@"what rhymes with clown?",@"what rhymes with shell?",@"what rhymes with bell?",@"what rhymes with flag?",@"what rhymes with bag?",@"what rhymes with pie?",@"what rhymes with tie?",@"what rhymes with basket?",@"what rhymes with blanket?",@"what rhymes with moon?",@"what rhymes with spoon?",@"what rhymes with tree?",@"what rhymes with bee?",@"what rhymes with coat?",@"what rhymes with boat?",@"what rhymes with boots?",@"what rhymes with fruits?",nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"clown",@"crown",@"bell",@"shell",@"bag",@"flag",@"tie",@"pie",@"blanket",@"basket",@"spoon",@"moon",@"bee",@"tree",@"boat",@"coat",@"fruits",@"boots",nil];
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_ipad_set2_grey_1",@"phonology_ipad_set2_grey_2",@"phonology_ipad_set2_grey_3",@"phonology_ipad_set2_grey_4",@"phonology_ipad_set2_grey_5",@"phonology_ipad_set2_grey_6",@"phonology_ipad_set2_grey_7",@"phonology_ipad_set2_grey_8",@"phonology_ipad_set2_grey_9",@"phonology_ipad_set2_grey_10",@"phonology_ipad_set2_grey_11",@"phonology_ipad_set2_grey_12",@"phonology_ipad_set2_grey_13",@"phonology_ipad_set2_grey_14",@"phonology_ipad_set2_grey_15",@"phonology_ipad_set2_grey_16",@"phonology_ipad_set2_grey_17",@"phonology_ipad_set2_grey_18", nil];
         
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_ipad_set2_original_1",@"phonology_ipad_set2_original_2",@"phonology_ipad_set2_original_3",@"phonology_ipad_set2_original_4",@"phonology_ipad_set2_original_5",@"phonology_ipad_set2_original_6",@"phonology_ipad_set2_original_7",@"phonology_ipad_set2_original_8",@"phonology_ipad_set2_original_9",@"phonology_ipad_set2_original_10",@"phonology_ipad_set2_original_11",@"phonology_ipad_set2_original_12",@"phonology_ipad_set2_original_13",@"phonology_ipad_set2_original_14",@"phonology_ipad_set2_original_15",@"phonology_ipad_set2_original_16",@"phonology_ipad_set2_original_17",@"phonology_ipad_set2_original_18", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_ipad_set2_green_1",@"phonology_ipad_set2_green_2",@"phonology_ipad_set2_green_3",@"phonology_ipad_set2_green_4",@"phonology_ipad_set2_green_5",@"phonology_ipad_set2_green_6",@"phonology_ipad_set2_green_7",@"phonology_ipad_set2_green_8",@"phonology_ipad_set2_green_9",@"phonology_ipad_set2_green_10",@"phonology_ipad_set2_green_11",@"phonology_ipad_set2_green_12",@"phonology_ipad_set2_green_13",@"phonology_ipad_set2_green_14",@"phonology_ipad_set2_green_15",@"phonology_ipad_set2_green_16",@"phonology_ipad_set2_green_17",@"phonology_ipad_set2_green_18", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_ipad_set2_red_1",@"phonology_ipad_set2_red_2",@"phonology_ipad_set2_red_3",@"phonology_ipad_set2_red_4",@"phonology_ipad_set2_red_5",@"phonology_ipad_set2_red_6",@"phonology_ipad_set2_red_7",@"phonology_ipad_set2_red_8",@"phonology_ipad_set2_red_9",@"phonology_ipad_set2_red_10",@"phonology_ipad_set2_red_11",@"phonology_ipad_set2_red_12",@"phonology_ipad_set2_red_13",@"phonology_ipad_set2_red_14",@"phonology_ipad_set2_red_15",@"phonology_ipad_set2_red_16",@"phonology_ipad_set2_red_17",@"phonology_ipad_set2_red_18", nil];
          
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"crown",@"clown",@"shell",@"bell",@"flag",@"bag",@"pie",@"tie",@"basket",@"blanket",@"moon",@"spoon",@"tree",@"bee",@"coat",@"boat",@"boots",@"fruits", nil];
          [self loadQuestions];
      }
      
     else if([MenuBtnTag_ipad isEqualToString:[NSString stringWithFormat:@"rhyming words set c"]])
      {
         self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with ice?",@"what rhymes with rice?",@"what rhymes with van?",@"what rhymes with pan?",@"what rhymes with glad?",@"what rhymes with sad?",@"what rhymes with rug?",@"what rhymes with mug?",@"what rhymes with cone?",@"what rhymes with telephone?",@"what rhymes with sink?",@"what rhymes with pink?",@"what rhymes with airplane?",@"what rhymes with train?",@"what rhymes with duck?",@"what rhymes with truck?",@"what rhymes with nest?",@"what rhymes with chest?",nil];
       
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"rice",@"ice",@"pan",@"van",@"sad",@"glad",@"mug",@"rug",@"telephone",@"cone",@"pink",@"sink",@"train",@"airplane",@"truck",@"duck",@"chest",@"nest",nil];
         
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_ipad_set3_grey_1",@"phonology_ipad_set3_grey_2",@"phonology_ipad_set3_grey_3",@"phonology_ipad_set3_grey_4",@"phonology_ipad_set3_grey_5",@"phonology_ipad_set3_grey_6",@"phonology_ipad_set3_grey_7",@"phonology_ipad_set3_grey_8",@"phonology_ipad_set3_grey_9",@"phonology_ipad_set3_grey_10",@"phonology_ipad_set3_grey_11",@"phonology_ipad_set3_grey_12",@"phonology_ipad_set3_grey_13",@"phonology_ipad_set3_grey_14",@"phonology_ipad_set3_grey_15",@"phonology_ipad_set3_grey_16",@"phonology_ipad_set3_grey_17",@"phonology_ipad_set3_grey_18", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_ipad_set3_original_1",@"phonology_ipad_set3_original_2",@"phonology_ipad_set3_original_3",@"phonology_ipad_set3_original_4",@"phonology_ipad_set3_original_5",@"phonology_ipad_set3_original_6",@"phonology_ipad_set3_original_7",@"phonology_ipad_set3_original_8",@"phonology_ipad_set3_original_9",@"phonology_ipad_set3_original_10",@"phonology_ipad_set3_original_11",@"phonology_ipad_set3_original_12",@"phonology_ipad_set3_original_13",@"phonology_ipad_set3_original_14",@"phonology_ipad_set3_original_15",@"phonology_ipad_set3_original_16",@"phonology_ipad_set3_original_17",@"phonology_ipad_set3_original_18", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_ipad_set3_green_1",@"phonology_ipad_set3_green_2",@"phonology_ipad_set3_green_3",@"phonology_ipad_set3_green_4",@"phonology_ipad_set3_green_5",@"phonology_ipad_set3_green_6",@"phonology_ipad_set3_green_7",@"phonology_ipad_set3_green_8",@"phonology_ipad_set3_green_9",@"phonology_ipad_set3_green_10",@"phonology_ipad_set3_green_11",@"phonology_ipad_set3_green_12",@"phonology_ipad_set3_green_13",@"phonology_ipad_set3_green_14",@"phonology_ipad_set3_green_15",@"phonology_ipad_set3_green_16",@"phonology_ipad_set3_green_17",@"phonology_ipad_set3_green_18", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_ipad_set3_red_1",@"phonology_ipad_set3_red_2",@"phonology_ipad_set3_red_3",@"phonology_ipad_set3_red_4",@"phonology_ipad_set3_red_5",@"phonology_ipad_set3_red_6",@"phonology_ipad_set3_red_7",@"phonology_ipad_set3_red_8",@"phonology_ipad_set3_red_9",@"phonology_ipad_set3_red_10",@"phonology_ipad_set3_red_11",@"phonology_ipad_set3_red_12",@"phonology_ipad_set3_red_13",@"phonology_ipad_set3_red_14",@"phonology_ipad_set3_red_15",@"phonology_ipad_set3_red_16",@"phonology_ipad_set3_red_17",@"phonology_ipad_set3_red_18", nil];
          
           dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"ice",@"rice",@"van",@"pan",@"glad",@"sad",@"rug",@"mug",@"cone",@"telephone",@"sink",@"pink",@"airplane",@"train",@"duck",@"truck",@"nest",@"chest", nil];
          
          [self loadQuestions];

      }
      
     else if([MenuBtnTag_ipad isEqualToString:[NSString stringWithFormat:@"rhyming words set d"]])
      {
        self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with juice?",@"what rhymes with goose?",@"what rhymes with door?",@"what rhymes with four?",@"what rhymes with swing?",@"what rhymes with ring?",@"what rhymes with nose?",@"what rhymes with hose?",@"what rhymes with fire?",@"what rhymes with tire?",@"what rhymes with stamp?",@"what rhymes with lamp?",@"what rhymes with can?",@"what rhymes with fan?",@"what rhymes with otter?",@"what rhymes with water?",@"what rhymes with pot?",@"what rhymes with knot?",nil];
          
         self.answer_text=[[NSMutableArray alloc]initWithObjects:@"goose",@"juice",@"four",@"door",@"ring",@"swing",@"hose",@"nose",@"tire",@"fire",@"lamp",@"stamp",@"fan",@"can",@"water",@"otter",@"knot",@"pot",nil];
          
         self.image_title=[[NSMutableArray alloc]initWithObjects:@"juice",@"goose",@"door",@"four",@"swing",@"ring",@"nose",@"hose",@"fire",@"tire",@"stamp",@"lamp",@"can",@"fan",@"otter",@"water",@"pot",@"knot", nil];
          
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_ipad_set4_grey_1",@"phonology_ipad_set4_grey_2",@"phonology_ipad_set4_grey_3",@"phonology_ipad_set4_grey_4",@"phonology_ipad_set4_grey_5",@"phonology_ipad_set4_grey_6",@"phonology_ipad_set4_grey_7",@"phonology_ipad_set4_grey_8",@"phonology_ipad_set4_grey_9",@"phonology_ipad_set4_grey_10",@"phonology_ipad_set4_grey_11",@"phonology_ipad_set4_grey_12",@"phonology_ipad_set4_grey_13",@"phonology_ipad_set4_grey_14",@"phonology_ipad_set4_grey_15",@"phonology_ipad_set4_grey_16",@"phonology_ipad_set4_grey_17",@"phonology_ipad_set4_grey_18", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_ipad_set4_original_1",@"phonology_ipad_set4_original_2",@"phonology_ipad_set4_original_3",@"phonology_ipad_set4_original_4",@"phonology_ipad_set4_original_5",@"phonology_ipad_set4_original_6",@"phonology_ipad_set4_original_7",@"phonology_ipad_set4_original_8",@"phonology_ipad_set4_original_9",@"phonology_ipad_set4_original_10",@"phonology_ipad_set4_original_11",@"phonology_ipad_set4_original_12",@"phonology_ipad_set4_original_13",@"phonology_ipad_set4_original_14",@"phonology_ipad_set4_original_15",@"phonology_ipad_set4_original_16",@"phonology_ipad_set4_original_17",@"phonology_ipad_set4_original_18", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_ipad_set4_green_1",@"phonology_ipad_set4_green_2",@"phonology_ipad_set4_green_3",@"phonology_ipad_set4_green_4",@"phonology_ipad_set4_green_5",@"phonology_ipad_set4_green_6",@"phonology_ipad_set4_green_7",@"phonology_ipad_set4_green_8",@"phonology_ipad_set4_green_9",@"phonology_ipad_set4_green_10",@"phonology_ipad_set4_green_11",@"phonology_ipad_set4_green_12",@"phonology_ipad_set4_green_13",@"phonology_ipad_set4_green_14",@"phonology_ipad_set4_green_15",@"phonology_ipad_set4_green_16",@"phonology_ipad_set4_green_17",@"phonology_ipad_set4_green_18", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_ipad_set4_red_1",@"phonology_ipad_set4_red_2",@"phonology_ipad_set4_red_3",@"phonology_ipad_set4_red_4",@"phonology_ipad_set4_red_5",@"phonology_ipad_set4_red_6",@"phonology_ipad_set4_red_7",@"phonology_ipad_set4_red_8",@"phonology_ipad_set4_red_9",@"phonology_ipad_set4_red_10",@"phonology_ipad_set4_red_11",@"phonology_ipad_set4_red_12",@"phonology_ipad_set4_red_13",@"phonology_ipad_set4_red_14",@"phonology_ipad_set4_red_15",@"phonology_ipad_set4_red_16",@"phonology_ipad_set4_red_17",@"phonology_ipad_set4_red_18", nil];
          
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
          
          [self loadQuestions];
      }
      
     else if([MenuBtnTag_ipad isEqualToString:[NSString stringWithFormat:@"rhyming words set e"]])
      {
          rhymeE=true;
          
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with jar?",@"what rhymes with guitar?",@"what rhymes with pillow?",@"what rhymes with yellow?",@"what rhymes with red?",@"what rhymes with sled?",@"what rhymes with monkey?",@"what rhymes with donkey?",@"what rhymes with fish?",@"what rhymes with dish?",@"what rhymes with kite?",@"what rhymes with white?",@"what rhymes with rake?",@"what rhymes with cake?",@"what rhymes with doll?",@"what rhymes with ball?",@"what rhymes with carrot?",@"what rhymes with parrot?",nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"guitar",@"jar",@"yellow",@"pillow",@"sled",@"red",@"donkey",@"monkey",@"dish",@"fish",@"white",@"kite",@"cake",@"rake",@"ball",@"doll",@"parrot",@"carrot",nil];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"jar",@"guitar",@"pillow",@"yellow",@"red",@"sled",@"monkey",@"donkey",@"fish",@"dish",@"kite",@"white",@"rake",@"cake",@"doll",@"ball",@"carrot",@"parrot", nil];
          
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_ipad_set5_grey_1",@"phonology_ipad_set5_grey_2",@"phonology_ipad_set5_grey_3",@"phonology_ipad_set5_grey_4",@"phonology_ipad_set5_grey_5",@"phonology_ipad_set5_grey_6",@"phonology_ipad_set5_grey_7",@"phonology_ipad_set5_grey_8",@"phonology_ipad_set5_grey_9",@"phonology_ipad_set5_grey_10",@"phonology_ipad_set5_grey_11",@"phonology_ipad_set5_grey_12",@"phonology_ipad_set5_grey_13",@"phonology_ipad_set5_grey_14",@"phonology_ipad_set5_grey_15",@"phonology_ipad_set5_grey_16",@"phonology_ipad_set5_grey_17",@"phonology_ipad_set5_grey_18", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_ipad_set5_original_1",@"phonology_ipad_set5_original_2",@"phonology_ipad_set5_original_3",@"phonology_ipad_set5_original_4",@"phonology_ipad_set5_original_5",@"phonology_ipad_set5_original_6",@"phonology_ipad_set5_original_7",@"phonology_ipad_set5_original_8",@"phonology_ipad_set5_original_9",@"phonology_ipad_set5_original_10",@"phonology_ipad_set5_original_11",@"phonology_ipad_set5_original_12",@"phonology_ipad_set5_original_13",@"phonology_ipad_set5_original_14",@"phonology_ipad_set5_original_15",@"phonology_ipad_set5_original_16",@"phonology_ipad_set5_original_17",@"phonology_ipad_set5_original_18", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_ipad_set5_green_1",@"phonology_ipad_set5_green_2",@"phonology_ipad_set5_green_3",@"phonology_ipad_set5_green_4",@"phonology_ipad_set5_green_5",@"phonology_ipad_set5_green_6",@"phonology_ipad_set5_green_7",@"phonology_ipad_set5_green_8",@"phonology_ipad_set5_green_9",@"phonology_ipad_set5_green_10",@"phonology_ipad_set5_green_11",@"phonology_ipad_set5_green_12",@"phonology_ipad_set5_green_13",@"phonology_ipad_set5_green_14",@"phonology_ipad_set5_green_15",@"phonology_ipad_set5_green_16",@"phonology_ipad_set5_green_17",@"phonology_ipad_set5_green_18", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_ipad_set5_red_1",@"phonology_ipad_set5_red_2",@"phonology_ipad_set5_red_3",@"phonology_ipad_set5_red_4",@"phonology_ipad_set5_red_5",@"phonology_ipad_set5_red_6",@"phonology_ipad_set5_red_7",@"phonology_ipad_set5_red_8",@"phonology_ipad_set5_red_9",@"phonology_ipad_set5_red_10",@"phonology_ipad_set5_red_11",@"phonology_ipad_set5_red_12",@"phonology_ipad_set5_red_13",@"phonology_ipad_set5_red_14",@"phonology_ipad_set5_red_15",@"phonology_ipad_set5_red_16",@"phonology_ipad_set5_red_17",@"phonology_ipad_set5_red_18", nil];
          
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
          
          [self loadQuestions];
      }
      
     else if([MenuBtnTag_ipad isEqualToString:[NSString stringWithFormat:@"rhyming words set f"]])
      {
          self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with fox?",@"what rhymes with box?",@"what rhymes with hen?",@"what rhymes with pen?",@"what rhymes with pizza?",@"what rhymes with zebra?",@"what rhymes with helmet?",@"what rhymes with  blanket?",@"what rhymes with soap?",@"what rhymes with rope?",@"what rhymes with green?",@"what rhymes with thirteen?",@"what rhymes with stool?",@"what rhymes with pool?",@"what rhymes with car?",@"what rhymes with star?",@"what rhymes with three?",@"what rhymes with key?",nil];
          
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"box",@"fox",@"pen",@"hen",@"zebra",@"pizza",@" blanket",@"helmet",@"rope",@"soap",@"thirteen",@"green",@"pool",@"stool",@"star",@"car",@"key",@"three",nil];
          
          self.image_title=[[NSMutableArray alloc]initWithObjects:@"fox",@"box",@"hen",@"pen",@"pizza",@"zebra",@"helmet",@" blanket",@"soap",@"rope",@"green",@"thirteen",@"stool",@"pool",@"car",@"star",@"three", @"key",nil];
          
          self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
          
          self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_ipad_set6_grey_1",@"phonology_ipad_set6_grey_2",@"phonology_ipad_set6_grey_3",@"phonology_ipad_set6_grey_4",@"phonology_ipad_set6_grey_5",@"phonology_ipad_set6_grey_6",@"phonology_ipad_set6_grey_7",@"phonology_ipad_set6_grey_8",@"phonology_ipad_set6_grey_9",@"phonology_ipad_set6_grey_10",@"phonology_ipad_set6_grey_11",@"phonology_ipad_set6_grey_12",@"phonology_ipad_set6_grey_13",@"phonology_ipad_set6_grey_14",@"phonology_ipad_set6_grey_15",@"phonology_ipad_set6_grey_16",@"phonology_ipad_set6_grey_17",@"phonology_ipad_set6_grey_18", nil];
          
          self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_ipad_set6_original_1",@"phonology_ipad_set6_original_2",@"phonology_ipad_set6_original_3",@"phonology_ipad_set6_original_4",@"phonology_ipad_set6_original_5",@"phonology_ipad_set6_original_6",@"phonology_ipad_set6_original_7",@"phonology_ipad_set6_original_8",@"phonology_ipad_set6_original_9",@"phonology_ipad_set6_original_10",@"phonology_ipad_set6_original_11",@"phonology_ipad_set6_original_12",@"phonology_ipad_set6_original_13",@"phonology_ipad_set6_original_14",@"phonology_ipad_set6_original_15",@"phonology_ipad_set6_original_16",@"phonology_ipad_set6_original_17",@"phonology_ipad_set6_original_18", nil];
          
          self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_ipad_set6_green_1",@"phonology_ipad_set6_green_2",@"phonology_ipad_set6_green_3",@"phonology_ipad_set6_green_4",@"phonology_ipad_set6_green_5",@"phonology_ipad_set6_green_6",@"phonology_ipad_set6_green_7",@"phonology_ipad_set6_green_8",@"phonology_ipad_set6_green_9",@"phonology_ipad_set6_green_10",@"phonology_ipad_set6_green_11",@"phonology_ipad_set6_green_12",@"phonology_ipad_set6_green_13",@"phonology_ipad_set6_green_14",@"phonology_ipad_set6_green_15",@"phonology_ipad_set6_green_16",@"phonology_ipad_set6_green_17",@"phonology_ipad_set6_green_18", nil];
          
          self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_ipad_set6_red_1",@"phonology_ipad_set6_red_2",@"phonology_ipad_set6_red_3",@"phonology_ipad_set6_red_4",@"phonology_ipad_set6_red_5",@"phonology_ipad_set6_red_6",@"phonology_ipad_set6_red_7",@"phonology_ipad_set6_red_8",@"phonology_ipad_set6_red_9",@"phonology_ipad_set6_red_10",@"phonology_ipad_set6_red_11",@"phonology_ipad_set6_red_12",@"phonology_ipad_set6_red_13",@"phonology_ipad_set6_red_14",@"phonology_ipad_set6_red_15",@"phonology_ipad_set6_red_16",@"phonology_ipad_set6_red_17",@"phonology_ipad_set6_red_18", nil];
          
          dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17"]];
          
          [self loadQuestions];
      }
     else if([MenuBtnTag_ipad isEqualToString:[NSString stringWithFormat:@"all rhyming words"]])
     {
         rhymeAforAll=true;
         
         rhymeEforAll=true;
         
         self.question_text=[[NSMutableArray alloc]initWithObjects:@"what rhymes with cat?",@"what rhymes with hat?",@"what rhymes with clock?",@"what rhymes with block?",@"what rhymes with bed?",@"what rhymes with bread?",@"what rhymes with blue?",@"what rhymes with shoe?",@"what rhymes with corn?",@"what rhymes with horn?",@"what rhymes with chair?",@"what rhymes with bear?",@"what rhymes with dog?",@"what rhymes with frog?",@"what rhymes with pail?",@"what rhymes with snail?",@"what rhymes with crown?",@"what rhymes with clown?",@"what rhymes with shell?",@"what rhymes with bell?",@"what rhymes with flag?",@"what rhymes with bag?",@"what rhymes with pie?",@"what rhymes with tie?",@"what rhymes with basket?",@"what rhymes with blanket?",@"what rhymes with moon?",@"what rhymes with spoon?",@"what rhymes with tree?",@"what rhymes with bee?",@"what rhymes with coat?",@"what rhymes with boat?",@"what rhymes with boots?",@"what rhymes with fruits?",@"what rhymes with ice?",@"what rhymes with rice?",@"what rhymes with van?",@"what rhymes with pan?",@"what rhymes with glad?",@"what rhymes with sad?",@"what rhymes with rug?",@"what rhymes with mug?",@"what rhymes with cone?",@"what rhymes with telephone?",@"what rhymes with sink?",@"what rhymes with pink?",@"what rhymes with airplane?",@"what rhymes with train?",@"what rhymes with duck?",@"what rhymes with truck?",@"what rhymes with nest?",@"what rhymes with chest?",@"what rhymes with juice?",@"what rhymes with goose?",@"what rhymes with door?",@"what rhymes with four?",@"what rhymes with swing?",@"what rhymes with ring?",@"what rhymes with nose?",@"what rhymes with hose?",@"what rhymes with fire?",@"what rhymes with tire?",@"what rhymes with stamp?",@"what rhymes with lamp?",@"what rhymes with can?",@"what rhymes with fan?",@"what rhymes with otter?",@"what rhymes with water?",@"what rhymes with pot?",@"what rhymes with knot?",@"what rhymes with jar?",@"what rhymes with guitar?",@"what rhymes with pillow?",@"what rhymes with yellow?",@"what rhymes with red?",@"what rhymes with sled?",@"what rhymes with monkey?",@"what rhymes with donkey?",@"what rhymes with fish?",@"what rhymes with dish?",@"what rhymes with kite?",@"what rhymes with white?",@"what rhymes with rake?",@"what rhymes with cake?",@"what rhymes with doll?",@"what rhymes with ball?",@"what rhymes with carrot?",@"what rhymes with parrot?",@"what rhymes with fox?",@"what rhymes with box?",@"what rhymes with hen?",@"what rhymes with pen?",@"what rhymes with pizza?",@"what rhymes with zebra?",@"what rhymes with helmet?",@"what rhymes with  blanket?",@"what rhymes with soap?",@"what rhymes with rope?",@"what rhymes with green?",@"what rhymes with thirteen?",@"what rhymes with stool?",@"what rhymes with pool?",@"what rhymes with car?",@"what rhymes with star?",@"what rhymes with three?",@"what rhymes with key?", nil];
         
          self.answer_text=[[NSMutableArray alloc]initWithObjects:@"hat",@"cat",@"block",@"clock",@"bread",@"bed",@"shoe",@"blue",@"horn",@"corn",@"bear",@"chair",@"frog",@"dog",@"snail",@"pail",@"clown",@"crown",@"bell",@"shell",@"bag",@"flag",@"tie",@"pie",@"blanket",@"basket",@"spoon",@"moon",@"bee",@"tree",@"boat",@"coat",@"fruits",@"boots",@"rice",@"ice",@"pan",@"van",@"sad",@"glad",@"mug",@"rug",@"telephone",@"cone",@"pink",@"sink",@"train",@"airplane",@"truck",@"duck",@"chest",@"nest",@"goose",@"juice",@"four",@"door",@"ring",@"swing",@"hose",@"nose",@"tire",@"fire",@"lamp",@"stamp",@"fan",@"can",@"water",@"otter",@"knot",@"pot",@"guitar",@"jar",@"yellow",@"pillow",@"sled",@"red",@"donkey",@"monkey",@"dish",@"fish",@"white",@"kite",@"cake",@"rake",@"ball",@"doll",@"parrot",@"carrot",@"box",@"fox",@"pen",@"hen",@"zebra",@"pizza",@"blanket",@"helmet",@"rope",@"soap",@"thirteen",@"green",@"pool",@"stool",@"star",@"car",@"key",@"three",nil];
         
         self.image_title=[[NSMutableArray alloc]initWithObjects:@"cat",@"hat",@"clock",@"block",@"bed",@"bread",@"blue",@"shoe",@"corn",@"horn",@"chair",@"bear",@"dog",@"frog",@"pail",@"snail",@"crown",@"clown",@"shell",@"bell",@"flag",@"bag",@"pie",@"tie",@"basket",@"blanket",@"moon",@"spoon",@"tree",@"bee",@"coat",@"boat",@"boots",@"fruits",@"ice",@"rice",@"van",@"pan",@"glad",@"sad",@"rug",@"mug",@"cone",@"telephone",@"sink",@"pink",@"airplane",@"train",@"duck",@"truck",@"nest",@"chest",@"juice",@"goose",@"door",@"four",@"swing",@"ring",@"nose",@"hose",@"fire",@"tire",@"stamp",@"lamp",@"can",@"fan",@"otter",@"water",@"pot",@"knot",@"jar",@"guitar",@"pillow",@"yellow",@"red",@"sled",@"monkey",@"donkey",@"fish",@"dish",@"kite",@"white",@"rake",@"cake",@"doll",@"ball",@"carrot",@"parrot",@"fox",@"box",@"hen",@"pen",@"pizza",@"zebra",@"helmet",@" blanket",@"soap",@"rope",@"green",@"thirteen",@"stool",@"pool",@"car",@"star",@"three", @"key", nil];
         
         self.dict_right_answer=[[NSMutableDictionary alloc]initWithObjects:self.question_text forKeys:self.answer_text];
         
         self.grey_image=[[NSMutableArray alloc]initWithObjects:@"phonology_ipad_set1_grey_1",@"phonology_ipad_set1_grey_2",@"phonology_ipad_set1_grey_3",@"phonology_ipad_set1_grey_4",@"phonology_ipad_set1_grey_5",@"phonology_ipad_set1_grey_6",@"phonology_ipad_set1_grey_7",@"phonology_ipad_set1_grey_8",@"phonology_ipad_set1_grey_9",@"phonology_ipad_set1_grey_10",@"phonology_ipad_set1_grey_11",@"phonology_ipad_set1_grey_12",@"phonology_ipad_set1_grey_13",@"phonology_ipad_set1_grey_14",@"phonology_ipad_set1_grey_15",@"phonology_ipad_set1_grey_16",@"phonology_ipad_set2_grey_1",@"phonology_ipad_set2_grey_2",@"phonology_ipad_set2_grey_3",@"phonology_ipad_set2_grey_4",@"phonology_ipad_set2_grey_5",@"phonology_ipad_set2_grey_6",@"phonology_ipad_set2_grey_7",@"phonology_ipad_set2_grey_8",@"phonology_ipad_set2_grey_9",@"phonology_ipad_set2_grey_10",@"phonology_ipad_set2_grey_11",@"phonology_ipad_set2_grey_12",@"phonology_ipad_set2_grey_13",@"phonology_ipad_set2_grey_14",@"phonology_ipad_set2_grey_15",@"phonology_ipad_set2_grey_16",@"phonology_ipad_set2_grey_17",@"phonology_ipad_set2_grey_18",@"phonology_ipad_set3_grey_1",@"phonology_ipad_set3_grey_2",@"phonology_ipad_set3_grey_3",@"phonology_ipad_set3_grey_4",@"phonology_ipad_set3_grey_5",@"phonology_ipad_set3_grey_6",@"phonology_ipad_set3_grey_7",@"phonology_ipad_set3_grey_8",@"phonology_ipad_set3_grey_9",@"phonology_ipad_set3_grey_10",@"phonology_ipad_set3_grey_11",@"phonology_ipad_set3_grey_12",@"phonology_ipad_set3_grey_13",@"phonology_ipad_set3_grey_14",@"phonology_ipad_set3_grey_15",@"phonology_ipad_set3_grey_16",@"phonology_ipad_set3_grey_17",@"phonology_ipad_set3_grey_18",@"phonology_ipad_set4_grey_1",@"phonology_ipad_set4_grey_2",@"phonology_ipad_set4_grey_3",@"phonology_ipad_set4_grey_4",@"phonology_ipad_set4_grey_5",@"phonology_ipad_set4_grey_6",@"phonology_ipad_set4_grey_7",@"phonology_ipad_set4_grey_8",@"phonology_ipad_set4_grey_9",@"phonology_ipad_set4_grey_10",@"phonology_ipad_set4_grey_11",@"phonology_ipad_set4_grey_12",@"phonology_ipad_set4_grey_13",@"phonology_ipad_set4_grey_14",@"phonology_ipad_set4_grey_15",@"phonology_ipad_set4_grey_16",@"phonology_ipad_set4_grey_17",@"phonology_ipad_set4_grey_18",@"phonology_ipad_set5_grey_1",@"phonology_ipad_set5_grey_2",@"phonology_ipad_set5_grey_3",@"phonology_ipad_set5_grey_4",@"phonology_ipad_set5_grey_5",@"phonology_ipad_set5_grey_6",@"phonology_ipad_set5_grey_7",@"phonology_ipad_set5_grey_8",@"phonology_ipad_set5_grey_9",@"phonology_ipad_set5_grey_10",@"phonology_ipad_set5_grey_11",@"phonology_ipad_set5_grey_12",@"phonology_ipad_set5_grey_13",@"phonology_ipad_set5_grey_14",@"phonology_ipad_set5_grey_15",@"phonology_ipad_set5_grey_16",@"phonology_ipad_set5_grey_17",@"phonology_ipad_set5_grey_18",@"phonology_ipad_set6_grey_1",@"phonology_ipad_set6_grey_2",@"phonology_ipad_set6_grey_3",@"phonology_ipad_set6_grey_4",@"phonology_ipad_set6_grey_5",@"phonology_ipad_set6_grey_6",@"phonology_ipad_set6_grey_7",@"phonology_ipad_set6_grey_8",@"phonology_ipad_set6_grey_9",@"phonology_ipad_set6_grey_10",@"phonology_ipad_set6_grey_11",@"phonology_ipad_set6_grey_12",@"phonology_ipad_set6_grey_13",@"phonology_ipad_set6_grey_14",@"phonology_ipad_set6_grey_15",@"phonology_ipad_set6_grey_16",@"phonology_ipad_set6_grey_17",@"phonology_ipad_set6_grey_18", nil];
         
         self.original_image=[[NSMutableArray alloc] initWithObjects:@"phonology_ipad_set1_original_1",@"phonology_ipad_set1_original_2",@"phonology_ipad_set1_original_3",@"phonology_ipad_set1_original_4",@"phonology_ipad_set1_original_5",@"phonology_ipad_set1_original_6",@"phonology_ipad_set1_original_7",@"phonology_ipad_set1_original_8",@"phonology_ipad_set1_original_9",@"phonology_ipad_set1_original_10",@"phonology_ipad_set1_original_11",@"phonology_ipad_set1_original_12",@"phonology_ipad_set1_original_13",@"phonology_ipad_set1_original_14",@"phonology_ipad_set1_original_15",@"phonology_ipad_set1_original_16",@"phonology_ipad_set2_original_1",@"phonology_ipad_set2_original_2",@"phonology_ipad_set2_original_3",@"phonology_ipad_set2_original_4",@"phonology_ipad_set2_original_5",@"phonology_ipad_set2_original_6",@"phonology_ipad_set2_original_7",@"phonology_ipad_set2_original_8",@"phonology_ipad_set2_original_9",@"phonology_ipad_set2_original_10",@"phonology_ipad_set2_original_11",@"phonology_ipad_set2_original_12",@"phonology_ipad_set2_original_13",@"phonology_ipad_set2_original_14",@"phonology_ipad_set2_original_15",@"phonology_ipad_set2_original_16",@"phonology_ipad_set2_original_17",@"phonology_ipad_set2_original_18",@"phonology_ipad_set3_original_1",@"phonology_ipad_set3_original_2",@"phonology_ipad_set3_original_3",@"phonology_ipad_set3_original_4",@"phonology_ipad_set3_original_5",@"phonology_ipad_set3_original_6",@"phonology_ipad_set3_original_7",@"phonology_ipad_set3_original_8",@"phonology_ipad_set3_original_9",@"phonology_ipad_set3_original_10",@"phonology_ipad_set3_original_11",@"phonology_ipad_set3_original_12",@"phonology_ipad_set3_original_13",@"phonology_ipad_set3_original_14",@"phonology_ipad_set3_original_15",@"phonology_ipad_set3_original_16",@"phonology_ipad_set3_original_17",@"phonology_ipad_set3_original_18",@"phonology_ipad_set4_original_1",@"phonology_ipad_set4_original_2",@"phonology_ipad_set4_original_3",@"phonology_ipad_set4_original_4",@"phonology_ipad_set4_original_5",@"phonology_ipad_set4_original_6",@"phonology_ipad_set4_original_7",@"phonology_ipad_set4_original_8",@"phonology_ipad_set4_original_9",@"phonology_ipad_set4_original_10",@"phonology_ipad_set4_original_11",@"phonology_ipad_set4_original_12",@"phonology_ipad_set4_original_13",@"phonology_ipad_set4_original_14",@"phonology_ipad_set4_original_15",@"phonology_ipad_set4_original_16",@"phonology_ipad_set4_original_17",@"phonology_ipad_set4_original_18",@"phonology_ipad_set5_original_1",@"phonology_ipad_set5_original_2",@"phonology_ipad_set5_original_3",@"phonology_ipad_set5_original_4",@"phonology_ipad_set5_original_5",@"phonology_ipad_set5_original_6",@"phonology_ipad_set5_original_7",@"phonology_ipad_set5_original_8",@"phonology_ipad_set5_original_9",@"phonology_ipad_set5_original_10",@"phonology_ipad_set5_original_11",@"phonology_ipad_set5_original_12",@"phonology_ipad_set5_original_13",@"phonology_ipad_set5_original_14",@"phonology_ipad_set5_original_15",@"phonology_ipad_set5_original_16",@"phonology_ipad_set5_original_17",@"phonology_ipad_set5_original_18",@"phonology_ipad_set6_original_1",@"phonology_ipad_set6_original_2",@"phonology_ipad_set6_original_3",@"phonology_ipad_set6_original_4",@"phonology_ipad_set6_original_5",@"phonology_ipad_set6_original_6",@"phonology_ipad_set6_original_7",@"phonology_ipad_set6_original_8",@"phonology_ipad_set6_original_9",@"phonology_ipad_set6_original_10",@"phonology_ipad_set6_original_11",@"phonology_ipad_set6_original_12",@"phonology_ipad_set6_original_13",@"phonology_ipad_set6_original_14",@"phonology_ipad_set6_original_15",@"phonology_ipad_set6_original_16",@"phonology_ipad_set6_original_17",@"phonology_ipad_set6_original_18", nil];
         
         
         self.right_image=[[NSMutableArray alloc]initWithObjects:@"phonology_ipad_set1_green_1",@"phonology_ipad_set1_green_2",@"phonology_ipad_set1_green_3",@"phonology_ipad_set1_green_4",@"phonology_ipad_set1_green_5",@"phonology_ipad_set1_green_6",@"phonology_ipad_set1_green_7",@"phonology_ipad_set1_green_8",@"phonology_ipad_set1_green_9",@"phonology_ipad_set1_green_10",@"phonology_ipad_set1_green_11",@"phonology_ipad_set1_green_12",@"phonology_ipad_set1_green_13",@"phonology_ipad_set1_green_14",@"phonology_ipad_set1_green_15",@"phonology_ipad_set1_green_16",@"phonology_ipad_set2_green_1",@"phonology_ipad_set2_green_2",@"phonology_ipad_set2_green_3",@"phonology_ipad_set2_green_4",@"phonology_ipad_set2_green_5",@"phonology_ipad_set2_green_6",@"phonology_ipad_set2_green_7",@"phonology_ipad_set2_green_8",@"phonology_ipad_set2_green_9",@"phonology_ipad_set2_green_10",@"phonology_ipad_set2_green_11",@"phonology_ipad_set2_green_12",@"phonology_ipad_set2_green_13",@"phonology_ipad_set2_green_14",@"phonology_ipad_set2_green_15",@"phonology_ipad_set2_green_16",@"phonology_ipad_set2_green_17",@"phonology_ipad_set2_green_18",@"phonology_ipad_set3_green_1",@"phonology_ipad_set3_green_2",@"phonology_ipad_set3_green_3",@"phonology_ipad_set3_green_4",@"phonology_ipad_set3_green_5",@"phonology_ipad_set3_green_6",@"phonology_ipad_set3_green_7",@"phonology_ipad_set3_green_8",@"phonology_ipad_set3_green_9",@"phonology_ipad_set3_green_10",@"phonology_ipad_set3_green_11",@"phonology_ipad_set3_green_12",@"phonology_ipad_set3_green_13",@"phonology_ipad_set3_green_14",@"phonology_ipad_set3_green_15",@"phonology_ipad_set3_green_16",@"phonology_ipad_set3_green_17",@"phonology_ipad_set3_green_18",@"phonology_ipad_set4_green_1",@"phonology_ipad_set4_green_2",@"phonology_ipad_set4_green_3",@"phonology_ipad_set4_green_4",@"phonology_ipad_set4_green_5",@"phonology_ipad_set4_green_6",@"phonology_ipad_set4_green_7",@"phonology_ipad_set4_green_8",@"phonology_ipad_set4_green_9",@"phonology_ipad_set4_green_10",@"phonology_ipad_set4_green_11",@"phonology_ipad_set4_green_12",@"phonology_ipad_set4_green_13",@"phonology_ipad_set4_green_14",@"phonology_ipad_set4_green_15",@"phonology_ipad_set4_green_16",@"phonology_ipad_set4_green_17",@"phonology_ipad_set4_green_18",@"phonology_ipad_set5_green_1",@"phonology_ipad_set5_green_2",@"phonology_ipad_set5_green_3",@"phonology_ipad_set5_green_4",@"phonology_ipad_set5_green_5",@"phonology_ipad_set5_green_6",@"phonology_ipad_set5_green_7",@"phonology_ipad_set5_green_8",@"phonology_ipad_set5_green_9",@"phonology_ipad_set5_green_10",@"phonology_ipad_set5_green_11",@"phonology_ipad_set5_green_12",@"phonology_ipad_set5_green_13",@"phonology_ipad_set5_green_14",@"phonology_ipad_set5_green_15",@"phonology_ipad_set5_green_16",@"phonology_ipad_set5_green_17",@"phonology_ipad_set5_green_18",@"phonology_ipad_set6_green_1",@"phonology_ipad_set6_green_2",@"phonology_ipad_set6_green_3",@"phonology_ipad_set6_green_4",@"phonology_ipad_set6_green_5",@"phonology_ipad_set6_green_6",@"phonology_ipad_set6_green_7",@"phonology_ipad_set6_green_8",@"phonology_ipad_set6_green_9",@"phonology_ipad_set6_green_10",@"phonology_ipad_set6_green_11",@"phonology_ipad_set6_green_12",@"phonology_ipad_set6_green_13",@"phonology_ipad_set6_green_14",@"phonology_ipad_set6_green_15",@"phonology_ipad_set6_green_16",@"phonology_ipad_set6_green_17",@"phonology_ipad_set6_green_18", nil];
         
         
         self.wrong_image=[[NSMutableArray alloc]initWithObjects:@"phonology_ipad_set1_red_1",@"phonology_ipad_set1_red_2",@"phonology_ipad_set1_red_3",@"phonology_ipad_set1_red_4",@"phonology_ipad_set1_red_5",@"phonology_ipad_set1_red_6",@"phonology_ipad_set1_red_7",@"phonology_ipad_set1_red_8",@"phonology_ipad_set1_red_9",@"phonology_ipad_set1_red_10",@"phonology_ipad_set1_red_11",@"phonology_ipad_set1_red_12",@"phonology_ipad_set1_red_13",@"phonology_ipad_set1_red_14",@"phonology_ipad_set1_red_15",@"phonology_ipad_set1_red_16",@"phonology_ipad_set2_red_1",@"phonology_ipad_set2_red_2",@"phonology_ipad_set2_red_3",@"phonology_ipad_set2_red_4",@"phonology_ipad_set2_red_5",@"phonology_ipad_set2_red_6",@"phonology_ipad_set2_red_7",@"phonology_ipad_set2_red_8",@"phonology_ipad_set2_red_9",@"phonology_ipad_set2_red_10",@"phonology_ipad_set2_red_11",@"phonology_ipad_set2_red_12",@"phonology_ipad_set2_red_13",@"phonology_ipad_set2_red_14",@"phonology_ipad_set2_red_15",@"phonology_ipad_set2_red_16",@"phonology_ipad_set2_red_17",@"phonology_ipad_set2_red_18",@"phonology_ipad_set3_red_1",@"phonology_ipad_set3_red_2",@"phonology_ipad_set3_red_3",@"phonology_ipad_set3_red_4",@"phonology_ipad_set3_red_5",@"phonology_ipad_set3_red_6",@"phonology_ipad_set3_red_7",@"phonology_ipad_set3_red_8",@"phonology_ipad_set3_red_9",@"phonology_ipad_set3_red_10",@"phonology_ipad_set3_red_11",@"phonology_ipad_set3_red_12",@"phonology_ipad_set3_red_13",@"phonology_ipad_set3_red_14",@"phonology_ipad_set3_red_15",@"phonology_ipad_set3_red_16",@"phonology_ipad_set3_red_17",@"phonology_ipad_set3_red_18",@"phonology_ipad_set4_red_1",@"phonology_ipad_set4_red_2",@"phonology_ipad_set4_red_3",@"phonology_ipad_set4_red_4",@"phonology_ipad_set4_red_5",@"phonology_ipad_set4_red_6",@"phonology_ipad_set4_red_7",@"phonology_ipad_set4_red_8",@"phonology_ipad_set4_red_9",@"phonology_ipad_set4_red_10",@"phonology_ipad_set4_red_11",@"phonology_ipad_set4_red_12",@"phonology_ipad_set4_red_13",@"phonology_ipad_set4_red_14",@"phonology_ipad_set4_red_15",@"phonology_ipad_set4_red_16",@"phonology_ipad_set4_red_17",@"phonology_ipad_set4_red_18",@"phonology_ipad_set5_red_1",@"phonology_ipad_set5_red_2",@"phonology_ipad_set5_red_3",@"phonology_ipad_set5_red_4",@"phonology_ipad_set5_red_5",@"phonology_ipad_set5_red_6",@"phonology_ipad_set5_red_7",@"phonology_ipad_set5_red_8",@"phonology_ipad_set5_red_9",@"phonology_ipad_set5_red_10",@"phonology_ipad_set5_red_11",@"phonology_ipad_set5_red_12",@"phonology_ipad_set5_red_13",@"phonology_ipad_set5_red_14",@"phonology_ipad_set5_red_15",@"phonology_ipad_set5_red_16",@"phonology_ipad_set5_red_17",@"phonology_ipad_set5_red_18",@"phonology_ipad_set6_red_1",@"phonology_ipad_set6_red_2",@"phonology_ipad_set6_red_3",@"phonology_ipad_set6_red_4",@"phonology_ipad_set6_red_5",@"phonology_ipad_set6_red_6",@"phonology_ipad_set6_red_7",@"phonology_ipad_set6_red_8",@"phonology_ipad_set6_red_9",@"phonology_ipad_set6_red_10",@"phonology_ipad_set6_red_11",@"phonology_ipad_set6_red_12",@"phonology_ipad_set6_red_13",@"phonology_ipad_set6_red_14",@"phonology_ipad_set6_red_15",@"phonology_ipad_set6_red_16",@"phonology_ipad_set6_red_17",@"phonology_ipad_set6_red_18", nil];
         
         dictImagePos=[[NSDictionary alloc]initWithObjects:@[@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1",@"0",@"1"] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"50",@"51",@"52",@"53",@"54",@"55",@"56",@"57",@"58",@"59",@"60",@"61",@"62",@"63",@"64",@"65",@"66",@"67",@"68",@"69",@"70",@"71",@"72",@"73",@"74",@"75",@"76",@"77",@"78",@"79",@"80",@"81",@"82",@"83",@"84",@"85",@"86",@"87",@"88",@"89",@"90",@"91",@"92",@"93",@"94",@"95",@"96",@"97",@"98",@"99",@"100",@"101",@"102",@"103",@"104",@"105"]];
         
         
         
         [self loadQuestionsforAll];
         
     }
    }
}

-(void)shuffle:(NSMutableArray *)arr1
{
    int j;
    
	
	for(int k=0;k<[arr1 count];k++)
	{
		j=arc4random()%[arr1 count];
		[arr1 exchangeObjectAtIndex:k withObjectAtIndex:j];
        
	}
    
}

-(void)shuffle1
{
    int j;
    
	
	for(int k=0;k<3;k++)
	{
		j=arc4random()%4;
		[shufleQuestionArray exchangeObjectAtIndex:k withObjectAtIndex:j];
        [shuffleImageTitleArray exchangeObjectAtIndex:k withObjectAtIndex:j];
        [shuffleImageArray exchangeObjectAtIndex:k withObjectAtIndex:j];
        
	}
}

-(void)loadQuestions
{
    self.answered=NO;
      if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"4"])
      {
        if (self.tryAgainYesBtn==NO)
        {
            NSLog(@"%@",shuffleArray);
          imgstr=[original_image objectAtIndex:[[shuffleArray objectAtIndex:i]intValue]];
          NSLog(@"question image: %@",imgstr);
          QuestionImagelabl.text=[image_title objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]];
          NSLog(@"question label: %@",QuestionImagelabl.text);
           
            if([[appDel.savedSettings objectForKey:@"question text"] isEqualToString:@"off"])
            {
                QuestionImagelabl.hidden=YES;
            }
          [self loadAnswerImage];
          
          QuestionLabl.text=[question_text objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]];
            
            NSLog(@"%@",[question_text objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]]);
            [self.QuestionImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr]]];
            if([[appDel.savedSettings objectForKey:@"question image"] isEqualToString:@"off"])
            {
                self.QuestionImageView.hidden=YES;
            }
          
          [shuffleImageArray addObject:imgstr];
          [shuffleImageTitleArray addObject:QuestionImagelabl.text];
          [shufleQuestionArray addObject:self.QuestionLabl.text];
         // [shuffleCountArray addObject:<#(id)#>]
            
            if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"] && self.FirstTime==NO)
            {
              // [self playAudio:[image_title objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]] with:0];
               // [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
                [self playAudio:[question_text objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]] with:0];
            }
          
            
        }
        else
        {
          if([[appDel.savedSettings objectForKey:@"random"] isEqualToString:@"off"])
          {
            imgstr=[shuffleImageArray objectAtIndex:i];
            NSLog(@"question image: %@",imgstr);
            QuestionImagelabl.text=[shuffleImageTitleArray objectAtIndex:i];
            NSLog(@"question label: %@",QuestionImagelabl.text);
              
            if([[appDel.savedSettings objectForKey:@"question text"] isEqualToString:@"off"])
              {
                  QuestionImagelabl.hidden=YES;
              }
          //  [self tryAgainloadAnswerImage];
              [self loadAnswerImage];
            
            QuestionLabl.text=[shufleQuestionArray objectAtIndex:i];
            [self.QuestionImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr]]];
            if([[appDel.savedSettings objectForKey:@"question image"] isEqualToString:@"off"])
              {
                  self.QuestionImageView.hidden=YES;
              }
            
             NSLog(@"%@",[shufleQuestionArray objectAtIndex:i]);
           if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"] && self.FirstTime==NO)
           {
              
             //[self playAudio:QuestionImagelabl.text with:0];
          // [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
            
            [self playAudio:QuestionLabl.text with:0];
           }
          }
          else
          {
              
              imgstr=[original_image objectAtIndex:[[shuffleArray objectAtIndex:i]intValue]];
              NSLog(@"question image: %@",imgstr);
              QuestionImagelabl.text=[image_title objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]];
              NSLog(@"question label: %@",QuestionImagelabl.text);
              
            if([[appDel.savedSettings objectForKey:@"question text"] isEqualToString:@"off"])
              {
                  QuestionImagelabl.hidden=YES;
              }
              [self loadAnswerImage];
              
              QuestionLabl.text=[question_text objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]];
              NSLog(@"%@",[question_text objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]]);
              [self.QuestionImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr]]];
              if([[appDel.savedSettings objectForKey:@"question image"] isEqualToString:@"off"])
              {
                  self.QuestionImageView.hidden=YES;
              }
              
              if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"] && self.FirstTime==NO)
              {
 
               // [self playAudio:[image_title objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]] with:0];
              //  [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
                [self playAudio:[question_text objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]] with:0];
              }
          }
        }
          
          NSLog(@"shuffleQuestionArray: %@",shufleQuestionArray);
          NSLog(@"shuffleImageTitleArray: %@",shuffleImageTitleArray);
          NSLog(@" shuffleImageArray:%@",shuffleImageArray);
      }
      
      if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"3"])
      {
        if (self.tryAgainYesBtn==NO)
        {
            imgstr=[original_image objectAtIndex:[[shuffleArray objectAtIndex:i]intValue]];
            QuestionImagelabl.text=[image_title objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]];
            if([[appDel.savedSettings objectForKey:@"question text"] isEqualToString:@"off"])
            {
                QuestionImagelabl.hidden=YES;
            }
            [self loadAnswerImage];
            [self.QuestionImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr]]];
            if([[appDel.savedSettings objectForKey:@"question image"] isEqualToString:@"off"])
            {
                self.QuestionImageView.hidden=YES;
            }
            
            QuestionLabl.text=[question_text objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]];
             NSLog(@"%@",[question_text objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]]);
            [self.QuestionImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr]]];
            if([[appDel.savedSettings objectForKey:@"question image"] isEqualToString:@"off"])
            {
                self.QuestionImageView.hidden=YES;
            }
            
            [shuffleImageArray addObject:imgstr];
            [shuffleImageTitleArray addObject:QuestionImagelabl.text];
            [shufleQuestionArray addObject:self.QuestionLabl.text];
            
            if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"] && self.FirstTime==NO)
            {
               // [self playAudio:[image_title objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]] with:0];
               // [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
                [self playAudio:[question_text objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]] with:0];
            }
            
        }
        else
        {
            if([[appDel.savedSettings objectForKey:@"random"] isEqualToString:@"off"])
            {
                imgstr=[shuffleImageArray objectAtIndex:i];
                NSLog(@"question image: %@",imgstr);
                QuestionImagelabl.text=[shuffleImageTitleArray objectAtIndex:i];
                NSLog(@"question label: %@",QuestionImagelabl.text);
                // [self loadAnswerImage];
                
                if([[appDel.savedSettings objectForKey:@"question text"] isEqualToString:@"off"])
                {
                    QuestionImagelabl.hidden=YES;
                }
               // [self tryAgainloadAnswerImage];
                [self loadAnswerImage];
                
                QuestionLabl.text=[shufleQuestionArray objectAtIndex:i];
                [self.QuestionImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr]]];
                if([[appDel.savedSettings objectForKey:@"question image"] isEqualToString:@"off"])
                {
                    self.QuestionImageView.hidden=YES;
                }
                
                NSLog(@"%@",[shufleQuestionArray objectAtIndex:i]);
                if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"] && self.FirstTime==NO)
                {
                 // [self playAudio:QuestionImagelabl.text with:0];
                 // [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
                
                 [self playAudio:QuestionLabl.text with:0];
                }
            }
            else
            {
                //[self shuffle:shuffleArray];
                imgstr=[original_image objectAtIndex:[[shuffleArray objectAtIndex:i]intValue]];
                NSLog(@"question image: %@",imgstr);
                QuestionImagelabl.text=[image_title objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]];
                if([[appDel.savedSettings objectForKey:@"question text"] isEqualToString:@"off"])
                {
                    QuestionImagelabl.hidden=YES;
                }
                NSLog(@"question label: %@",QuestionImagelabl.text);
                [self loadAnswerImage];
                
                QuestionLabl.text=[question_text objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]];
                NSLog(@"%@",[question_text objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]]);
                [self.QuestionImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr]]];
                if([[appDel.savedSettings objectForKey:@"question image"] isEqualToString:@"off"])
                {
                    self.QuestionImageView.hidden=YES;
                }
                
              if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"] && self.FirstTime==NO)
              {
               // [self playAudio:[image_title objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]] with:0];
              //  [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
                [self playAudio:[question_text objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]] with:0];
              }
            }

        }
        
     }
        
     if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"2"])
     {
         if (self.tryAgainYesBtn==NO)
         {
             imgstr=[original_image objectAtIndex:[[shuffleArray objectAtIndex:i]intValue]];
             QuestionImagelabl.text=[image_title objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]];
             
             if([[appDel.savedSettings objectForKey:@"question text"] isEqualToString:@"off"])
             {
                 QuestionImagelabl.hidden=YES;
             }
             [self loadAnswerImage];
             
             QuestionLabl.text=[question_text objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]];
              NSLog(@"%@",[question_text objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]]);
             [self.QuestionImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr]]];
             if([[appDel.savedSettings objectForKey:@"question image"] isEqualToString:@"off"])
             {
                 self.QuestionImageView.hidden=YES;
             }
             
             [shuffleImageArray addObject:imgstr];
             [shuffleImageTitleArray addObject:QuestionImagelabl.text];
             [shufleQuestionArray addObject:self.QuestionLabl.text];
             
             if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"] && self.FirstTime==NO)
             {
               //  [self playAudio:[image_title objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]] with:0];
               //  [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
                 [self playAudio:[question_text objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]] with:0];
             }

         
         }
         else
         {
             if([[appDel.savedSettings objectForKey:@"random"] isEqualToString:@"off"])
             {
                 imgstr=[shuffleImageArray objectAtIndex:i];
                 NSLog(@"question image: %@",imgstr);
                 QuestionImagelabl.text=[shuffleImageTitleArray objectAtIndex:i];
                 if([[appDel.savedSettings objectForKey:@"question text"] isEqualToString:@"off"])
                 {
                     QuestionImagelabl.hidden=YES;
                 }
                 NSLog(@"question label: %@",QuestionImagelabl.text);
                 // [self loadAnswerImage];
                 
               //  [self tryAgainloadAnswerImage];
                 [self loadAnswerImage];
                 
                 QuestionLabl.text=[shufleQuestionArray objectAtIndex:i];
                 [self.QuestionImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr]]];
                 if([[appDel.savedSettings objectForKey:@"question image"] isEqualToString:@"off"])
                 {
                     self.QuestionImageView.hidden=YES;
                 }
                 
                 NSLog(@"%@",[shufleQuestionArray objectAtIndex:i]);
                 
                 if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"] && self.FirstTime==NO)
                 {
                   //[self playAudio:QuestionImagelabl.text with:0];
               //    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
                 
                   [self playAudio:QuestionLabl.text with:0];
                 }
             }
             else
             {
                 //[self shuffle:shuffleArray];
                 imgstr=[original_image objectAtIndex:[[shuffleArray objectAtIndex:i]intValue]];
                 NSLog(@"question image: %@",imgstr);
                 QuestionImagelabl.text=[image_title objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]];
                 NSLog(@"question label: %@",QuestionImagelabl.text);
                 
                 if([[appDel.savedSettings objectForKey:@"question text"] isEqualToString:@"off"])
                 {
                     QuestionImagelabl.hidden=YES;
                 }
                 [self loadAnswerImage];
                 
                 QuestionLabl.text=[question_text objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]];
                 NSLog(@"%@",[question_text objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]]);
                 [self.QuestionImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr]]];
                 if([[appDel.savedSettings objectForKey:@"question image"] isEqualToString:@"off"])
                 {
                     self.QuestionImageView.hidden=YES;
                 }
                 
                 if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"] && self.FirstTime==NO)
                 {
                 //  [self playAudio:[image_title objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]] with:0];
              //    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
                  [self playAudio:[question_text objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]] with:0];
                 }
             }
         }
        
     }
      
    
    
    i++;
}

-(void)loadQuestionsforAll
{
    self.answered=NO;
 //   if(appDel.i==3)
   // {
        if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"4"])
        {
            if (self.tryAgainYesBtn==NO)
            {
                NSLog(@"%@",shuffleArray);
                imgstr=[original_image objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue]];
                NSLog(@"question image: %@",imgstr);
                QuestionImagelabl.text=[image_title objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]];
                NSLog(@"question label: %@",QuestionImagelabl.text);
                
                if([[appDel.savedSettings objectForKey:@"question text"] isEqualToString:@"off"])
                {
                    QuestionImagelabl.hidden=YES;
                }
                //[self loadAnswerImageforAll];
                [self loadAnswerImage];
                QuestionLabl.text=[question_text objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]];
                
                NSLog(@"%@",[question_text objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]]);
                [self.QuestionImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr]]];
                if([[appDel.savedSettings objectForKey:@"question image"] isEqualToString:@"off"])
                {
                    self.QuestionImageView.hidden=YES;
                }
                
                [shuffleImageArray addObject:imgstr];
                [shuffleImageTitleArray addObject:QuestionImagelabl.text];
                [shufleQuestionArray addObject:self.QuestionLabl.text];
                // [shuffleCountArray addObject:<#(id)#>]
                
                if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"] && self.FirstTime==NO)
                {
                  //  [self playAudio:[image_title objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]] with:0];
                 //   [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
                    [self playAudio:[question_text objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]] with:0];
                }
                
                
            }
            else
            {
                if([[appDel.savedSettings objectForKey:@"random"] isEqualToString:@"off"])
                {
                    imgstr=[shuffleImageArray objectAtIndex:i];
                    NSLog(@"question image: %@",imgstr);
                    QuestionImagelabl.text=[shuffleImageTitleArray objectAtIndex:i];
                    NSLog(@"question label: %@",QuestionImagelabl.text);
                    
                    if([[appDel.savedSettings objectForKey:@"question text"] isEqualToString:@"off"])
                    {
                        QuestionImagelabl.hidden=YES;
                    }
                    [self tryAgainloadAnswerImage];
                    
                    QuestionLabl.text=[shufleQuestionArray objectAtIndex:i];
                    [self.QuestionImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr]]];
                    if([[appDel.savedSettings objectForKey:@"question image"] isEqualToString:@"off"])
                    {
                        self.QuestionImageView.hidden=YES;
                    }
                    
                    NSLog(@"%@",[shufleQuestionArray objectAtIndex:i]);
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"] && self.FirstTime==NO)
                    {
                        
                       // [self playAudio:QuestionImagelabl.text with:0];
                   //     [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
                        
                        [self playAudio:QuestionLabl.text with:0];
                    }
                }
                else
                {
                    
                    imgstr=[original_image objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue]];
                    NSLog(@"question image: %@",imgstr);
                    QuestionImagelabl.text=[image_title objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]];
                    NSLog(@"question label: %@",QuestionImagelabl.text);
                    
                    if([[appDel.savedSettings objectForKey:@"question text"] isEqualToString:@"off"])
                    {
                        QuestionImagelabl.hidden=YES;
                    }
                   // [self loadAnswerImageforAll];
                    [self loadAnswerImage];
                    
                    QuestionLabl.text=[question_text objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]];
                    NSLog(@"%@",[question_text objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]]);
                    [self.QuestionImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr]]];
                    if([[appDel.savedSettings objectForKey:@"question image"] isEqualToString:@"off"])
                    {
                        self.QuestionImageView.hidden=YES;
                    }
                    
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"] && self.FirstTime==NO)
                    {
                        
                      //  [self playAudio:[image_title objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]] with:0];
                     //   [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
                        [self playAudio:[question_text objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]] with:0];
                    }
                }
            }
            
            NSLog(@"shuffleQuestionArray: %@",shufleQuestionArray);
            NSLog(@"shuffleImageTitleArray: %@",shuffleImageTitleArray);
            NSLog(@" shuffleImageArray:%@",shuffleImageArray);
        }
        
        if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"3"])
        {
            if (self.tryAgainYesBtn==NO)
            {
                imgstr=[original_image objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue]];
                QuestionImagelabl.text=[image_title objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]];
                if([[appDel.savedSettings objectForKey:@"question text"] isEqualToString:@"off"])
                {
                    QuestionImagelabl.hidden=YES;
                }
               // [self loadAnswerImageforAll];
                [self loadAnswerImage];
                
                [self.QuestionImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr]]];
                if([[appDel.savedSettings objectForKey:@"question image"] isEqualToString:@"off"])
                {
                    self.QuestionImageView.hidden=YES;
                }
                
                QuestionLabl.text=[question_text objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]];
                NSLog(@"%@",[question_text objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]]);
                [self.QuestionImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr]]];
                if([[appDel.savedSettings objectForKey:@"question image"] isEqualToString:@"off"])
                {
                    self.QuestionImageView.hidden=YES;
                }
                
                [shuffleImageArray addObject:imgstr];
                [shuffleImageTitleArray addObject:QuestionImagelabl.text];
                [shufleQuestionArray addObject:self.QuestionLabl.text];
                
                if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"] && self.FirstTime==NO)
                {
                   // [self playAudio:[image_title objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]] with:0];
                 //   [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
                    [self playAudio:[question_text objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]] with:0];
                }
                
            }
            else
            {
                if([[appDel.savedSettings objectForKey:@"random"] isEqualToString:@"off"])
                {
                    imgstr=[shuffleImageArray objectAtIndex:i];
                    NSLog(@"question image: %@",imgstr);
                    QuestionImagelabl.text=[shuffleImageTitleArray objectAtIndex:i];
                    NSLog(@"question label: %@",QuestionImagelabl.text);
                    // [self loadAnswerImage];
                    
                    if([[appDel.savedSettings objectForKey:@"question text"] isEqualToString:@"off"])
                    {
                        QuestionImagelabl.hidden=YES;
                    }
                    [self tryAgainloadAnswerImage];
                    QuestionLabl.text=[shufleQuestionArray objectAtIndex:i];
                    [self.QuestionImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr]]];
                    if([[appDel.savedSettings objectForKey:@"question image"] isEqualToString:@"off"])
                    {
                        self.QuestionImageView.hidden=YES;
                    }
                    
                    NSLog(@"%@",[shufleQuestionArray objectAtIndex:i]);
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"] && self.FirstTime==NO)
                    {
                      //  [self playAudio:QuestionImagelabl.text with:0];
                   //     [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
                        
                        [self playAudio:QuestionLabl.text with:0];
                    }
                }
                else
                {
                    //[self shuffle:shuffleArray];
                    imgstr=[original_image objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue]];
                    NSLog(@"question image: %@",imgstr);
                    QuestionImagelabl.text=[image_title objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]];
                    if([[appDel.savedSettings objectForKey:@"question text"] isEqualToString:@"off"])
                    {
                        QuestionImagelabl.hidden=YES;
                    }
                    NSLog(@"question label: %@",QuestionImagelabl.text);
                    
                  //  [self loadAnswerImageforAll];
                    [self loadAnswerImage];
                    
                    QuestionLabl.text=[question_text objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]];
                    NSLog(@"%@",[question_text objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]]);
                    [self.QuestionImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr]]];
                    if([[appDel.savedSettings objectForKey:@"question image"] isEqualToString:@"off"])
                    {
                        self.QuestionImageView.hidden=YES;
                    }
                    
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"] && self.FirstTime==NO)
                    {
                       // [self playAudio:[image_title objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]] with:0];
                   //     [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
                        [self playAudio:[question_text objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]] with:0];
                    }
                }
                
            }
            
        }
        
        if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"2"])
        {
            if (self.tryAgainYesBtn==NO)
            {
                imgstr=[original_image objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue]];
                QuestionImagelabl.text=[image_title objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]];
                
                if([[appDel.savedSettings objectForKey:@"question text"] isEqualToString:@"off"])
                {
                    QuestionImagelabl.hidden=YES;
                }
               // [self loadAnswerImageforAll];
                [self loadAnswerImage];
                
                QuestionLabl.text=[question_text objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]];
                NSLog(@"%@",[question_text objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]]);
                [self.QuestionImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr]]];
                if([[appDel.savedSettings objectForKey:@"question image"] isEqualToString:@"off"])
                {
                    self.QuestionImageView.hidden=YES;
                }
                
                [shuffleImageArray addObject:imgstr];
                [shuffleImageTitleArray addObject:QuestionImagelabl.text];
                [shufleQuestionArray addObject:self.QuestionLabl.text];
                
                if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"] && self.FirstTime==NO)
                {
                  //  [self playAudio:[image_title objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]] with:0];
                 //   [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
                    [self playAudio:[question_text objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]] with:0];
                }
                
                
            }
            else
            {
                if([[appDel.savedSettings objectForKey:@"random"] isEqualToString:@"off"])
                {
                    imgstr=[shuffleImageArray objectAtIndex:i];
                    NSLog(@"question image: %@",imgstr);
                    QuestionImagelabl.text=[shuffleImageTitleArray objectAtIndex:i];
                    if([[appDel.savedSettings objectForKey:@"question text"] isEqualToString:@"off"])
                    {
                        QuestionImagelabl.hidden=YES;
                    }
                    NSLog(@"question label: %@",QuestionImagelabl.text);
                    // [self loadAnswerImage];
                    
                    [self tryAgainloadAnswerImage];
                    QuestionLabl.text=[shufleQuestionArray objectAtIndex:i];
                    [self.QuestionImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr]]];
                    if([[appDel.savedSettings objectForKey:@"question image"] isEqualToString:@"off"])
                    {
                        self.QuestionImageView.hidden=YES;
                    }
                    
                    NSLog(@"%@",[shufleQuestionArray objectAtIndex:i]);
                    
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"] && self.FirstTime==NO)
                    {
                      //  [self playAudio:QuestionImagelabl.text with:0];
                    //    [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
                        
                        [self playAudio:QuestionLabl.text with:0];
                    }
                }
                else
                {
                    //[self shuffle:shuffleArray];
                    imgstr=[original_image objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue]];
                    NSLog(@"question image: %@",imgstr);
                    QuestionImagelabl.text=[image_title objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]];
                    NSLog(@"question label: %@",QuestionImagelabl.text);
                    
                    if([[appDel.savedSettings objectForKey:@"question text"] isEqualToString:@"off"])
                    {
                        QuestionImagelabl.hidden=YES;
                    }
                  //  [self loadAnswerImageforAll];
                    [self loadAnswerImage];
                    
                    QuestionLabl.text=[question_text objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]];
                    NSLog(@"%@",[question_text objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]]);
                    [self.QuestionImageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr]]];
                    if([[appDel.savedSettings objectForKey:@"question image"] isEqualToString:@"off"])
                    {
                        self.QuestionImageView.hidden=YES;
                    }
                    
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"] && self.FirstTime==NO)
                    {
                      //  [self playAudio:[image_title objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]] with:0];
                     //   [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
                        [self playAudio:[question_text objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]] with:0];
                    }
                }
            }
            
        }
        
        
        
   // }
    
    
    
    i++;
}


-(void)loadAnswerImage
{
    
    int imgpos,p;
    allQsArray=[[NSMutableArray alloc]init];
    AnswerImageShuffleArray=[[NSMutableArray alloc]init];
    fourImageCheckArray=[[NSMutableArray alloc]init];
    imgcount=[original_image indexOfObject:imgstr];
    p=imgcount;
    

    if([[dictImagePos objectForKey:[NSString stringWithFormat:@"%d",imgcount]]isEqualToString:[NSString stringWithFormat:@"0"]])
    {
        imgcount++;
    }
    else
    {
        imgcount--;
    }

    
    for(int t=0;t<=7;t++)
    {
        rnum=arc4random()%[self.original_image count];
        
        
        if(![allQsArray containsObject:[NSString stringWithFormat:@"%d",rnum]] && rnum!=p && rnum!=imgcount)
            [allQsArray addObject:[NSString stringWithFormat:@"%d",rnum]];
        
        else
        {
            t--;
            
            NSLog(@"double entry:%@",[NSString stringWithFormat:@"%d",rnum]);
        }
        
    }
    
    NSLog(@"all arrays:....%@",allQsArray);           //************************************
    
    [self shuffle:allQsArray];
    NSLog(@" shuffled all arrays:....%@",allQsArray);

    
    NSLog(@"p %d",p);
    
    int m;
    for (m=0,count=0;count<=7;count++)
    {
        rand=arc4random()%8;
        // NSLog(@"p %d",p);
        
        if (checkPail==true)
        {
            
            if(![fourImageCheckArray containsObject:[allQsArray objectAtIndex:rand]] && ![[allQsArray objectAtIndex:rand]  isEqual:@"14"] )
                
            {
                
                [fourImageCheckArray addObject:[allQsArray objectAtIndex:rand]];
                
            }
            
            
            else
            {
                count--;
                
                NSLog(@"double entry:%@",[NSString stringWithFormat:@"%d",rand]);
            }
            
            m++;
            NSLog(@"loop iteration %d",m);
        }
        
       else if (checkYellow==true)
        {
            
            if(![fourImageCheckArray containsObject:[allQsArray objectAtIndex:rand]] && ![[allQsArray objectAtIndex:rand]  isEqual:@"3"] )
                
            {
                
                [fourImageCheckArray addObject:[allQsArray objectAtIndex:rand]];
                
            }
            
            
            else
            {
                count--;
                
                NSLog(@"double entry:%@",[NSString stringWithFormat:@"%d",rand]);
            }
            
            m++;
            NSLog(@"loop iteration %d",m);
        }

        
        
        else
        {
            if(![fourImageCheckArray containsObject:[allQsArray objectAtIndex:rand]])
                
            {
                
                [fourImageCheckArray addObject:[allQsArray objectAtIndex:rand]];
                
            }
            
            
            else
            {
                count--;
                
                NSLog(@"double entry:%@",[NSString stringWithFormat:@"%d",rand]);
            }
            
            m++;
            NSLog(@"loop iteration %d",m);
        }

        
    }

    
    if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"4"])
    {
       imgpos=arc4random()%3;

        NSLog(@"fourImageChekArray:%@",fourImageCheckArray);
        
        for (int n=0; n<=2; n++)
        {
                            //[fourImageCheckArray addObject:[NSString stringWithFormat:@"%d",rand]];
                [AnswerImageShuffleArray addObject:[fourImageCheckArray objectAtIndex:n]];
            
            
            if(imgpos==n)
            {
                [AnswerImageShuffleArray addObject:[NSString stringWithFormat:@"%d",imgcount]];
            }

        }
        
        NSLog(@"AnswerImageShuffleArray:%@",AnswerImageShuffleArray);
    }
    
  
    if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"3"])
    {
        imgpos=arc4random()%2;
        
        for (int n=0; n<=1; n++)
        {
            //[fourImageCheckArray addObject:[NSString stringWithFormat:@"%d",rand]];
            [AnswerImageShuffleArray addObject:[fourImageCheckArray objectAtIndex:n]];
            
            if(imgpos==n)
            {
                [AnswerImageShuffleArray addObject:[NSString stringWithFormat:@"%d",imgcount]];
            }
            
        }

    }
    
    if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"2"])
    {
        imgpos=arc4random()%2;
        
        for (int n=0; n<=1; n++)
        {
            //[fourImageCheckArray addObject:[NSString stringWithFormat:@"%d",rand]];
            //[AnswerImageShuffleArray addObject:[fourImageCheckArray objectAtIndex:n]];
            
            if(imgpos==n)
            {
                [AnswerImageShuffleArray addObject:[NSString stringWithFormat:@"%d",imgcount]];
            }
            
            [AnswerImageShuffleArray addObject:[fourImageCheckArray objectAtIndex:n]];
        }

    }
    
    [self loadQs];

}

/*-(void)loadAnswerImageforAll
{
    int imgpos,p;
    allQsArray=[[NSMutableArray alloc]init];
    AnswerImageShuffleArray=[[NSMutableArray alloc]init];
    fourImageCheckArray=[[NSMutableArray alloc]init];
    imgcount=[original_image indexOfObject:imgstr];
    p=imgcount;
    
    
    if([[dictImagePos objectForKey:[NSString stringWithFormat:@"%d",imgcount]]isEqualToString:[NSString stringWithFormat:@"0"]])
    {
        imgcount++;
    }
    else
    {
        imgcount--;
    }
    
    
    for(int t=0;t<=7;t++)
    {
        rnum=arc4random()%[self.original_image count];
        
        
        if(![allQsArray containsObject:[NSString stringWithFormat:@"%d",rnum]] && rnum!=p && rnum!=imgcount)
            [allQsArray addObject:[NSString stringWithFormat:@"%d",rnum]];
        
        else
        {
            t--;
            
            NSLog(@"double entry:%@",[NSString stringWithFormat:@"%d",rnum]);
        }
        
    }
    
    NSLog(@"all arrays:....%@",allQsArray);           //************************************
    
    [self shuffle:allQsArray];
    NSLog(@" shuffled all arrays:....%@",allQsArray);
    
    
    NSLog(@"p %d",p);
    
    int m;
    for (m=0,count=0;count<=7;count++)
    {
        rand=arc4random()%8;
        // NSLog(@"p %d",p);
        if(![fourImageCheckArray containsObject:[allQsArray objectAtIndex:rand]] )
            
        {
            [fourImageCheckArray addObject:[allQsArray objectAtIndex:rand]];
            
        }
        
        
        else
        {
            count--;
            
            NSLog(@"double entry:%@",[NSString stringWithFormat:@"%d",rand]);
        }
        
        m++;
        NSLog(@"loop iteration %d",m);
    }
    
    
    if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"4"])
    {
        imgpos=arc4random()%3;
        
        NSLog(@"fourImageChekArray:%@",fourImageCheckArray);
        
        for (int n=0; n<=2; n++)
        {
            //[fourImageCheckArray addObject:[NSString stringWithFormat:@"%d",rand]];
            [AnswerImageShuffleArray addObject:[fourImageCheckArray objectAtIndex:n]];
            
            if(imgpos==n)
            {
                [AnswerImageShuffleArray addObject:[NSString stringWithFormat:@"%d",imgcount]];
            }
            
        }
    }
    
    
    if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"3"])
    {
        imgpos=arc4random()%2;
        
        for (int n=0; n<=1; n++)
        {
            //[fourImageCheckArray addObject:[NSString stringWithFormat:@"%d",rand]];
            [AnswerImageShuffleArray addObject:[fourImageCheckArray objectAtIndex:n]];
            
            if(imgpos==n)
            {
                [AnswerImageShuffleArray addObject:[NSString stringWithFormat:@"%d",imgcount]];
            }
            
        }
        
    }
    
    if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"2"])
    {
        imgpos=arc4random()%2;
        
        for (int n=0; n<=1; n++)
        {
            //[fourImageCheckArray addObject:[NSString stringWithFormat:@"%d",rand]];
            //[AnswerImageShuffleArray addObject:[fourImageCheckArray objectAtIndex:n]];
            
            if(imgpos==n)
            {
                [AnswerImageShuffleArray addObject:[NSString stringWithFormat:@"%d",imgcount]];
            }
            
            [AnswerImageShuffleArray addObject:[fourImageCheckArray objectAtIndex:n]];
        }
        
    }
    
    [self loadQs];
    
  
} */

-(void)loadQs
{
    
    if (rhymeA==true)
    {
        NSLog(@"%@",[question_text objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]]);
        
        NSLog(@"AnswerImageShuffleArray:%@",AnswerImageShuffleArray);
        
        if([AnswerImageShuffleArray containsObject:@"14"])
        {
          if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"4"])
            {
                for (int c=0; c<=3; c++)
                {
                    if([[AnswerImageShuffleArray objectAtIndex:c] isEqualToString:@"6"])
                    {
                        checkPail=true;
                        [self loadAnswerImage];
                    }
                }
            }
          else if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"3"])
            {
                for (int c=0; c<3; c++)
                {
                    if([[AnswerImageShuffleArray objectAtIndex:c] isEqualToString:@"6"])
                    {
                        checkPail=true;
                        [self loadAnswerImage];
                    }
                }
            }
            
          else if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"2"])
          {
              for (int c=0; c<3; c++)
              {
                  if([[AnswerImageShuffleArray objectAtIndex:c] isEqualToString:@"6"])
                  {
                      checkPail=true;
                      [self loadAnswerImage];
                  }
              }
          }
 
        
        }
        
        else
            checkPail=false;
        
    }
    
    if (rhymeAforAll==true)
    {
        //NSLog(@"%@",[question_text objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]]);
        
        NSLog(@"AnswerImageShuffleArray:%@",AnswerImageShuffleArray);
        
        if([AnswerImageShuffleArray containsObject:@"14"])
        {
            if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"4"])
            {
                for (int c=0; c<=3; c++)
                {
                    if([[AnswerImageShuffleArray objectAtIndex:c] isEqualToString:@"6"])
                    {
                        checkPail=true;
                        [self loadAnswerImage];
                    }
                }
            }
            
            else if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"3"])
            {
                for (int c=0; c<3; c++)
                {
                    if([[AnswerImageShuffleArray objectAtIndex:c] isEqualToString:@"6"])
                    {
                        checkPail=true;
                        [self loadAnswerImage];
                    }
                }
            }
            
            else if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"2"])
            {
                for (int c=0; c<3; c++)
                {
                    if([[AnswerImageShuffleArray objectAtIndex:c] isEqualToString:@"6"])
                    {
                        checkPail=true;
                        [self loadAnswerImage];
                    }
                }
            }

            
        }
        
        else
            checkPail=false;
        
    }

    ///////**************
    if (rhymeE==true)
    {
        NSLog(@"%@",[question_text objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]]);
        
        NSLog(@"AnswerImageShuffleArray:%@",AnswerImageShuffleArray);
        
        if([AnswerImageShuffleArray containsObject:@"3"])
        {
            if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"4"])
            {
                for (int c=0; c<=3; c++)
                {
                    if([[AnswerImageShuffleArray objectAtIndex:c] isEqualToString:@"9"])
                    {
                        checkYellow=true;
                        [self loadAnswerImage];
                    }
                }
            }
            
            else if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"3"])
            {
                for (int c=0; c<3; c++)
                {
                    if([[AnswerImageShuffleArray objectAtIndex:c] isEqualToString:@"9"])
                    {
                        checkYellow=true;
                        [self loadAnswerImage];
                    }
                }
            }
            
            else if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"2"])
            {
                for (int c=0; c<3; c++)
                {
                    if([[AnswerImageShuffleArray objectAtIndex:c] isEqualToString:@"9"])
                    {
                        checkYellow=true;
                        [self loadAnswerImage];
                    }
                }
            }

            
        }
        
        else
            checkYellow=false;
        
    }
    
    if (rhymeEforAll==true)
    {
        //NSLog(@"%@",[question_text objectAtIndex:[[shuffleArray1 objectAtIndex:i]intValue ]]);
        
        NSLog(@"AnswerImageShuffleArray:%@",AnswerImageShuffleArray);
        
        if([AnswerImageShuffleArray containsObject:@"3"])
        {
            if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"4"])
            {
                for (int c=0; c<=3; c++)
                {
                    if([[AnswerImageShuffleArray objectAtIndex:c] isEqualToString:@"9"])
                    {
                        checkYellow=true;
                        [self loadAnswerImage];
                    }
                }
            }
            
            else if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"3"])
            {
                for (int c=0; c<3; c++)
                {
                    if([[AnswerImageShuffleArray objectAtIndex:c] isEqualToString:@"9"])
                    {
                        checkYellow=true;
                        [self loadAnswerImage];
                    }
                }
            }
            
            else if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"2"])
            {
                for (int c=0; c<3; c++)
                {
                    if([[AnswerImageShuffleArray objectAtIndex:c] isEqualToString:@"9"])
                    {
                        checkYellow=true;
                        [self loadAnswerImage];
                    }
                }
            }
            
            
        }
        
        else
            checkYellow=false;
        
    }
    
  if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"4"])
  {
      
   for (l=0; l<=3; l++)
   {
    if(l==0)
    {
      imgstr_grey1=[grey_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
        NSLog(@"1st button: %@",imgstr_grey1);
        
      imgstr_green1=[right_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
       NSLog(@"1st button: %@",imgstr_green1);
        
        imgstr_red1=[wrong_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
        NSLog(@"1st button: %@",imgstr_red1);
        answerImagelabl_1.text=[image_title objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
        NSLog(@"1st button label: %@",answerImagelabl_1.text);

       
        if([[appDel.savedSettings objectForKey:@"answer text"] isEqualToString:@"off"])
        {
            answerImagelabl_1.hidden=YES;
        }
        
        [self.AnswerImageView1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey1]]];
     // [self.AnswerBtnImage1 setImage:AnswerImageView1 forState:UIControlStateNormal];
    }
    if(l==1)
    {
        imgstr_grey2=[grey_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
         NSLog(@"2nd button: %@",imgstr_grey2);
        
        imgstr_green2=[right_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
        NSLog(@"2nd button: %@",imgstr_green2);
        
        imgstr_red2=[wrong_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
        NSLog(@"2nd button: %@",imgstr_red2);
        answerImagelabl_2.text=[image_title objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
        NSLog(@"2nd button label: %@",answerImagelabl_2.text);
        
        if([[appDel.savedSettings objectForKey:@"answer text"] isEqualToString:@"off"])
        {
            answerImagelabl_2.hidden=YES;
        }
        
        [self.AnswerImageView2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey2]]];
       // [self.AnswerBtnImage2 setImage:[UIImage imageNamed:imgstr_grey2] forState:UIControlStateNormal];
    }
    if(l==2)
    {
        imgstr_grey3=[grey_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
        NSLog(@"3rd button: %@",imgstr_grey3);
        
      imgstr_green3=[right_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
        NSLog(@"4th button: %@",imgstr_green3);
        
        imgstr_red3=[wrong_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
        NSLog(@"4th button: %@",imgstr_red3);
        answerImagelabl_3.text=[image_title objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
        NSLog(@"3rd button label: %@",answerImagelabl_3.text);

        if([[appDel.savedSettings objectForKey:@"answer text"] isEqualToString:@"off"])
        {
            answerImagelabl_3.hidden=YES;
        }
        [self.AnswerImageView3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey3]]];
       // [self.AnswerBtnImage3 setImage:[UIImage imageNamed:imgstr_grey3] forState:UIControlStateNormal];
    }
    if(l==3)
    {
        imgstr_grey4=[grey_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
        NSLog(@"4th button: %@",imgstr_grey4);
        
        imgstr_green4=[right_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
        NSLog(@"4th button: %@",imgstr_green4);
        
        imgstr_red4=[wrong_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
        NSLog(@"4th button: %@",imgstr_red4);
        answerImagelabl_4.text=[image_title objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
        NSLog(@"4th button label: %@",answerImagelabl_4.text);
        
        if([[appDel.savedSettings objectForKey:@"answer text"] isEqualToString:@"off"])
        {
            answerImagelabl_4.hidden=YES;
        }
        
        [self.AnswerImageView4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey4]]];
        //[self.AnswerBtnImage4 setImage:[UIImage imageNamed:imgstr_grey4] forState:UIControlStateNormal];
    }
   }
 // [self playAudio:[image_title objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]] with:0];
  }
   
  if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"3"])
    {
        
      /*  AnswerBtnImage1.frame = CGRectMake( 67,75,194,214);
        AnswerBtnImage2.frame = CGRectMake( 415,75,194,214);
        AnswerBtnImage3.frame = CGRectMake( 763,75,194,214);
        AnswerImageView1.frame = CGRectMake( 67,75,194,214);
        AnswerImageView2.frame = CGRectMake( 415,75,194,214);
        AnswerImageView3.frame = CGRectMake( 763,75,194,214);
        answerImagelabl_1.frame=CGRectMake(67, 289, 194, 39);
        answerImagelabl_2.frame=CGRectMake(415, 289, 194, 39);
        answerImagelabl_3.frame=CGRectMake(763, 289, 194, 39);*/
        for (l=0; l<=2; l++)
        {
            if(l==0)
            {
                imgstr_grey1=[grey_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button: %@",imgstr_grey1);
                
                imgstr_green1=[right_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button: %@",imgstr_green1);
                
                imgstr_red1=[wrong_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button: %@",imgstr_red1);
                answerImagelabl_1.text=[image_title objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button label: %@",answerImagelabl_1.text);
                
            if([[appDel.savedSettings objectForKey:@"answer text"] isEqualToString:@"off"])
                {
                    answerImagelabl_1.hidden=YES;
                }
                [self.AnswerImageView1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey1]]];
            }
            if(l==1)
            {
                imgstr_grey2=[grey_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"2nd button: %@",imgstr_grey2);
                
                imgstr_green2=[right_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"2nd button: %@",imgstr_green2);
                
                imgstr_red2=[wrong_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"2nd button: %@",imgstr_red2);
                answerImagelabl_2.text=[image_title objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"2nd button label: %@",answerImagelabl_2.text);

            if([[appDel.savedSettings objectForKey:@"answer text"] isEqualToString:@"off"])
              {
                  answerImagelabl_2.hidden=YES;
              }
                [self.AnswerImageView2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey2]]];
            }

            if(l==2)
            {
                imgstr_grey3=[grey_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"3rd button: %@",imgstr_grey3);
                
                imgstr_green3=[right_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"3rd button: %@",imgstr_green3);
                
                imgstr_red3=[wrong_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"3rd button: %@",imgstr_red3);
                answerImagelabl_3.text=[image_title objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"3rd button label: %@",answerImagelabl_3.text);
            
              if([[appDel.savedSettings objectForKey:@"answer text"] isEqualToString:@"off"])
              {
                  answerImagelabl_3.hidden=YES;
              }
                [self.AnswerImageView3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey3]]];


            }
        }
    }

  if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"2"])
    {
      /*  AnswerBtnImage1.frame = CGRectMake( 230,75,194,214);
        AnswerBtnImage2.frame = CGRectMake( 600,75,194,214);
        AnswerImageView1.frame = CGRectMake( 230,75,194,214);
        AnswerImageView2.frame = CGRectMake( 600,75,194,214);
        answerImagelabl_1.frame=CGRectMake(230, 289, 194, 39);
        answerImagelabl_2.frame=CGRectMake(600, 289, 194, 39); */
        
        for (l=0; l<=1; l++)
        {
            if(l==0)
            {
                imgstr_grey1=[grey_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button: %@",imgstr_grey1);
                
                imgstr_green1=[right_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button: %@",imgstr_green1);
                
                imgstr_red1=[wrong_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button: %@",imgstr_red1);
                answerImagelabl_1.text=[image_title objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button label: %@",answerImagelabl_1.text);

                
              if([[appDel.savedSettings objectForKey:@"answer text"] isEqualToString:@"off"])
              {
                  answerImagelabl_1.hidden=YES;
              }
                [self.AnswerImageView1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey1]]];
            }
            if(l==1)
            {
                imgstr_grey2=[grey_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"2nd button: %@",imgstr_grey2);
                
                imgstr_green2=[right_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button: %@",imgstr_green2);
                
                imgstr_red2=[wrong_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button: %@",imgstr_red2);
                answerImagelabl_2.text=[image_title objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"2nd button label: %@",answerImagelabl_2.text);
                
              if([[appDel.savedSettings objectForKey:@"answer text"] isEqualToString:@"off"])
              {
                  answerImagelabl_2.hidden=YES;
              }
                [self.AnswerImageView2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey2]]];
            }
        }
    }
  
    
}




-(void)tryAgainloadAnswerImage
{
    if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"4"])
    {
       int imgpos,p;
        imgcount=[original_image indexOfObject:imgstr];
        p=imgcount;
        
        if([[dictImagePos objectForKey:[NSString stringWithFormat:@"%d",imgcount]]isEqualToString:[NSString stringWithFormat:@"0"]])
        {
            imgcount++;
        }
        else
        {
            imgcount--;
        }
 
        imgpos=arc4random()%4;
        for (int n=0; n<=3; n++)
        {
            //[fourImageCheckArray addObject:[NSString stringWithFormat:@"%d",rand]];
            
            if(imgpos==n)
            {
                [AnswerImageShuffleArray addObject:[NSString stringWithFormat:@"%d",imgcount]];
            }
            
        }

        
        for (l=0; l<=2; l++)
        {
            if(l==0)
            {
                imgstr_grey1=[grey_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button: %@",imgstr_grey1);
                
                imgstr_green1=[right_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button: %@",imgstr_green1);
                
                imgstr_red1=[wrong_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button: %@",imgstr_red1);
                answerImagelabl_1.text=[image_title objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button label: %@",answerImagelabl_1.text);
                
              if([[appDel.savedSettings objectForKey:@"answer text"] isEqualToString:@"off"])
                {
                    answerImagelabl_1.hidden=YES;
                }
                [self.AnswerImageView1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey1]]];
                // [self.AnswerBtnImage1 setImage:AnswerImageView1 forState:UIControlStateNormal];
            }
            if(l==1)
            {
                imgstr_grey2=[grey_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"2nd button: %@",imgstr_grey2);
                
                imgstr_green2=[right_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"2nd button: %@",imgstr_green2);
                
                imgstr_red2=[wrong_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"2nd button: %@",imgstr_red2);
                answerImagelabl_2.text=[image_title objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"2nd button label: %@",answerImagelabl_2.text);
                
              if([[appDel.savedSettings objectForKey:@"answer text"] isEqualToString:@"off"])
                {
                    answerImagelabl_2.hidden=YES;
                }
                
                [self.AnswerImageView2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey2]]];
                // [self.AnswerBtnImage2 setImage:[UIImage imageNamed:imgstr_grey2] forState:UIControlStateNormal];
            }
            if(l==2)
            {
                imgstr_grey3=[grey_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"3rd button: %@",imgstr_grey3);
                
                imgstr_green3=[right_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"4th button: %@",imgstr_green3);
                
                imgstr_red3=[wrong_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"4th button: %@",imgstr_red3);
                answerImagelabl_3.text=[image_title objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"3rd button label: %@",answerImagelabl_3.text);
                
              if([[appDel.savedSettings objectForKey:@"answer text"] isEqualToString:@"off"])
                {
                    answerImagelabl_3.hidden=YES;
                }
                [self.AnswerImageView3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey3]]];
                // [self.AnswerBtnImage3 setImage:[UIImage imageNamed:imgstr_grey3] forState:UIControlStateNormal];
            }
            if(l==3)
            {
                imgstr_grey4=[grey_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"4th button: %@",imgstr_grey4);
                
                imgstr_green4=[right_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"4th button: %@",imgstr_green4);
                
                imgstr_red4=[wrong_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"4th button: %@",imgstr_red4);
                answerImagelabl_4.text=[image_title objectAtIndex:[[AnswerImageShuffleArray  objectAtIndex:l]intValue]];
                NSLog(@"4th button label: %@",answerImagelabl_4.text);

                
              if([[appDel.savedSettings objectForKey:@"answer text"] isEqualToString:@"off"])
                {
                    answerImagelabl_4.hidden=YES;
                }
                [self.AnswerImageView4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey4]]];
                //[self.AnswerBtnImage4 setImage:[UIImage imageNamed:imgstr_grey4] forState:UIControlStateNormal];
            }
        }
        // [self playAudio:[image_title objectAtIndex:[[shuffleArray objectAtIndex:i]intValue ]] with:0];
    }
    
    if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"3"])
    {
        
        int imgpos,p;
        imgcount=[original_image indexOfObject:imgstr];
        p=imgcount;
        
        if([[dictImagePos objectForKey:[NSString stringWithFormat:@"%d",imgcount]]isEqualToString:[NSString stringWithFormat:@"0"]])
        {
            imgcount++;
        }
        else
        {
            imgcount--;
        }
        
        imgpos=arc4random()%3;
        for (int n=0; n<=2; n++)
        {
            //[fourImageCheckArray addObject:[NSString stringWithFormat:@"%d",rand]];
            
            if(imgpos==n)
            {
                [AnswerImageShuffleArray addObject:[NSString stringWithFormat:@"%d",imgcount]];
            }
            
        }
        
        for (l=0; l<=2; l++)
        {
            if(l==0)
            {
                imgstr_grey1=[grey_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button: %@",imgstr_grey1);
                
                imgstr_green1=[right_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button: %@",imgstr_green1);
                
                imgstr_red1=[wrong_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button: %@",imgstr_red1);
                answerImagelabl_1.text=[image_title objectAtIndex:[[AnswerImageShuffleArray  objectAtIndex:l]intValue]];
                NSLog(@"1st button label: %@",answerImagelabl_1.text);

             
             if([[appDel.savedSettings objectForKey:@"answer text"] isEqualToString:@"off"])
                {
                    answerImagelabl_1.hidden=YES;
                }
                [self.AnswerImageView1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey1]]];
            }
            if(l==1)
            {
                imgstr_grey2=[grey_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"2nd button: %@",imgstr_grey2);
                
                imgstr_green2=[right_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button: %@",imgstr_green2);
                
                imgstr_red2=[wrong_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button: %@",imgstr_red2);
                answerImagelabl_2.text=[image_title objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"2nd button label: %@",answerImagelabl_2.text);
               
             if([[appDel.savedSettings objectForKey:@"answer text"] isEqualToString:@"off"])
                {
                    answerImagelabl_2.hidden=YES;
                }
                [self.AnswerImageView2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey2]]];
            }
            
            if(l==2)
            {
                imgstr_grey3=[grey_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"3rd button: %@",imgstr_grey3);
                
                imgstr_green3=[right_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button: %@",imgstr_green3);
                
                imgstr_red3=[wrong_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button: %@",imgstr_red3);
                answerImagelabl_3.text=[image_title objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"3rd button label: %@",answerImagelabl_3.text);

                
              if([[appDel.savedSettings objectForKey:@"answer text"] isEqualToString:@"off"])
              {
                  answerImagelabl_3.hidden=YES;
              }
                [self.AnswerImageView3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey3]]];
                
                
            }
        }
    }
    
    if([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"2"])
    {
        int imgpos,p;
        imgcount=[original_image indexOfObject:imgstr];
        p=imgcount;
        
        if([[dictImagePos objectForKey:[NSString stringWithFormat:@"%d",imgcount]]isEqualToString:[NSString stringWithFormat:@"0"]])
        {
            imgcount++;
        }
        else
        {
            imgcount--;
        }
        
        imgpos=arc4random()%2;
        for (int n=0; n<=1; n++)
        {
            //[fourImageCheckArray addObject:[NSString stringWithFormat:@"%d",rand]];
            
            if(imgpos==n)
            {
                [AnswerImageShuffleArray addObject:[NSString stringWithFormat:@"%d",imgcount]];
            }
            
        }
        
        for (l=0; l<=1; l++)
        {
            if(l==0)
            {
                imgstr_grey1=[grey_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button: %@",imgstr_grey1);
                
                imgstr_green1=[right_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button: %@",imgstr_green1);
                
                imgstr_red1=[wrong_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button: %@",imgstr_red1);
                answerImagelabl_1.text=[image_title objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button label: %@",answerImagelabl_1.text);
                
             if([[appDel.savedSettings objectForKey:@"answer text"] isEqualToString:@"off"])
              {
                  answerImagelabl_1.hidden=YES;
              }
                [self.AnswerImageView1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey1]]];
            }
            if (l==1) 
            {
                imgstr_grey2=[grey_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"2nd button: %@",imgstr_grey2);
                
                imgstr_green2=[right_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button: %@",imgstr_green2);
                
                imgstr_red2=[wrong_image objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"1st button: %@",imgstr_red2);
                answerImagelabl_2.text=[image_title objectAtIndex:[[AnswerImageShuffleArray objectAtIndex:l]intValue]];
                NSLog(@"2nd button label: %@",answerImagelabl_2.text);

               
              if([[appDel.savedSettings objectForKey:@"answer text"] isEqualToString:@"off"])
              {
                  answerImagelabl_2.hidden=YES;
              }
                [self.AnswerImageView2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey2]]];
            }
        }
    }
    
 
}

-(void)swipeNext
{
    
    if(!self.player.isPlaying && self.answered==YES)
    {
      /*  if (i<=5)
        {
            if ([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"4"])
            {
                AnswerBtnImage1.userInteractionEnabled=YES;
                AnswerBtnImage2.userInteractionEnabled=YES;
                AnswerBtnImage3.userInteractionEnabled=YES;
                AnswerBtnImage4.userInteractionEnabled=YES;
            }
            
            if ([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"3"])
            {
                AnswerBtnImage1.userInteractionEnabled=YES;
                AnswerBtnImage2.userInteractionEnabled=YES;
                AnswerBtnImage3.userInteractionEnabled=YES;
            }
            
            if ([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"2"])
            {
                AnswerBtnImage1.userInteractionEnabled=YES;
                AnswerBtnImage2.userInteractionEnabled=YES;
            }
            
            if([MenuBtnTag_ipad isEqualToString:[NSString stringWithFormat:@"all rhyming words"]])
            {
                [self loadQuestionsforAll];
            }
           else
           {
            [self loadQuestions];
           }
            
        }
        else
        {
           if(appDel.i==3)
           {
             ipad_tryAgainView.hidden=NO;
             [self playAudio:@"Try again?" with:0];
           }
           else if (appDel.i==1)
           {
               iphone5_tryAgainView.hidden=NO;
               [self playAudio:@"Try again?" with:0];
           }
           else
           {
               //iphone tryagain view
           }
        }
           */
        [self NextBtnTap:Nil];
        
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)AnswerImageTapped:(id)sender

{
    
    int btnTag;
    
    if(!self.player.isPlaying)
        
    {
        
        
        
        if ([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"4"])
            
        {
            
            if([sender tag]==1)
                
            {
                
                btnTag=1;
                
                if([[dict_right_answer objectForKey:[NSString stringWithFormat:@"%@",answerImagelabl_1.text]] isEqualToString:[NSString stringWithFormat:@"%@",QuestionLabl.text]])
                    
                {
                    
                    [self.AnswerImageView1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_green1]]];
                    
                    
                    
                    //           if(self.AnswerBtnTapped==NO)
                    
                    //           {
                    
                    //             self.firstAttempt=YES;
                    
                    //             self.AnswerBtnTapped=YES;
                    
                    //           }
                    
                    self.answered=YES;
                    
                    AnswerBtnImage1.userInteractionEnabled=NO;
                    
                    AnswerBtnImage2.userInteractionEnabled=NO;
                    
                    AnswerBtnImage3.userInteractionEnabled=NO;
                    
                    AnswerBtnImage4.userInteractionEnabled=NO;
                    
                    
                    
                    
                    
                    if (self.firstAttempt)
                        
                    {
                        
                        appDel.score=appDel.score+1;
                        
                    }
                    
                    
                    
                    NSLog(@"appd.score else=%lu",(unsigned long)appDel.score);
                    
                    
                    
                    
                    
                    
                    
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"])
                        
                    {
                        
                        
                        
                        [self playAudio:answerImagelabl_1.text with:1];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                        
                        
                        NSUInteger r = arc4random() % [self.correctSound count];
                        
                        NSLog(@"%@",[self.correctSound objectAtIndex:r]);
                        
                        
                        
                        // [self playAudio:[self.correctSound objectAtIndex:r] with:1];
                        
                        [self performSelector:@selector(correctSoundPlay:) withObject:[NSNumber numberWithUnsignedInteger:r]];
                        
                    }
                    
                    
                    
                    else
                        
                    {
                        
                        NSUInteger r = arc4random() % [self.correctSound count];
                        
                        NSLog(@"%@",[self.correctSound objectAtIndex:r]);
                        
                        
                        
                        [self performSelector:@selector(correctSoundPlay:) withObject:[NSNumber numberWithUnsignedInteger:r]];
                        
                    }
                    
                }
                
                else
                    
                {
                    
                    self.answered=NO;
                    
                    
                    
                    [self.AnswerImageView1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_red1]]];
                    
                    
                    
                    AnswerBtnImage2.userInteractionEnabled=NO;
                    
                    AnswerBtnImage3.userInteractionEnabled=NO;
                    
                    AnswerBtnImage4.userInteractionEnabled=NO;
                    
                    
                    
                    self.firstAttempt=NO;
                    
                    
                    
                    
                    
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"])
                        
                    {
                        
                        [self playAudio:answerImagelabl_1.text with:1];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                        NSUInteger r = arc4random() % [self.wrongSound count];
                        
                        [self performSelector:@selector(WrongSoundPlay:) withObject:[NSNumber numberWithUnsignedInt:r]];
                        
                    }
                    
                    else
                        
                    {
                        
                        // [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
                        
                        
                        
                        NSUInteger r = arc4random() % [self.wrongSound count];
                        
                        [self performSelector:@selector(WrongSoundPlay:) withObject:[NSNumber numberWithUnsignedInt:r]];
                        
                        
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                    }
                    
                    
                    
                    [self performSelector:@selector(enableButton:) withObject:[NSNumber numberWithInt:btnTag]];
                    
                    
                    
                }
                
            }
            
            
            
            if([sender tag]==2)
                
            {
                
                btnTag=2;
                
                if([[dict_right_answer objectForKey:[NSString stringWithFormat:@"%@",answerImagelabl_2.text]] isEqualToString:[NSString stringWithFormat:@"%@",QuestionLabl.text]])
                    
                {
                    
                    [self.AnswerImageView2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_green2]]];
                    
                    
                    
                    //           if(self.AnswerBtnTapped==NO)
                    
                    //           {
                    
                    //             self.firstAttempt=YES;
                    
                    //             self.AnswerBtnTapped=YES;
                    
                    //           }
                    
                    self.answered=YES;
                    
                    AnswerBtnImage1.userInteractionEnabled=NO;
                    
                    AnswerBtnImage2.userInteractionEnabled=NO;
                    
                    AnswerBtnImage3.userInteractionEnabled=NO;
                    
                    AnswerBtnImage4.userInteractionEnabled=NO;
                    
                    
                    
                    if (self.firstAttempt)
                        
                    {
                        
                        appDel.score=appDel.score+1;
                        
                    }
                    
                    
                    
                    NSLog(@"appd.score else=%lu",(unsigned long)appDel.score);
                    
                    
                    
                    
                    
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"])
                        
                    {
                        
                        
                        
                        [self playAudio:answerImagelabl_2.text with:1];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                        
                        
                        NSUInteger r = arc4random() % [self.correctSound count];
                        
                        NSLog(@"%@",[self.correctSound objectAtIndex:r]);
                        
                        
                        
                        // [self playAudio:[self.correctSound objectAtIndex:r] with:1];
                        
                        [self performSelector:@selector(correctSoundPlay:) withObject:[NSNumber numberWithUnsignedInteger:r]];
                        
                    }
                    
                    
                    
                    else
                        
                    {
                        
                        NSUInteger r = arc4random() % [self.correctSound count];
                        
                        NSLog(@"%@",[self.correctSound objectAtIndex:r]);
                        
                        
                        
                        // [self playAudio:[self.correctSound objectAtIndex:r] with:1];
                        
                        [self performSelector:@selector(correctSoundPlay:) withObject:[NSNumber numberWithUnsignedInteger:r]];
                        
                    }
                    
                }
                
                else
                    
                {
                    
                    self.answered=NO;
                    
                    [self.AnswerImageView2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_red2]]];
                    
                    
                    
                    //  [self.AnswerBtnImage2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@",imgstr_red2]] forState:UIControlStateHighlighted];
                    
                    
                    
                    AnswerBtnImage1.userInteractionEnabled=NO;
                    
                    AnswerBtnImage3.userInteractionEnabled=NO;
                    
                    AnswerBtnImage4.userInteractionEnabled=NO;
                    
                    
                    
                    self.firstAttempt=NO;
                    
                    
                    
                    
                    
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"])
                        
                    {
                        
                        [self playAudio:answerImagelabl_2.text with:1];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                        NSUInteger r = arc4random() % [self.wrongSound count];
                        
                        [self performSelector:@selector(WrongSoundPlay:) withObject:[NSNumber numberWithUnsignedInt:r]];
                        
                    }
                    
                    else
                        
                    {
                        
                        NSUInteger r = arc4random() % [self.wrongSound count];
                        
                        [self performSelector:@selector(WrongSoundPlay:) withObject:[NSNumber numberWithUnsignedInt:r]];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                    }
                    
                    
                    
                    [self performSelector:@selector(enableButton:) withObject:[NSNumber numberWithInt:btnTag]];
                    
                }
                
            }
            
            
            
            if([sender tag]==3)
                
            {
                
                btnTag=3;
                
                if([[dict_right_answer objectForKey:[NSString stringWithFormat:@"%@",answerImagelabl_3.text]] isEqualToString:[NSString stringWithFormat:@"%@",QuestionLabl.text]])
                    
                {
                    
                    [self.AnswerImageView3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_green3]]];
                    
                    
                    
                    //           if(self.AnswerBtnTapped==NO)
                    
                    //           {
                    
                    //             self.firstAttempt=YES;
                    
                    //             self.AnswerBtnTapped=YES;
                    
                    //           }
                    
                    self.answered=YES;
                    
                    AnswerBtnImage1.userInteractionEnabled=NO;
                    
                    AnswerBtnImage2.userInteractionEnabled=NO;
                    
                    AnswerBtnImage3.userInteractionEnabled=NO;
                    
                    AnswerBtnImage4.userInteractionEnabled=NO;
                    
                    
                    
                    if (self.firstAttempt)
                        
                    {
                        
                        appDel.score=appDel.score+1;
                        
                    }
                    
                    
                    
                    NSLog(@"appd.score else=%d",appDel.score);
                    
                    
                    
                    
                    
                    
                    
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"])
                        
                    {
                        
                        
                        
                        [self playAudio:answerImagelabl_3.text with:1];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                        //              [self playAudio:@"Yes" with:1];
                        
                        //              [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.57]];
                        
                        NSUInteger r = arc4random() % [self.correctSound count];
                        
                        NSLog(@"%@",[self.correctSound objectAtIndex:r]);
                        
                        
                        
                        // [self playAudio:[self.correctSound objectAtIndex:r] with:1];
                        
                        [self performSelector:@selector(correctSoundPlay:) withObject:[NSNumber numberWithUnsignedInteger:r]];
                        
                    }
                    
                    
                    
                    else
                        
                    {
                        
                        NSUInteger r = arc4random() % [self.correctSound count];
                        
                        NSLog(@"%@",[self.correctSound objectAtIndex:r]);
                        
                        
                        
                        [self performSelector:@selector(correctSoundPlay:) withObject:[NSNumber numberWithUnsignedInteger:r]];
                        
                    }
                    
                    
                    
                }
                
                else
                    
                {
                    
                    self.answered=NO;
                    
                    [self.AnswerImageView3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_red3]]];
                    
                    //self.firstAttempt=NO;
                    
                    
                    
                    AnswerBtnImage1.userInteractionEnabled=NO;
                    
                    AnswerBtnImage2.userInteractionEnabled=NO;
                    
                    AnswerBtnImage4.userInteractionEnabled=NO;
                    
                    
                    
                    self.firstAttempt=NO;
                    
                    
                    
                    
                    
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"])
                        
                    {
                        
                        [self playAudio:answerImagelabl_3.text with:1];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                        NSUInteger r = arc4random() % [self.wrongSound count];
                        
                        [self performSelector:@selector(WrongSoundPlay:) withObject:[NSNumber numberWithUnsignedInt:r]];
                        
                    }
                    
                    else
                        
                    {
                        
                        NSUInteger r = arc4random() % [self.wrongSound count];
                        
                        [self performSelector:@selector(WrongSoundPlay:) withObject:[NSNumber numberWithUnsignedInt:r]];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                    }
                    
                    
                    
                    
                    
                    [self performSelector:@selector(enableButton:) withObject:[NSNumber numberWithInt:btnTag]];
                    
                }
                
            }
            
            
            
            if([sender tag]==4)
                
            {
                
                btnTag=4;
                
                if([[dict_right_answer objectForKey:[NSString stringWithFormat:@"%@",answerImagelabl_4.text]] isEqualToString:[NSString stringWithFormat:@"%@",QuestionLabl.text]])
                    
                {
                    
                    [self.AnswerImageView4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_green4]]];
                    
                    
                    
                    //           if(self.AnswerBtnTapped==NO)
                    
                    //           {
                    
                    //             self.firstAttempt=YES;
                    
                    //             self.AnswerBtnTapped=YES;
                    
                    //           }
                    
                    self.answered=YES;
                    
                    AnswerBtnImage1.userInteractionEnabled=NO;
                    
                    AnswerBtnImage2.userInteractionEnabled=NO;
                    
                    AnswerBtnImage3.userInteractionEnabled=NO;
                    
                    AnswerBtnImage4.userInteractionEnabled=NO;
                    
                    
                    
                    if (self.firstAttempt)
                        
                    {
                        
                        appDel.score=appDel.score+1;
                        
                    }
                    
                    
                    
                    NSLog(@"appd.score else=%d",appDel.score);
                    
                    
                    
                    
                    
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"])
                        
                    {
                        
                        
                        
                        [self playAudio:answerImagelabl_4.text with:1];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                        //              [self playAudio:@"Yes" with:1];
                        
                        //              [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.57]];
                        
                        NSUInteger r = arc4random() % [self.correctSound count];
                        
                        NSLog(@"%@",[self.correctSound objectAtIndex:r]);
                        
                        
                        
                        // [self playAudio:[self.correctSound objectAtIndex:r] with:1];
                        
                        [self performSelector:@selector(correctSoundPlay:) withObject:[NSNumber numberWithUnsignedInteger:r]];
                        
                    }
                    
                    
                    
                    else
                        
                    {
                        
                        NSUInteger r = arc4random() % [self.correctSound count];
                        
                        NSLog(@"%@",[self.correctSound objectAtIndex:r]);
                        
                        
                        
                        [self performSelector:@selector(correctSoundPlay:) withObject:[NSNumber numberWithUnsignedInteger:r]];
                        
                    }
                    
                    
                    
                }
                
                else
                    
                {
                    
                    self.answered=NO;
                    
                    [self.AnswerImageView4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_red4]]];
                    
                    //self.firstAttempt=NO;
                    
                    //self.answered=NO;
                    
                    AnswerBtnImage1.userInteractionEnabled=NO;
                    
                    AnswerBtnImage2.userInteractionEnabled=NO;
                    
                    AnswerBtnImage3.userInteractionEnabled=NO;
                    
                    
                    
                    self.firstAttempt=NO;
                    
                    
                    
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"])
                        
                    {
                        
                        [self playAudio:answerImagelabl_4.text with:1];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                        NSUInteger r = arc4random() % [self.wrongSound count];
                        
                        [self performSelector:@selector(WrongSoundPlay:) withObject:[NSNumber numberWithUnsignedInt:r]];
                        
                    }
                    
                    else
                        
                    {
                        
                        NSUInteger r = arc4random() % [self.wrongSound count];
                        
                        [self performSelector:@selector(WrongSoundPlay:) withObject:[NSNumber numberWithUnsignedInt:r]];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                    }
                    
                    
                    
                    
                    
                    [self performSelector:@selector(enableButton:) withObject:[NSNumber numberWithInt:btnTag]];
                    
                }
                
                
                
            }
            
            
            
        }
        
        
        
        if ([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"3"])
            
        {
            
            
            
            if([sender tag]==1)
                
            {
                
                btnTag=1;
                
                if([[dict_right_answer objectForKey:[NSString stringWithFormat:@"%@",answerImagelabl_1.text]] isEqualToString:[NSString stringWithFormat:@"%@",QuestionLabl.text]])
                    
                {
                    
                    [self.AnswerImageView1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_green1]]];
                    
                    
                    
                    //           if(self.AnswerBtnTapped==NO)
                    
                    //           {
                    
                    //             self.firstAttempt=YES;
                    
                    //             self.AnswerBtnTapped=YES;
                    
                    //           }
                    
                    self.answered=YES;
                    
                    AnswerBtnImage1.userInteractionEnabled=NO;
                    
                    AnswerBtnImage2.userInteractionEnabled=NO;
                    
                    AnswerBtnImage3.userInteractionEnabled=NO;
                    
                    
                    
                    if (self.firstAttempt)
                        
                    {
                        
                        appDel.score=appDel.score+1;
                        
                    }
                    
                    
                    
                    NSLog(@"appd.score else=%d",appDel.score);
                    
                    
                    
                    
                    
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"])
                        
                    {
                        
                        
                        
                        [self playAudio:answerImagelabl_1.text with:1];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                        //              [self playAudio:@"Yes" with:1];
                        
                        //              [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.57]];
                        
                        NSUInteger r = arc4random() % [self.correctSound count];
                        
                        NSLog(@"%@",[self.correctSound objectAtIndex:r]);
                        
                        
                        
                        // [self playAudio:[self.correctSound objectAtIndex:r] with:1];
                        
                        [self performSelector:@selector(correctSoundPlay:) withObject:[NSNumber numberWithUnsignedInteger:r]];
                        
                    }
                    
                    else
                        
                    {
                        
                        NSUInteger r = arc4random() % [self.correctSound count];
                        
                        NSLog(@"%@",[self.correctSound objectAtIndex:r]);
                        
                        
                        
                        [self performSelector:@selector(correctSoundPlay:) withObject:[NSNumber numberWithUnsignedInteger:r]];
                        
                    }
                    
                    
                    
                }
                
                else
                    
                {
                    
                    self.answered=NO;
                    
                    [self.AnswerImageView1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_red1]]];
                    
                    
                    
                    //self.firstAttempt=NO;
                    
                    //self.answered=NO;
                    
                    //[self performSelector:@selector(WrongBtnPress:) withObject:nil afterDelay:0.52];
                    
                    
                    
                    AnswerBtnImage2.userInteractionEnabled=NO;
                    
                    AnswerBtnImage3.userInteractionEnabled=NO;
                    
                    
                    
                    self.firstAttempt=NO;
                    
                    
                    
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"])
                        
                    {
                        
                        [self playAudio:answerImagelabl_1.text with:1];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                        NSUInteger r = arc4random() % [self.wrongSound count];
                        
                        [self performSelector:@selector(WrongSoundPlay:) withObject:[NSNumber numberWithUnsignedInt:r]];
                        
                    }
                    
                    else
                        
                    {
                        
                        NSUInteger r = arc4random() % [self.wrongSound count];
                        
                        [self performSelector:@selector(WrongSoundPlay:) withObject:[NSNumber numberWithUnsignedInt:r]];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                    }
                    
                    
                    
                    
                    
                    [self performSelector:@selector(enableButton:) withObject:[NSNumber numberWithInt:btnTag]];
                    
                    
                    
                    
                    
                    
                    
                }
                
            }
            
            
            
            if([sender tag]==2)
                
            {
                
                btnTag=2;
                
                
                
                
                
                if([[dict_right_answer objectForKey:[NSString stringWithFormat:@"%@",answerImagelabl_2.text]] isEqualToString:[NSString stringWithFormat:@"%@",QuestionLabl.text]])
                    
                {
                    
                    [self.AnswerImageView2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_green2]]];
                    
                    
                    
                    //           if(self.AnswerBtnTapped==NO)
                    
                    //           {
                    
                    //             self.firstAttempt=YES;
                    
                    //             self.AnswerBtnTapped=YES;
                    
                    //           }
                    
                    self.answered=YES;
                    
                    AnswerBtnImage1.userInteractionEnabled=NO;
                    
                    AnswerBtnImage2.userInteractionEnabled=NO;
                    
                    AnswerBtnImage3.userInteractionEnabled=NO;
                    
                    
                    
                    if (self.firstAttempt)
                        
                    {
                        
                        appDel.score=appDel.score+1;
                        
                    }
                    
                    
                    
                    NSLog(@"appd.score else=%d",appDel.score);
                    
                    
                    
                    
                    
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"])
                        
                    {
                        
                        
                        
                        [self playAudio:answerImagelabl_2.text with:1];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                        //              [self playAudio:@"Yes" with:1];
                        
                        //              [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.57]];
                        
                        NSUInteger r = arc4random() % [self.correctSound count];
                        
                        NSLog(@"%@",[self.correctSound objectAtIndex:r]);
                        
                        
                        
                        // [self playAudio:[self.correctSound objectAtIndex:r] with:1];
                        
                        [self performSelector:@selector(correctSoundPlay:) withObject:[NSNumber numberWithUnsignedInteger:r]];
                        
                    }
                    
                    else
                        
                    {
                        
                        NSUInteger r = arc4random() % [self.correctSound count];
                        
                        NSLog(@"%@",[self.correctSound objectAtIndex:r]);
                        
                        
                        
                        [self performSelector:@selector(correctSoundPlay:) withObject:[NSNumber numberWithUnsignedInteger:r]];
                        
                    }
                    
                    
                    
                }
                
                else
                    
                {
                    
                    
                    
                    self.answered=NO;
                    
                    [self.AnswerImageView2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_red2]]];
                    
                    
                    
                    AnswerBtnImage1.userInteractionEnabled=NO;
                    
                    AnswerBtnImage3.userInteractionEnabled=NO;
                    
                    
                    
                    self.firstAttempt=NO;
                    
                    
                    
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"])
                        
                    {
                        
                        [self playAudio:answerImagelabl_2.text with:1];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                        NSUInteger r = arc4random() % [self.wrongSound count];
                        
                        [self performSelector:@selector(WrongSoundPlay:) withObject:[NSNumber numberWithUnsignedInt:r]];
                        
                    }
                    
                    else
                        
                    {
                        
                        NSUInteger r = arc4random() % [self.wrongSound count];
                        
                        [self performSelector:@selector(WrongSoundPlay:) withObject:[NSNumber numberWithUnsignedInt:r]];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                    }
                    
                    
                    
                    
                    
                    [self performSelector:@selector(enableButton:) withObject:[NSNumber numberWithInt:btnTag]];
                    
                    
                    
                    
                    
                }
                
            }
            
            
            
            if([sender tag]==3)
                
            {
                
                btnTag=3;
                
                if([[dict_right_answer objectForKey:[NSString stringWithFormat:@"%@",answerImagelabl_3.text]] isEqualToString:[NSString stringWithFormat:@"%@",QuestionLabl.text]])
                    
                {
                    
                    [self.AnswerImageView3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_green3]]];
                    
                    
                    
                    //           if(self.AnswerBtnTapped==NO)
                    
                    //           {
                    
                    //             self.firstAttempt=YES;
                    
                    //             self.AnswerBtnTapped=YES;
                    
                    //           }
                    
                    self.answered=YES;
                    
                    AnswerBtnImage1.userInteractionEnabled=NO;
                    
                    AnswerBtnImage2.userInteractionEnabled=NO;
                    
                    AnswerBtnImage3.userInteractionEnabled=NO;
                    
                    
                    
                    if (self.firstAttempt)
                        
                    {
                        
                        appDel.score=appDel.score+1;
                        
                    }
                    
                    
                    
                    NSLog(@"appd.score else=%d",appDel.score);
                    
                    
                    
                    
                    
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"])
                        
                    {
                        
                        
                        
                        [self playAudio:answerImagelabl_3.text with:1];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                        //              [self playAudio:@"Yes" with:1];
                        
                        //              [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.57]];
                        
                        NSUInteger r = arc4random() % [self.correctSound count];
                        
                        NSLog(@"%@",[self.correctSound objectAtIndex:r]);
                        
                        
                        
                        // [self playAudio:[self.correctSound objectAtIndex:r] with:1];
                        
                        [self performSelector:@selector(correctSoundPlay:) withObject:[NSNumber numberWithUnsignedInteger:r]];
                        
                    }
                    
                    else
                        
                    {
                        
                        NSUInteger r = arc4random() % [self.correctSound count];
                        
                        NSLog(@"%@",[self.correctSound objectAtIndex:r]);
                        
                        
                        
                        [self performSelector:@selector(correctSoundPlay:) withObject:[NSNumber numberWithUnsignedInteger:r]];
                        
                    }
                    
                    
                    
                }
                
                else
                    
                {
                    
                    self.answered=NO;
                    
                    [self.AnswerImageView3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_red3]]];
                    
                    //self.firstAttempt=NO;
                    
                    
                    
                    AnswerBtnImage1.userInteractionEnabled=NO;
                    
                    AnswerBtnImage2.userInteractionEnabled=NO;
                    
                    
                    
                    self.firstAttempt=NO;
                    
                    
                    
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"])
                        
                    {
                        
                        [self playAudio:answerImagelabl_3.text with:1];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                        NSUInteger r = arc4random() % [self.wrongSound count];
                        
                        [self performSelector:@selector(WrongSoundPlay:) withObject:[NSNumber numberWithUnsignedInt:r]];
                        
                    }
                    
                    else
                        
                    {
                        
                        NSUInteger r = arc4random() % [self.wrongSound count];
                        
                        [self performSelector:@selector(WrongSoundPlay:) withObject:[NSNumber numberWithUnsignedInt:r]];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                    }
                    
                    
                    
                    [self performSelector:@selector(enableButton:) withObject:[NSNumber numberWithInt:btnTag]];
                    
                    
                    
                    
                    
                }
                
            }
            
        }
        
        
        
        if ([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"2"])
            
        {
            
            
            
            if([sender tag]==1)
                
            {
                
                btnTag=1;
                
                if([[dict_right_answer objectForKey:[NSString stringWithFormat:@"%@",answerImagelabl_1.text]] isEqualToString:[NSString stringWithFormat:@"%@",QuestionLabl.text]])
                    
                {
                    
                    [self.AnswerImageView1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_green1]]];
                    
                    
                    
                    //           if(self.AnswerBtnTapped==NO)
                    
                    //           {
                    
                    //             self.firstAttempt=YES;
                    
                    //             self.AnswerBtnTapped=YES;
                    
                    //           }
                    
                    self.answered=YES;
                    
                    AnswerBtnImage1.userInteractionEnabled=NO;
                    
                    AnswerBtnImage2.userInteractionEnabled=NO;
                    
                    
                    
                    if (self.firstAttempt)
                        
                    {
                        
                        appDel.score=appDel.score+1;
                        
                    }
                    
                    
                    
                    NSLog(@"appd.score else=%d",appDel.score);
                    
                    
                    
                    
                    
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"])
                        
                    {
                        
                        
                        
                        [self playAudio:answerImagelabl_1.text with:1];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                        //              [self playAudio:@"Yes" with:1];
                        
                        //              [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.57]];
                        
                        NSUInteger r = arc4random() % [self.correctSound count];
                        
                        NSLog(@"%@",[self.correctSound objectAtIndex:r]);
                        
                        
                        
                        // [self playAudio:[self.correctSound objectAtIndex:r] with:1];
                        
                        [self performSelector:@selector(correctSoundPlay:) withObject:[NSNumber numberWithUnsignedInteger:r]];
                        
                    }
                    
                    else
                        
                    {
                        
                        NSUInteger r = arc4random() % [self.correctSound count];
                        
                        NSLog(@"%@",[self.correctSound objectAtIndex:r]);
                        
                        
                        
                        [self performSelector:@selector(correctSoundPlay:) withObject:[NSNumber numberWithUnsignedInteger:r]];
                        
                    }
                    
                    
                    
                }
                
                else
                    
                {
                    
                    self.answered=NO;
                    
                    [self.AnswerImageView1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_red1]]];
                    
                    
                    
                    //self.firstAttempt=NO;
                    
                    //self.answered=NO;
                    
                    //[self performSelector:@selector(WrongBtnPress:) withObject:nil afterDelay:0.52];
                    
                    
                    
                    AnswerBtnImage2.userInteractionEnabled=NO;
                    
                    
                    
                    self.firstAttempt=NO;
                    
                    
                    
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"])
                        
                    {
                        
                        [self playAudio:answerImagelabl_1.text with:1];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                        NSUInteger r = arc4random() % [self.wrongSound count];
                        
                        [self performSelector:@selector(WrongSoundPlay:) withObject:[NSNumber numberWithUnsignedInt:r]];
                        
                    }
                    
                    else
                        
                    {
                        
                        NSUInteger r = arc4random() % [self.wrongSound count];
                        
                        [self performSelector:@selector(WrongSoundPlay:) withObject:[NSNumber numberWithUnsignedInt:r]];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1]];
                        
                    }
                    
                    
                    
                    [self performSelector:@selector(enableButton:) withObject:[NSNumber numberWithInt:btnTag]];
                    
                    
                    
                    
                    
                }
                
            }
            
            
            
            if([sender tag]==2)
                
            {
                
                btnTag=2;
                
                if([[dict_right_answer objectForKey:[NSString stringWithFormat:@"%@",answerImagelabl_2.text]] isEqualToString:[NSString stringWithFormat:@"%@",QuestionLabl.text]])
                    
                {
                    
                    [self.AnswerImageView2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_green2]]];
                    
                    
                    
                    //           if(self.AnswerBtnTapped==NO)
                    
                    //           {
                    
                    //             self.firstAttempt=YES;
                    
                    //             self.AnswerBtnTapped=YES;
                    
                    //           }
                    
                    self.answered=YES;
                    
                    AnswerBtnImage1.userInteractionEnabled=NO;
                    
                    AnswerBtnImage2.userInteractionEnabled=NO;
                    
                    
                    
                    if (self.firstAttempt)
                        
                    {
                        
                        appDel.score=appDel.score+1;
                        
                    }
                    
                    
                    
                    NSLog(@"appd.score else=%d",appDel.score);
                    
                    
                    
                    
                    
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"])
                        
                    {
                        
                        
                        
                        [self playAudio:answerImagelabl_2.text with:1];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                        //              [self playAudio:@"Yes" with:1];
                        
                        //              [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:0.57]];
                        
                        NSUInteger r = arc4random() % [self.correctSound count];
                        
                        NSLog(@"%@",[self.correctSound objectAtIndex:r]);
                        
                        
                        
                        // [self playAudio:[self.correctSound objectAtIndex:r] with:1];
                        
                        [self performSelector:@selector(correctSoundPlay:) withObject:[NSNumber numberWithUnsignedInteger:r]];
                        
                    }
                    
                    
                    
                    else
                        
                    {
                        
                        NSUInteger r = arc4random() % [self.correctSound count];
                        
                        NSLog(@"%@",[self.correctSound objectAtIndex:r]);
                        
                        
                        
                        [self performSelector:@selector(correctSoundPlay:) withObject:[NSNumber numberWithUnsignedInteger:r]];
                        
                    }
                    
                    
                    
                }
                
                else
                    
                {
                    
                    self.answered=NO;
                    
                    [self.AnswerImageView2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_red2]]];
                    
                    AnswerBtnImage1.userInteractionEnabled=NO;
                    
                    
                    
                    self.firstAttempt=NO;
                    
                    
                    
                    if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"])
                        
                    {
                        
                        [self playAudio:answerImagelabl_2.text with:1];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                        NSUInteger r = arc4random() % [self.wrongSound count];
                        
                        [self performSelector:@selector(WrongSoundPlay:) withObject:[NSNumber numberWithUnsignedInt:r]];
                        
                    }
                    
                    else
                        
                    {
                        
                        NSUInteger r = arc4random() % [self.wrongSound count];
                        
                        [self performSelector:@selector(WrongSoundPlay:) withObject:[NSNumber numberWithUnsignedInt:r]];
                        
                        [[NSRunLoop currentRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.5]];
                        
                    }
                    
                    
                    
                    
                    
                    [self performSelector:@selector(enableButton:) withObject:[NSNumber numberWithInt:btnTag]];
                    
                    
                    
                }
                
            }
            
        }
        
    }
    
    
    
}

-(void)correctSoundPlay:(NSNumber *)r1
{
    NSLog(@"r1:%d",[r1 intValue]);
    
    
    [self playAudio:[self.correctSound objectAtIndex:[r1 intValue]] with:1];
}

-(void)WrongSoundPlay:(NSNumber *)r2
{
    NSLog(@"r2:%d",[r2 intValue]);
    
    
    [self playAudio:[self.wrongSound objectAtIndex:[r2 intValue]] with:1];
}


- (void)enableButton:(NSNumber *)theBtnTag
{
    
    int val=[theBtnTag intValue];
  if ([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"4"])
  {
    if(val==1)
    {
      [self.AnswerImageView1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey1]]];
        AnswerBtnImage2.userInteractionEnabled=YES;
        AnswerBtnImage3.userInteractionEnabled=YES;
        AnswerBtnImage4.userInteractionEnabled=YES;
        
    }
    if (val==2)
    {
        [self.AnswerImageView2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey2]]];
        AnswerBtnImage1.userInteractionEnabled=YES;
        AnswerBtnImage3.userInteractionEnabled=YES;
        AnswerBtnImage4.userInteractionEnabled=YES;
    }
    if (val==3)
    {
        [self.AnswerImageView3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey3]]];
        AnswerBtnImage1.userInteractionEnabled=YES;
        AnswerBtnImage2.userInteractionEnabled=YES;
        AnswerBtnImage4.userInteractionEnabled=YES;
    }
    if (val==4)
    {
        [self.AnswerImageView4 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey4]]];
        AnswerBtnImage1.userInteractionEnabled=YES;
        AnswerBtnImage2.userInteractionEnabled=YES;
        AnswerBtnImage3.userInteractionEnabled=YES;
    }
  }

   if ([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"3"])
   {
       if(val==1)
       {
           [self.AnswerImageView1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey1]]];
           AnswerBtnImage2.userInteractionEnabled=YES;
           AnswerBtnImage3.userInteractionEnabled=YES;
           
       }
       if (val==2)
       {
           [self.AnswerImageView2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey2]]];
           AnswerBtnImage1.userInteractionEnabled=YES;
           AnswerBtnImage3.userInteractionEnabled=YES;
       }
       if (val==3)
       {
           [self.AnswerImageView3 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey3]]];
           AnswerBtnImage1.userInteractionEnabled=YES;
           AnswerBtnImage2.userInteractionEnabled=YES;
       }

   }

   if ([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"2"])
   {
       if(val==1)
       {
             [self.AnswerImageView1 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey1]]];
           AnswerBtnImage2.userInteractionEnabled=YES;
           
       }
       if (val==2)
       {
           [self.AnswerImageView2 setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",imgstr_grey2]]];
           AnswerBtnImage1.userInteractionEnabled=YES;
       }
 
   }
    
}


- (IBAction)audioBtnTapped:(id)sender
{
    self.AudioBtnclick=YES;
  if([[appDel.savedSettings objectForKey:@"audio"] isEqualToString:@"on"]&& !self.player.isPlaying )
  {
    
      [self playAudio:QuestionLabl.text with:0];
  }
}

- (IBAction)tryAgainButtons:(id)sender
{
   if([sender tag]==1)
   {
       i=0;
       imgcount=0;
       appDel.score=0;
       self.tryAgainYesBtn=YES;
       [shuffleArray removeAllObjects];
       
       arrSelect=arc4random()%2;
       
       if (arrSelect==0)
       {
           [shuffleArray addObjectsFromArray:shuffleArray2];
       }
       else
       {
           [shuffleArray addObjectsFromArray:shuffleArray3];
       }
       
       NSLog(@"*****shuffleArray*****:%@",shuffleArray);
       
       if (appDel.i==3)
       {
            ipad_tryAgainView.hidden=YES;
       }
       else if(appDel.i==1)
       {
           iphone5_tryAgainView.hidden=YES;
       }
       else if(appDel.i==2)
       {
           iphone_tryAgainView.hidden=YES;
       }
       else if (appDel.i==4)
       {
           iphone6_tryAgainView.hidden=YES;
       }
       else if (appDel.i==5)
       {
           iphone6plus_tryAgainView.hidden=YES;
       }
      
       if ([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"4"])
       {
           AnswerBtnImage1.userInteractionEnabled=YES;
           AnswerBtnImage2.userInteractionEnabled=YES;
           AnswerBtnImage3.userInteractionEnabled=YES;
           AnswerBtnImage4.userInteractionEnabled=YES;
       }
       
       if ([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"3"])
       {
           AnswerBtnImage1.userInteractionEnabled=YES;
           AnswerBtnImage2.userInteractionEnabled=YES;
           AnswerBtnImage3.userInteractionEnabled=YES;
       }
       
       if ([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"2"])
       {
           AnswerBtnImage1.userInteractionEnabled=YES;
           AnswerBtnImage2.userInteractionEnabled=YES;
       }
       if ([[appDel.savedSettings objectForKey:@"random"] isEqualToString:@"on"])
       {
           [self shuffle:shuffleArray];
           [self shuffle:shuffleArray1];
       }
       else
       {
           [self shuffle:AnswerImageShuffleArray];
           [self shuffle1];
       }
       
      if([MenuBtnTag_ipad isEqualToString:[NSString stringWithFormat:@"all rhyming words"]])
      {
        [self loadQuestionsforAll];
      }
      else
      {
        [self loadQuestions];
      }
   }
   else
   {
       [self.navigationController popToRootViewControllerAnimated:YES];
   }
}

- (IBAction)HomeBtnTap:(id)sender {
   if(!self.player.isPlaying)
   {
     [self.navigationController popToRootViewControllerAnimated:YES];
   }
}

- (IBAction)NextBtnTap:(id)sender
{
    self.firstAttempt=YES;
    if(!self.player.isPlaying && self.answered==YES)
    {
        if (i<=5)
        {
            if ([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"4"])
            {
                AnswerBtnImage1.userInteractionEnabled=YES;
                AnswerBtnImage2.userInteractionEnabled=YES;
                AnswerBtnImage3.userInteractionEnabled=YES;
                AnswerBtnImage4.userInteractionEnabled=YES;
            }
            
            if ([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"3"])
            {
                AnswerBtnImage1.userInteractionEnabled=YES;
                AnswerBtnImage2.userInteractionEnabled=YES;
                AnswerBtnImage3.userInteractionEnabled=YES;
            }
            
            if ([[appDel.savedSettings objectForKey:@"answer option"] isEqualToString:@"2"])
            {
                AnswerBtnImage1.userInteractionEnabled=YES;
                AnswerBtnImage2.userInteractionEnabled=YES;
            }
            
            if([MenuBtnTag_ipad isEqualToString:[NSString stringWithFormat:@"all rhyming words"]])
            {
                [self loadQuestionsforAll];
            }
            else
            {
             [self loadQuestions];
            }
        }
        else
        {
            
            [self playAudio:@"Try again" with:1];
            
            //score finalization here
            int x=(appDel.score/6.0)*100;
            appDel.score=x;
            //NSLog(@"Total Score: %d%%",appd.score);
            
            NSLog(@"score:%d",appDel.score);
            
            [self saveScore];
 
            
            if (appDel.i==3)
            {
              ipad_tryAgainView.hidden=NO;
             // [self playAudio:@"Try again?" with:0];
            }
            else if (appDel.i==1)
            {
                iphone5_tryAgainView.hidden=NO;
               // [self playAudio:@"Try again?" with:0];
            }
            else if(appDel.i==2)
            {
                iphone_tryAgainView.hidden=NO;
            }
            else if (appDel.i==4)
            {
                iphone6_tryAgainView.hidden=NO;
            }
            else if (appDel.i==5)
            {
                iphone6plus_tryAgainView.hidden=NO;
            }
        }
        
        
    }

    
}

- (IBAction)tryAgainBtnTap:(id)sender
{
    if(!self.player.isPlaying)
    {
      [self playAudio:@"Try again?" with:1];
    }
}

@end
