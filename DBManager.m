//
//  DBManager.m
//  eWellyApps
//
//  Created by Vaksys on 17/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import "DBManager.h"
#import "AppDelegate.h"
@implementation DBManager
static DBManager *sharedInstance = nil;
static sqlite3 *database = nil;

+(DBManager*)getSharedInstance
{
    if (!sharedInstance)
    {
        sharedInstance = [[super allocWithZone:NULL]init];
        [sharedInstance createDB];
    }
    return sharedInstance;
}
-(void)createDB
{
        AppDelegate *delegate = [UIApplication sharedApplication].delegate;
    
    
    NSString *pathsToReources = [[NSBundle mainBundle] resourcePath];
    NSString *yourOriginalDatabasePath = [pathsToReources stringByAppendingPathComponent:@"WallyDB.sqlite"];
    NSArray *pathsToDocuments = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [pathsToDocuments objectAtIndex: 0];
    
   delegate.databasePath = [documentsDirectory stringByAppendingPathComponent:@"WallyDB.sqlite"];
    NSFileManager *fmgr=[NSFileManager defaultManager];
    if (![fmgr isReadableFileAtPath:delegate.databasePath])
    {
        [fmgr copyItemAtPath: yourOriginalDatabasePath toPath: delegate.databasePath error: NULL];
    }
}
@end
