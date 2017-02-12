//
//  FetchAndStoreMarksOff.m
//  AutismHelp
//
//  Created by Piyali on 21/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "FetchAndStoreMarksOff.h"

@implementation FetchAndStoreMarksOff

@synthesize marks,gtype,cate,ID;

- (void)dealloc
{
   
    [gtype release];
    [cate release];
    [super dealloc];
}


+(void)moveDatabase
{
    
	NSFileManager *fileManager=[NSFileManager defaultManager];
    
	NSString *theDBPath=[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"whquestionzz.sqlite"];
	NSError *error;
    
	    
	NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    
    NSString *docsDir=[paths objectAtIndex:0];
    
	NSString *newPath=[docsDir stringByAppendingPathComponent:@"whquestionzz.sqlite"];
    
    //[fileManager removeItemAtPath:newPath error:&error];	
    if(![fileManager fileExistsAtPath:newPath])
    {
        [fileManager removeItemAtPath:newPath error:&error];
                
        [fileManager copyItemAtPath:theDBPath toPath:newPath error:&error];
    }
   
}


-(void) addRecords
{
    
    const char *sql="insert into AudioOff (Marks,GameType,Category,ID) values (?,?,?,?)";
    
	sqlite3_stmt *insert_statement=nil;
	
	NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
	
	NSString *docsdir=[paths objectAtIndex:0];
	NSString *thePath=[docsdir stringByAppendingPathComponent:@"whquestionzz.sqlite"];
	
	sqlite3_open([thePath UTF8String], &database);
	
	sqlite3_prepare_v2(database,sql,-1,&insert_statement,NULL);
	
      
    sqlite3_bind_double(insert_statement,1,(double)self.marks);
    
    sqlite3_bind_text(insert_statement,2,[self.gtype UTF8String],-1,SQLITE_TRANSIENT);
    
    sqlite3_bind_text(insert_statement,3,[self.cate UTF8String],-1,SQLITE_TRANSIENT);
    
    sqlite3_bind_int(insert_statement,4,self.ID);
    
    
	
	sqlite3_step(insert_statement);
	sqlite3_finalize(insert_statement);
	sqlite3_close(database);
	
	
	
}



-(NSInteger) getNoOfRecords
{
    
    int flag=0;
    
    @try {
        
        NSFileManager *fileManager=[NSFileManager defaultManager];
        
        
        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        
        NSString *docsdir=[paths objectAtIndex:0];
        
        
        NSString *theDBPath=[docsdir stringByAppendingPathComponent:@"whquestionzz.sqlite"];
        
        
        
        
        BOOL success=[fileManager fileExistsAtPath:theDBPath];
        
        if(!success)
        {
            NSLog(@"Failed to find database file '%@'.",theDBPath);
        }
        if (!(sqlite3_open([theDBPath UTF8String], &database)==SQLITE_OK)) 
        {
            NSLog(@"An error opening database,normally handle error here.");
        }
        
        const char *sql="SELECT * FROM AudioOff where GameType=? AND Category=?";
        
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL)!=SQLITE_OK)
            
        {
            NSLog(@"Error,failed to prepare statement, handle error here.");
        }
        
        
        sqlite3_bind_text(statement,1,[self.gtype UTF8String],-1,SQLITE_TRANSIENT);
        
        sqlite3_bind_text(statement,2,[self.cate UTF8String],-1,SQLITE_TRANSIENT);
        
        
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            
                      
            
            flag++;
        }
        
        if (sqlite3_finalize(statement) !=SQLITE_OK)
        {
            NSLog(@"Failed to finalize data statement,error handling here.");
        }
        
        if(sqlite3_close(database) !=SQLITE_OK )
        {
            NSLog(@"Failed to close database,normally error handling here.");
            
        }
		
    }
    @catch (NSException * e) 
	{
		NSLog(@"An exception occured: %@",[e reason]);
		
		
	}
    
    
    return  flag;
    
    
}

-(void) deleteRecord
{
    
    
    
    const char *sql="delete from AudioOff where Marks=? AND GameType=? AND Category=? AND ID=?";
    
    sqlite3_stmt *delete_statement=nil;
    
    
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    
    NSString *docsDir=[paths objectAtIndex:0];
    
    NSString *thePath=[docsDir stringByAppendingPathComponent:@"whquestionzz.sqlite"];
    
    
    
    sqlite3_open([thePath UTF8String], &database);
    
    sqlite3_prepare_v2(database,sql,-1,&delete_statement,NULL);
    
    sqlite3_bind_double(delete_statement,1,(double)self.marks);
    sqlite3_bind_text(delete_statement,2,[self.gtype UTF8String],-1,SQLITE_TRANSIENT);
    
    sqlite3_bind_text(delete_statement,3,[self.cate UTF8String],-1,SQLITE_TRANSIENT);
    
     sqlite3_bind_int(delete_statement,4,self.ID);
    
    sqlite3_step(delete_statement);
    sqlite3_finalize(delete_statement);
    sqlite3_close(database);
    
    
    
    
    
    
    
    
    
    
}


