//
//  BaseClass.h
//  WH Language Concepts
//
//  Created by Mindpace on 17/01/13.
//  Copyright (c) 2013 Mindpace. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import <AVFoundation/AVAudioPlayer.h>

#import "FetchAndStoreMarksOn.h"
#import "FetchAndStoreMarksOff.h"


@interface BaseClass : UIViewController
{
    AVAudioPlayer *player;
   // NSUserDefaults *SavedSettings;
    int randAudio;
}
@property (nonatomic,retain) AVAudioPlayer *player;
//@property (nonatomic,retain) NSUserDefaults *SavedSettings;
@property(nonatomic,strong)AppDelegate *appDel;

@property (nonatomic,retain) FetchAndStoreMarksOn *fon;
@property (nonatomic,retain) FetchAndStoreMarksOff *foff;


-(void) playAudio :(NSString*)file with:(int)flag;
-(void)shuffle:(NSMutableArray *)arr;
-(NSString*)selectXib:(NSString*)xibName;
-(void)saveScore;
@end
