//
//  DetailViewController.h
//  BasicCollectionView
//
//  Created by Pavankumar Arepu on 12/02/2016.
//  Copyright © 2016 ppam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic)  NSString *STR;
@property (strong, nonatomic)  NSString *photo;

@property (weak, nonatomic) IBOutlet UILabel *lbl_text;
@property (weak, nonatomic) IBOutlet UIImageView *img_photo;

-(void)text:(NSString *)str;
@end
