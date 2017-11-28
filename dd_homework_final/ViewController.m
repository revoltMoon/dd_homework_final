//
//  ViewController.m
//  dd_homework_final
//
//  Created by Влад Купряков on 27.11.2017.
//  Copyright © 2017 Влад Купряков. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
//https://farm5.staticflickr.com/4402/35529224383_b851778bcd_q.jpg
- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage* img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.stringFromCollectionView]]];
//    self.imageFromCVC = [[UIImageView alloc] initWithFrame:self.view.bounds];
    self.imageFromCVC.image = img;
    [self.view addSubview:self.imageFromCVC];
    [self.view bringSubviewToFront:self.imageFromCVC];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
