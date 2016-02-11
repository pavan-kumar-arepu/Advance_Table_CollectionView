//
//  CustomCollectionViewCell.h
//  BasicCollectionView
//
//  Created by Pavankumar Arepu on 10/02/2016.
//  Copyright © 2016 ppam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *cellImageView;
@property (weak, nonatomic) IBOutlet UILabel *cellLabel;

@end
