//
//  ViewController.h
//  dd_homework_final
//
//  Created by Влад Купряков on 23.11.2017.
//  Copyright © 2017 Влад Купряков. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionViewController.h"
#import "flickrNetwork.h"
@interface TableViewController : UITableViewController<TagsDelegate>
@property (strong, nonatomic) NSMutableArray *arrayForTags;
@property (nonatomic, copy) NSString *stringToGiveToCVC;
@end

