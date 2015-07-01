//
//  CoreData.m
//  FLCoreData
//
//  Created by Hari Krishna Palempati on 30/06/15.
//  Copyright (c) 2015 Hari Krishna Palempati. All rights reserved.
//

#import "CoreData.h"
#import "FriendsData.h"
#import "Friends.h"

@interface CoreData ()

@end

@implementation CoreData

@synthesize aReference = _aReference;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    cdtable = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    cdtable.delegate = self;
    cdtable.dataSource = self;
    [self.view addSubview:cdtable];
    
    AppDel = [[UIApplication sharedApplication]delegate];
    
    [self AddRelated];
    
    [self GetCoreData];
    
    selectedIndex = 0;
}

- (void)GetCoreData {
    
//    NSEntityDescription * Entity = [NSEntityDescription entityForName:@"Friends" inManagedObjectContext:AppDel.managedObjectContext];
    
    NSFetchRequest * Request = [NSFetchRequest fetchRequestWithEntityName:@"Friends"];
    
    NSError * Error;
    
    Array = [AppDel.managedObjectContext executeFetchRequest:Request error:&Error];
    
    if (Error == nil) {
        
        [self.aReference.friendsArray removeAllObjects];
        [self.aReference.friendsArray addObjectsFromArray:Array];
        [cdtable reloadData];
    }
}

- (void)AddRelated {
    
    Friends * fdata = [NSEntityDescription insertNewObjectForEntityForName:@"Friends" inManagedObjectContext:AppDel.managedObjectContext];
    
    //fdata.userName = [self.aReference.friendsArray observeValueForKeyPath:@"" ofObject:@"userName" change:<#(NSDictionary *)#> context:<#(void *)#>]
    fdata.userName = [self.aReference.friendsArray performSelector:nil withObject:@"userName"];
    
    fdata.userID = [self.aReference.friendsArray performSelector:nil withObject:@"userID"];
    
    fdata.imageUrl = [self.aReference.friendsArray performSelector:nil withObject:@"imageUrl"];
    
    NSError * Error;
    
    [AppDel.managedObjectContext save:&Error];
    
    if (Error == nil) {
        
        [cdtable reloadData];
    }
    
    [self GetCoreData];
}

- (void)DeleteMethod {
    
    Friends * fs = [Array objectAtIndex:selectedIndex];
    [AppDel.managedObjectContext deleteObject:fs];
    
    NSError * Error;
    
    [AppDel.managedObjectContext save:&Error];
    
    if (Error == nil) {
        
        [cdtable reloadData];
    }
    
    [self GetCoreData];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.aReference.friendsArray count];
    
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    Friends * fs = [Array objectAtIndex:indexPath.row];
    
    cell.textLabel.text = fs.userID;
    cell.detailTextLabel.text = fs.userName;
    cell.imageView.image = (UIImage *)fs.imageUrl;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    selectedIndex = indexPath.row;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
