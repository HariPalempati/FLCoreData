//
//  CoreData.h
//  FLCoreData
//
//  Created by Hari Krishna Palempati on 30/06/15.
//  Copyright (c) 2015 Hari Krishna Palempati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FriendsData.h"
#import "AppDelegate.h"

@interface CoreData : UIViewController<UITableViewDataSource,UITableViewDelegate> {
    
    UITableView * cdtable;
    
    NSMutableArray * data;
    
      AppDelegate * AppDel;
    
    NSArray * Array;
    
    NSInteger * selectedIndex;
}

@property (nonatomic, copy) FriendsData *aReference;

@end
