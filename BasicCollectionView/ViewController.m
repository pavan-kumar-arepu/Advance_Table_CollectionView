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
#import "DetailedViewController.h"


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
    
    
  /*
    DetailedViewController *dVC=[self.storyboard instantiateViewControllerWithIdentifier:@"Detail"];
    dVC.imageViewName = [macItemArray objectAtIndex:indexPath.row];
    dVC.itemName = [macItemLableArray objectAtIndex:indexPath.row];
    [self presentViewController:dVC animated:YES completion:nil];
    */
    
//    
//    DetailViewController *det=[self.storyboard instantiateViewControllerWithIdentifier:@"Detail"];
//    det.STR=[macItemLableArray objectAtIndex:indexPath.row];
//  
//    det.photo=[macItemArray objectAtIndex:indexPath.row];
//    //[self.navigationController pushViewController:det animated:YES];
//    [self presentViewController:det animated:YES completion:nil];

}


#pragma mark - PrepareForSegue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    DetailedViewController *destViewController = segue.destinationViewController;
    
    if ([segue.identifier isEqualToString:@"detailTVC"])
    {
        NSIndexPath *indexPath = [self.myTableVC indexPathForSelectedRow];
        destViewController.containerName = @"TableView";
        destViewController.itemName = [macItemLableArray objectAtIndex:indexPath.row];
        destViewController.imageViewName = [macItemArray objectAtIndex:indexPath.row];
        
    }else if ([segue.identifier isEqualToString:@"detailCVC"])
    {
        NSArray *arrayOfIndexPaths = [self.myCollectionVC indexPathsForSelectedItems];
        NSIndexPath *indexPath = [arrayOfIndexPaths firstObject];
        destViewController.containerName = @"CollectionView";
        destViewController.itemName = [macItemLableArray objectAtIndex:indexPath.row];
        destViewController.imageViewName = [macItemArray objectAtIndex:indexPath.row];

    }
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
