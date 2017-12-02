//
//  ViewController.m
//  dd_homework_final
//
//  Created by Влад Купряков on 23.11.2017.
//  Copyright © 2017 Влад Купряков. All rights reserved.
//

#import "TableViewController.h"
@interface TableViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    flickrNetwork* flickr = [[flickrNetwork alloc]init];
    [flickr tags:self];
}
-(void)getTags:(NSMutableArray*)arrForTags{
    self.arrayForTags = arrForTags;
    [self.tableView reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return self.arrayForTags.count;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewController *cvc = [self.storyboard instantiateViewControllerWithIdentifier:@"CollectionView"];
    self.stringToGiveToCVC = self.arrayForTags[indexPath.row];
    cvc.stringFromTableView = self.stringToGiveToCVC;
    [self.navigationController pushViewController:cvc animated:YES];
}
- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = self.arrayForTags[indexPath.row];
    return cell;
}
@end
