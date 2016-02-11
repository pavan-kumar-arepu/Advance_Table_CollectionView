//
//  ViewController.m
//  BasicCollectionView
//
//  Created by Pavankumar Arepu on 10/02/2016.
//  Copyright © 2016 ppam. All rights reserved.
//

#import "ViewController.h"
#import "CustomCollectionViewCell.h"
#import "TableViewCell.h"


@interface ViewController ()
{
    NSMutableArray *macItemArray,*macItemLableArray;
    NSMutableDictionary *macDictionary;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    macItemArray = [[NSMutableArray alloc]init];
    macItemLableArray = [[NSMutableArray alloc]init];
    

    NSString *path = [[NSBundle mainBundle] pathForResource:@"MacItemsDB" ofType:@"plist"];
    macDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    
    NSLog(@"macDictionary: %@",macDictionary);

    for (NSString* item in macDictionary)
    {
        [macItemArray addObject:[[macDictionary valueForKey:item] objectAtIndex:0]];
        [macItemLableArray addObject:[[macDictionary valueForKey:item] objectAtIndex:1]];
    }
    
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark <UITableViewDataSouce and Delegate Methods>

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [macItemArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    TableViewCell *simpleTableCell  = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
   
    if (simpleTableCell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil];
        simpleTableCell = [nib objectAtIndex:0];
    }

    simpleTableCell.tableImageView.image = [UIImage imageNamed:[macItemArray objectAtIndex:indexPath.row]];
    simpleTableCell.tableLabel.text = [macItemLableArray objectAtIndex:indexPath.row];
    return simpleTableCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _itemImageView.image = [UIImage imageNamed:[macItemArray objectAtIndex:indexPath.row]];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [macItemArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString * const reuseIdentifier = @"Cell";
    
    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    cell.cellImageView.image = [UIImage imageNamed:[macItemArray objectAtIndex:indexPath.row]];
    cell.cellLabel.text = [macItemLableArray objectAtIndex:indexPath.row];
    
    return cell;
}

#pragma mark - Collection View Delegate Methods
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (self.view.frame.size.width == 320) {
        return UIEdgeInsetsMake(30, 30, 30, 30);
    }
    return UIEdgeInsetsMake(10, 10, 10, 10);
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    _itemImageView.image = [UIImage imageNamed:[macItemArray objectAtIndex:indexPath.row]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
