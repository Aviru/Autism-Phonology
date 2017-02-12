//
//  QuestionsPageVC_ipad.h
//  Autism_Phonology
//
//  Created by Mindpace on 12/11/14.
//  Copyright (c) 2014 Mindpace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>
#import "BaseClass.h"
//@class BaseClass;
@interface QuestionsPageVC: BaseClass


- (IBAction)AnswerImageTapped:(id)sender;
- (IBAction)audioBtnTapped:(id)sender;
- (IBAction)tryAgainButtons:(id)sender;
- (IBAction)HomeBtnTap:(id)sender;
- (IBAction)NextBtnTap:(id)sender;
- (IBAction)tryAgainBtnTap:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *ipad_tryAgainView;

@property (strong, nonatomic) IBOutlet UIView *iphone5_tryAgainView;

@property (strong, nonatomic) IBOutlet UIView *iphone_tryAgainView;

@property (strong, nonatomic) IBOutlet UIView *iphone6_tryAgainView;

@property (strong, nonatomic) IBOutlet UIView *iphone6plus_tryAgainView;

@property (weak, nonatomic) IBOutlet UIButton *question_labl_audio_Btn;
@property (weak, nonatomic) IBOutlet UIButton *SoundIcon;
@property (weak, nonatomic) IBOutlet UIButton *HomeBtn;
@property (weak, nonatomic) IBOutlet UIButton *NextBtn;

@property(nonatomic,strong)AppDelegate *appDel;
@property (weak, nonatomic) IBOutlet UIImageView *AnswerImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *AnswerImageView2;
@property (weak, nonatomic) IBOutlet UIImageView *AnswerImageView3;
@property (weak, nonatomic) IBOutlet UIImageView *AnswerImageView4;

@property (weak, nonatomic) IBOutlet UILabel *answerImagelabl_1;
@property (weak, nonatomic) IBOutlet UILabel *answerImagelabl_2;
@property (weak, nonatomic) IBOutlet UILabel *answerImagelabl_3;
@property (weak, nonatomic) IBOutlet UILabel *answerImagelabl_4;
@property (weak, nonatomic) IBOutlet UIImageView *QuestionImageView;
@property (weak, nonatomic) IBOutlet UILabel *QuestionImagelabl;
@property (weak, nonatomic) IBOutlet UILabel *QuestionLabl;
@property (strong, nonatomic) IBOutlet UIButton *AnswerBtnImage1;
@property (strong, nonatomic) IBOutlet UIButton *AnswerBtnImage2;
@property (strong, nonatomic) IBOutlet UIButton *AnswerBtnImage3;
@property (strong, nonatomic) IBOutlet UIButton *AnswerBtnImage4;

@property (nonatomic,strong) AVAudioPlayer *splayer;
@property (nonatomic,strong) NSTimer *timer;


@property(nonatomic,strong)NSString *MenuBtnTag_ipad;
@property(nonatomic,strong)NSString *MenuBtnTag_iphone;
@property(nonatomic,strong)NSString *MenuBtnTag_iphone5;
@property(nonatomic,strong)NSString *MenuBtnTag_iphone6;
@property(nonatomic,strong)NSString *MenuBtnTag_iphone6plus;

@property(nonatomic,strong)NSMutableArray *question_text;
@property(nonatomic,strong)NSMutableArray *answer_text;
@property(nonatomic,strong)NSMutableArray *right_image;
@property(nonatomic,strong)NSMutableArray *wrong_image;
@property(nonatomic,strong)NSMutableArray *grey_image;
@property(nonatomic,strong)NSMutableArray *original_image;
@property(nonatomic,strong)NSMutableDictionary *dict_right_answer;
@property(nonatomic,strong)NSMutableArray *image_title;
@property(nonatomic,strong)NSMutableArray *allQsArray;
@property (nonatomic,retain) NSMutableArray *correctSound;
@property (nonatomic,retain) NSMutableArray *wrongSound;


@property(assign)BOOL correctAnswerFlag;
@property(assign)BOOL YesBtnTapped;
@property(assign)BOOL answered;
@property(assign)BOOL firstAttempt;
@property(assign)BOOL AnswerBtnTapped;
@property(assign)BOOL tryAgainYesBtn;
@property(assign)BOOL FirstTime;
@property(assign)BOOL AudioBtnclick;
@end
