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
- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageFromCVC.image = self.img;
    [self.view addSubview:self.imageFromCVC];
    [self.view bringSubviewToFront:self.imageFromCVC];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
