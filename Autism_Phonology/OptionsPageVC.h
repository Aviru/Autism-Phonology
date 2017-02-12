//
//  OptionsPageVC_ipad.h
//  Autism_Phonology
//
//  Created by Mindpace on 12/11/14.
//  Copyright (c) 2014 Mindpace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "BaseClass.h"
@interface OptionsPageVC :BaseClass
{
    IBOutlet UILabel *lb1,*lb2,*lb3,*lb4,*lb5,*lb6,*lb7,*lb8,*lb9,*lb10,*lb11,*lb12,*lb13,*lb14;
   // UILabel *percentAudOffAvg,*percentAudOnAvg;
}
- (IBAction)SegmentButtons:(id)sender;
- (IBAction)resetScore:(id)sender;

- (IBAction)BackBtn:(id)sender;

- (IBAction)iphone5ProgressRportBtn:(id)sender;
- (IBAction)iphonePgReportBtn:(id)sender;
- (IBAction)iphone6ProgressRportBtn:(id)sender;
- (IBAction)iphone6PlusProgressRportBtn:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *OptionBackButton;

@property (strong, nonatomic) IBOutlet UISegmentedControl *rq;
@property (strong, nonatomic) IBOutlet UISegmentedControl *audio;
@property (strong, nonatomic) IBOutlet UISegmentedControl *audioType;
@property (strong, nonatomic) IBOutlet UISegmentedControl *answers;
@property (strong, nonatomic) IBOutlet UISegmentedControl *questionText;
@property (strong, nonatomic) IBOutlet UISegmentedControl *answerText;
@property (strong, nonatomic) IBOutlet UISegmentedControl *questionImage;

@property (strong, nonatomic) IBOutlet UILabel *lb1;
@property (strong, nonatomic) IBOutlet UILabel *lb2;
@property (strong, nonatomic) IBOutlet UILabel *lb3;
@property (strong, nonatomic) IBOutlet UILabel *lb4;
@property (strong, nonatomic) IBOutlet UILabel *lb5;
@property (strong, nonatomic) IBOutlet UILabel *lb6;

@property (strong, nonatomic) IBOutlet UILabel *lb7;
@property (strong, nonatomic) IBOutlet UILabel *lb8;
@property (strong, nonatomic) IBOutlet UILabel *lb9;
@property (strong, nonatomic) IBOutlet UILabel *lb10;
@property (strong, nonatomic) IBOutlet UILabel *lb11;
@property (strong, nonatomic) IBOutlet UILabel *lb12;

@property (strong, nonatomic) IBOutlet UILabel *lb13;
@property (strong, nonatomic) IBOutlet UILabel *lb14;


@property (strong, nonatomic)AppDelegate *appDel;

- (void) changeUISegmentFont:(UIView*) myView;
- (void)updateFrame:(UISegmentedControl *) aSeg;
@end
