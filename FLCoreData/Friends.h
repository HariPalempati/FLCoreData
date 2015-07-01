//
//  Friends.h
//  FLCoreData
//
//  Created by Hari Krishna Palempati on 30/06/15.
//  Copyright (c) 2015 Hari Krishna Palempati. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Friends : NSManagedObject

@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSString * userID;
@property (nonatomic, retain) NSString * imageUrl;

@end
