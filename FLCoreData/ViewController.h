//
//  ViewController.h
//  FLCoreData
//
//  Created by Hari Krishna Palempati on 30/06/15.
//  Copyright (c) 2015 Hari Krishna Palempati. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "FriendsData.h"

@interface ViewController : UIViewController {
    
    NSMutableDictionary * friendCollection;
    
    AppDelegate * AppDel;
    //NSMutableArray * friendsArray;
}

//@property (nonatomic, copy) FriendsData *aReference;
@end