-(void) fetchFirstRecord
{
    
    
    
    @try {
        
        NSFileManager *fileManager=[NSFileManager defaultManager];
        
        
        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        
        NSString *docsdir=[paths objectAtIndex:0];
        
        
        NSString *theDBPath=[docsdir stringByAppendingPathComponent:@"whquestionzz.sqlite"];
        
        
        
        
        BOOL success=[fileManager fileExistsAtPath:theDBPath];
        
        if(!success)
        {
            NSLog(@"Failed to find database file '%@'.",theDBPath);
        }
        if (!(sqlite3_open([theDBPath UTF8String], &database)==SQLITE_OK)) 
        {
            NSLog(@"An error opening database,normally handle error here.");
        }
        
        const char *sql="SELECT * FROM AudioOff where GameType=? AND Category=?";
        
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL)!=SQLITE_OK)
            
        {
            NSLog(@"Error,failed to prepare statement, handle error here.");
        }
        
        sqlite3_bind_text(statement,1,[self.gtype UTF8String],-1,SQLITE_TRANSIENT);
        
        sqlite3_bind_text(statement,2,[self.cate UTF8String],-1,SQLITE_TRANSIENT);
        
        if(sqlite3_step(statement)==SQLITE_ROW)
        {
            
            
            self.marks =(float)sqlite3_column_double(statement,0);
            
            self.gtype=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(statement,1)];;
            self.cate=[NSString stringWithUTF8String:(const char*)sqlite3_column_text(statement,2)];
            self.ID=sqlite3_column_int(statement,3);
            
            
            
        }
        
        if (sqlite3_finalize(statement) !=SQLITE_OK)
        {
            NSLog(@"Failed to finalize data statement,error handling here.");
        }
        
        if(sqlite3_close(database) !=SQLITE_OK )
        {
            NSLog(@"Failed to close database,normally error handling here.");
            
        }
		
    }
    @catch (NSException * e) 
	{
		NSLog(@"An exception occured: %@",[e reason]);
		
		
	}
    
    
    
    
}


-(int) fetchLastRecordID
{
    int flag=0;
    
    @try {
        
        
        
        NSFileManager *fileManager=[NSFileManager defaultManager];
        
        
        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        
        NSString *docsdir=[paths objectAtIndex:0];
        
        
        NSString *theDBPath=[docsdir stringByAppendingPathComponent:@"whquestionzz.sqlite"];
        
        
        
        
        BOOL success=[fileManager fileExistsAtPath:theDBPath];
        
        if(!success)
        {
            NSLog(@"Failed to find database file '%@'.",theDBPath);
        }
        if (!(sqlite3_open([theDBPath UTF8String], &database)==SQLITE_OK)) 
        {
            NSLog(@"An error opening database,normally handle error here.");
        }
        
        const char *sql="SELECT * FROM AudioOff where GameType=? AND Category=?";
        
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL)!=SQLITE_OK)
            
        {
            NSLog(@"Error,failed to prepare statement, handle error here.");
        }
        
        sqlite3_bind_text(statement,1,[self.gtype UTF8String],-1,SQLITE_TRANSIENT);
        
        sqlite3_bind_text(statement,2,[self.cate UTF8String],-1,SQLITE_TRANSIENT);
        
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            
            
            self.ID=sqlite3_column_int(statement,3);
            
            flag=1;
            
        }
        
        if (sqlite3_finalize(statement) !=SQLITE_OK)
        {
            NSLog(@"Failed to finalize data statement,error handling here.");
        }
        
        if(sqlite3_close(database) !=SQLITE_OK )
        {
            NSLog(@"Failed to close database,normally error handling here.");
            
        }
		
    }
    @catch (NSException * e) 
	{
		NSLog(@"An exception occured: %@",[e reason]);
		
        
        
        
    }
    
    if(flag==0)
        return 0;
    else
        return self.ID;
    
}






