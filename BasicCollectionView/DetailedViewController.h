//
//  DetailedViewController.h
//  BasicCollectionView
//
//  Created by Pavankumar Arepu on 12/02/2016.
//  Copyright © 2016 ppam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailedViewController : UIViewController

@property (weak, nonatomic) NSString *imageViewName;
@property (weak, nonatomic) NSString *itemName;
@property (weak, nonatomic) NSString *containerName;


@property (weak, nonatomic) IBOutlet UILabel *selectedContainerLabel;
@property (weak, nonatomic) IBOutlet UIImageView *selectedImageView;
@property (weak, nonatomic) IBOutlet UILabel *selectedItemName;

- (IBAction)dismissVC:(id)sender;

@end
