//
//  CollectionViewController.h
//  dd_homework_final
//
//  Created by Влад Купряков on 23.11.2017.
//  Copyright © 2017 Влад Купряков. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "flickrNetwork.h"
@interface CollectionViewController : UICollectionViewController<PhotoDelegate>
@property (strong, nonatomic) NSMutableArray *arrayForPhotoId;
@property (strong, nonatomic) NSMutableArray *arrayWithPhotoURL;
@property (strong, nonatomic) NSMutableArray *arrayWithPhotoURLWithBestQuality;
@property (strong, nonatomic) NSMutableArray *img;
@property (nonatomic, copy) NSString *stringFromTableView;
@end
