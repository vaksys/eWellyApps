//
//  DBManager.h
//  eWellyApps
//
//  Created by Vaksys on 17/05/16.
//  Copyright © 2016 Vakratunda PVL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
@interface DBManager : NSObject
{
   // NSString *databasePath;
}
+(DBManager*)getSharedInstance;
-(void)createDB;
-(NSMutableArray*)getAllData;

@end
