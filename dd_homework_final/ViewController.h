//
//  ViewController.h
//  dd_homework_final
//
//  Created by Влад Купряков on 27.11.2017.
//  Copyright © 2017 Влад Купряков. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "flickrNetwork.h"
@interface ViewController : UIViewController<PhotoDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageFromCVC;
@property (nonatomic, copy) NSString *stringFromCollectionView;
@property (strong, nonatomic) UIImage *img;
@end
