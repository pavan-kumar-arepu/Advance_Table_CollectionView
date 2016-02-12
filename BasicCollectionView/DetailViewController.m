//
//  DetailViewController.m
//  BasicCollectionView
//
//  Created by Pavankumar Arepu on 12/02/2016.
//  Copyright © 2016 ppam. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()



@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _lbl_text.text=_STR;
    _img_photo.image=[UIImage imageNamed:_photo];
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
