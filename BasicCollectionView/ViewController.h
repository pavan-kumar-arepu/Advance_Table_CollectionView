//
//  ViewController.h
//  BasicCollectionView
//
//  Created by Pavankumar Arepu on 10/02/2016.
//  Copyright © 2016 ppam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate, UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) IBOutlet UICollectionView *myCollectionVC;
@property(nonatomic,strong) IBOutlet UITableView *myTableVC;

@property (weak, nonatomic) IBOutlet UIImageView *itemImageView;




@end

