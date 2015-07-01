//
//  ViewController.m
//  FLCoreData
//
//  Created by Hari Krishna Palempati on 30/06/15.
//  Copyright (c) 2015 Hari Krishna Palempati. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "FriendsData.h"
#import "CoreData.h"
#import "Friends.h"

@interface ViewController ()

@end

@implementation ViewController

//@synthesize aReference = aReference;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
    
    
    UIButton * Friends = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 200, 40)];
    [Friends setTitle:@"Friends" forState:UIControlStateNormal];
    [Friends setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [Friends addTarget:self action:@selector(FriendsClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:Friends];
    
    UIButton * AddCoreData = [[UIButton alloc]initWithFrame:CGRectMake(100, 150, 200, 40)];
    [AddCoreData setTitle:@"GetCoreData" forState:UIControlStateNormal];
    [AddCoreData setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [AddCoreData addTarget:self action:@selector(AddCoreDataClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:AddCoreData];
    
    
    UIButton * DeleteCoreData = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 200, 40)];
    [DeleteCoreData setTitle:@"DeleteCoreData" forState:UIControlStateNormal];
    [DeleteCoreData setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [DeleteCoreData addTarget:self action:@selector(DeleteCoreDataClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:DeleteCoreData];
    
    
    UIButton * UpdateCoreData = [[UIButton alloc]initWithFrame:CGRectMake(100, 250, 200, 40)];
    [UpdateCoreData setTitle:@"UpdateCoreData" forState:UIControlStateNormal];
    [UpdateCoreData setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [UpdateCoreData addTarget:self action:@selector(UpdateCoreDataClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:UpdateCoreData];
    
    AppDel = [[UIApplication sharedApplication]delegate];
    
    
}

- (void)GetCoreData {
    
    
}

- (void)AddCoreDataClicked {
    
//    Friends * fdata = [NSEntityDescription insertNewObjectForEntityForName:@"Friends" inManagedObjectContext:AppDel.managedObjectContext];
//    
//    //fdata.userName = [self.aReference.friendsArray observeValueForKeyPath:@"" ofObject:@"userName" change:<#(NSDictionary *)#> context:<#(void *)#>]
//    fdata.userName = [self.aReference.friendsArray performSelector:nil withObject:@"userName"];
//    
//    fdata.userID = [self.aReference.friendsArray performSelector:nil withObject:@"userID"];
//
//    fdata.imageUrl = [self.aReference.friendsArray performSelector:nil withObject:@"imageUrl"];
//    
//    NSError * Error;
//    
//    [AppDel.managedObjectContext save:&Error];
    
    CoreData * c = [[CoreData alloc]init];
    
    [self.navigationController pushViewController:c animated:YES];
    
}

- (void)DeleteCoreDataClicked {
    
    CoreData * c = [[CoreData alloc]init];
    
    [self.navigationController pushViewController:c animated:YES];
}

- (void)UpdateCoreDataClicked {
 
    CoreData * c = [[CoreData alloc]init];
    
    [self.navigationController pushViewController:c animated:YES];
}

- (void)FriendsClicked {
    
    FriendsData * f = [[FriendsData alloc]init];
    
    [self.navigationController pushViewController:f animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