-(NSMutableArray *)getValue
{
    
    
    NSMutableArray *arr=[NSMutableArray array];
    int flag=0;
    
    float marks1=0.0;
   
    
    @try {
        
        NSFileManager *fileManager=[NSFileManager defaultManager];
        
        
        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        
        NSString *docsdir=[paths objectAtIndex:0];
        
        
        NSString *theDBPath=[docsdir stringByAppendingPathComponent:@"whquestionzz.sqlite"];
        
        
        BOOL success=[fileManager fileExistsAtPath:theDBPath];
        
        if(!success)
        {
            NSLog(@"Failed to find database file '%@'.",theDBPath);
        }
        if (!(sqlite3_open([theDBPath UTF8String], &database)==SQLITE_OK)) 
        {
            NSLog(@"An error opening database,normally handle error here.");
        }
        
        const char *sql="SELECT * FROM AudioOff where GameType=? AND Category=?";
        
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL)!=SQLITE_OK)
            
        {
            NSLog(@"Error,failed to prepare statement, handle error here.");
        }
        
        self.gtype=@"";
        self.cate=@"a";
        
        
        
        sqlite3_bind_text(statement,1,[self.gtype UTF8String],-1,SQLITE_TRANSIENT);
        
        sqlite3_bind_text(statement,2,[self.cate UTF8String],-1,SQLITE_TRANSIENT);
        
        
        
        
        
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            
            
            marks1 =marks1+(float)sqlite3_column_double(statement,0);
            
           
            
            flag++;
            
        }
        
        if(flag!=0)
            [arr addObject:[NSNumber numberWithFloat:marks1/flag]];
        else
            [arr addObject:@"-"];
        
        if (sqlite3_finalize(statement) !=SQLITE_OK)
        {
            NSLog(@"Failed to finalize data statement,error handling here.");
        }
        
        /////////////////////////////////////////////////////////////////   
        
      
        flag=0;
        marks1=0.0;
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL)!=SQLITE_OK)
            
        {
            NSLog(@"Error,failed to prepare statement, handle error here.");
        }
        
        self.gtype=@"";
        self.cate=@"b";
        
        
        
        sqlite3_bind_text(statement,1,[self.gtype UTF8String],-1,SQLITE_TRANSIENT);
        
        sqlite3_bind_text(statement,2,[self.cate UTF8String],-1,SQLITE_TRANSIENT);
        
        
        
        
        
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            
            
            marks1 =marks1+(float)sqlite3_column_double(statement,0);
            
            
            
            flag++;
            
        }
        
        if(flag!=0)
            [arr addObject:[NSNumber numberWithFloat:marks1/flag]];
        else
            [arr addObject:@"-"];
        
        
        if (sqlite3_finalize(statement) !=SQLITE_OK)
        {
            NSLog(@"Failed to finalize data statement,error handling here.");
        }
        
        ///////////////////////////   
        flag=0;
        marks1=0.0;
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL)!=SQLITE_OK)
            
        {
            NSLog(@"Error,failed to prepare statement, handle error here.");
        }
        
        self.gtype=@"";
        self.cate=@"c";
        
        
        
        sqlite3_bind_text(statement,1,[self.gtype UTF8String],-1,SQLITE_TRANSIENT);
        
        sqlite3_bind_text(statement,2,[self.cate UTF8String],-1,SQLITE_TRANSIENT);
        
        
        
        
        
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            
            
            marks1 =marks1+(float)sqlite3_column_double(statement,0);
            
            
            
            flag++;
            
        }
        
        if(flag!=0)
            [arr addObject:[NSNumber numberWithFloat:marks1/flag]];
        else
            [arr addObject:@"-"];
        
        
        if (sqlite3_finalize(statement) !=SQLITE_OK)
        {
            NSLog(@"Failed to finalize data statement,error handling here.");
        } 
        
        ///////////////////////////  
        
        flag=0;
        marks1=0.0;
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL)!=SQLITE_OK)
            
        {
            NSLog(@"Error,failed to prepare statement, handle error here.");
        }
        
        self.gtype=@"";
        self.cate=@"d";
        
        
        
        sqlite3_bind_text(statement,1,[self.gtype UTF8String],-1,SQLITE_TRANSIENT);
        
        sqlite3_bind_text(statement,2,[self.cate UTF8String],-1,SQLITE_TRANSIENT);
        
        
        
        
        
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            
            
            marks1 =marks1+(float)sqlite3_column_double(statement,0);
            
           
            
            flag++;
            
        }
        
        if(flag!=0)
            [arr addObject:[NSNumber numberWithFloat:marks1/flag]];
        else
            [arr addObject:@"-"];
        
        
        if (sqlite3_finalize(statement) !=SQLITE_OK)
        {
            NSLog(@"Failed to finalize data statement,error handling here.");
        }
        /////////////////////////////////////////**********************  
        flag=0;
        marks1=0.0;
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL)!=SQLITE_OK)
            
        {
            NSLog(@"Error,failed to prepare statement, handle error here.");
        }
        
        
        
        
        self.gtype=@"";
        self.cate=@"e";
        
        
        
        sqlite3_bind_text(statement,1,[self.gtype UTF8String],-1,SQLITE_TRANSIENT);
        
        sqlite3_bind_text(statement,2,[self.cate UTF8String],-1,SQLITE_TRANSIENT);
        
        
        
        
        
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            
            
            marks1 =marks1+(float)sqlite3_column_double(statement,0);
            
          
            
            flag++;
            
        }
        
        if(flag!=0)
            [arr addObject:[NSNumber numberWithFloat:marks1/flag]];
        else
            [arr addObject:@"-"];
        
        if (sqlite3_finalize(statement) !=SQLITE_OK)
        {
            NSLog(@"Failed to finalize data statement,error handling here.");
        }
        
        /////////////////////////////////////////////////////////////////   
        
       
        flag=0;
        marks1=0.0;
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL)!=SQLITE_OK)
            
        {
            NSLog(@"Error,failed to prepare statement, handle error here.");
        }
        
        self.gtype=@"";
        self.cate=@"f";
        
        
        
        sqlite3_bind_text(statement,1,[self.gtype UTF8String],-1,SQLITE_TRANSIENT);
        
        sqlite3_bind_text(statement,2,[self.cate UTF8String],-1,SQLITE_TRANSIENT);
        
        
        
        
        
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            
            
            marks1 =marks1+(float)sqlite3_column_double(statement,0);
            
          
            
            flag++;
            
        }
        
        if(flag!=0)
            [arr addObject:[NSNumber numberWithFloat:marks1/flag]];
        else
            [arr addObject:@"-"];
        
        
        if (sqlite3_finalize(statement) !=SQLITE_OK)
        {
            NSLog(@"Failed to finalize data statement,error handling here.");
        }
        
        ///////////////////////////   
        flag=0;
        marks1=0.0;
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL)!=SQLITE_OK)
            
        {
            NSLog(@"Error,failed to prepare statement, handle error here.");
        }
        
        self.gtype=@"";
        self.cate=@"g";
        
        
        
        sqlite3_bind_text(statement,1,[self.gtype UTF8String],-1,SQLITE_TRANSIENT);
        
        sqlite3_bind_text(statement,2,[self.cate UTF8String],-1,SQLITE_TRANSIENT);
        
        
        
        
        
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            
            
            marks1 =marks1+(float)sqlite3_column_double(statement,0);
            
            
            
            flag++;
            
        }
        
        if(flag!=0)
            [arr addObject:[NSNumber numberWithFloat:marks1/flag]];
        else
            [arr addObject:@"-"];
        
        
        if (sqlite3_finalize(statement) !=SQLITE_OK)
        {
            NSLog(@"Failed to finalize data statement,error handling here.");
        } 
        
        ///////////////////////////  
        
        /*flag=0;
        marks1=0.0;
        if (sqlite3_prepare_v2(database, sql, -1, &statement, NULL)!=SQLITE_OK)
            
        {
            NSLog(@"Error,failed to prepare statement, handle error here.");
        }
        
        self.gtype=@"who_b_";
        self.cate=@"";
        
        
        
        sqlite3_bind_text(statement,1,[self.gtype UTF8String],-1,SQLITE_TRANSIENT);
        
        sqlite3_bind_text(statement,2,[self.cate UTF8String],-1,SQLITE_TRANSIENT);
        
        
        while(sqlite3_step(statement)==SQLITE_ROW)
        {
            
            
            marks1 =marks1+(float)sqlite3_column_double(statement,0);
            
            flag++;
            
        }
        
        if(flag!=0)
            [arr addObject:[NSNumber numberWithFloat:marks1/flag]];
        else
            [arr addObject:[NSNumber numberWithFloat:0.0]];
        
        
        if (sqlite3_finalize(statement) !=SQLITE_OK)
        {
            NSLog(@"Failed to finalize data statement,error handling here.");
        }        
        */
    
        
        /////////////////////////////////////////////////////***************    
        if(sqlite3_close(database) !=SQLITE_OK )
        {
            NSLog(@"Failed to close database,normally error handling here.");
            
        }
		
    }
    @catch (NSException * e) 
	{
		NSLog(@"An exception occured: %@",[e reason]);
		
		
	}
    
    
    
    
    return arr;    


}
@end
