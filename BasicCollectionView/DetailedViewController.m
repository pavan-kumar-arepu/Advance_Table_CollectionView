//
//  DetailedViewController.m
//  BasicCollectionView
//
//  Created by Pavankumar Arepu on 12/02/2016.
//  Copyright © 2016 ppam. All rights reserved.
//

#import "DetailedViewController.h"

@interface DetailedViewController ()

@end

@implementation DetailedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.selectedImageView.image = [UIImage imageNamed:self.imageViewName];
    self.selectedItemName.text = [self.itemName uppercaseString];
    
    self.selectedContainerLabel.text = [self.containerName uppercaseString];
    
    // Do any additional setup after loading the view.
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

- (IBAction)dismissVC:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
@end
