//
//  CollectionViewController.h
//  dd_homework_final
//
//  Created by Влад Купряков on 23.11.2017.
//  Copyright © 2017 Влад Купряков. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface CollectionViewController : UICollectionViewController
@property (strong, nonatomic) NSMutableArray *arrayForPhotoId;
@property (strong, nonatomic) NSMutableArray *arrayWithPhotoURL;
@property (strong, nonatomic) NSMutableArray *arrayWithPhotoURLWithBestQuality;
@property (nonatomic, copy) NSString *stringFromTableView;
-(void)takeJson:(NSString*)startOfString secondParam: (NSString*)secondParam thirdParam: (NSString*)thirdParam fouthParam: (NSString*)fouthParam fifthParam: (NSString*)fifthParam sixthParam: (NSString*)sixthParam;
@end
