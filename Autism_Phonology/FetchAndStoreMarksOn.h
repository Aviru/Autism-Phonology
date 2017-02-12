//
//  FetchAndStoreMarks.h
//  AutismHelp
//
//  Created by Piyali on 21/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface FetchAndStoreMarksOn : NSObject
{
    float marks;
    NSString *gtype;
    NSString *cate;
    int ID;
    sqlite3 *database;
}

@property(assign) float marks;
@property(nonatomic,retain) NSString *gtype;
@property(nonatomic,retain) NSString *cate;
@property(assign) int ID;
+(void)moveDatabase;
-(void) addRecords;
-(NSInteger) getNoOfRecords;
-(void) deleteRecord;
-(void) fetchFirstRecord;
-(int) fetchLastRecordID;
-(NSMutableArray *)getValue;
-(void)del_records;
@end
