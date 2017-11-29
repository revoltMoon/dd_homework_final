//
//  ViewController.m
//  dd_homework_final
//
//  Created by Влад Купряков on 23.11.2017.
//  Copyright © 2017 Влад Купряков. All rights reserved.
//

#import "TableViewController.h"
@interface TableViewController ()
@end
//key fb1a10aa4d898f985f525c7f5a29ce8b
//secret ab3671331496f389
@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.JsonToArray;
}
//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//     if([segue.identifier isEqualToString:@"Cell"]){
//         CollectionViewController *cvc = (CollectionViewController*)segue.destinationViewController;
//    self.stringToGiveToCVC = @"ferrari";
//    cvc.stringFromTableView = self.stringToGiveToCVC;
//     }
//}

-(void)JsonToArray{
    id path = @"https://api.flickr.com/services/rest/?method=flickr.tags.getHotList&api_key=fb1a10aa4d898f985f525c7f5a29ce8b&period=week&count=15&format=json&nojsoncallback=1";
    NSURL *url = [NSURL URLWithString:path];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSError *error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (error){
        NSLog(@"%@",error.localizedDescription);
    } else {
        NSArray* array = [[NSArray alloc]init];
        array = [[json valueForKey:@"hottags"] valueForKey:@"tag"];
        self.arrayForTags = [[NSMutableArray alloc]init];
        for (int i=0; i<array.count; ++i) {
            NSDictionary* dictio = [array objectAtIndex:i];
            [self.arrayForTags addObject:[dictio objectForKey:@"_content"]];
        }
    }
}

//- (void)pushViewController:(UIViewController *)viewController
//                  animated:(BOOL)animated{
//
//}
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
