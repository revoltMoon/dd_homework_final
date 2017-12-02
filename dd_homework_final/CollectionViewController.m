//
//  CollectionViewController.m
//  dd_homework_final
//
//  Created by Влад Купряков on 23.11.2017.
//  Copyright © 2017 Влад Купряков. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
@interface CollectionViewController (){
   flickrNetwork* flickr;
}
@property (strong, nonatomic) IBOutlet UICollectionView *CollectionView;
@end
@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    flickr = [[flickrNetwork alloc]init];
    [flickr photoId:self startOfString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=fb1a10aa4d898f985f525c7f5a29ce8b&tags=" secondParam:self.stringFromTableView thirdParam:@"&per_page=15&page=15&format=json&nojsoncallback=1" fouthParam:@"photos" fifthParam:@"photo" sixthParam:@"id"];
    self.arrayWithPhotoURL = [[NSMutableArray alloc]init];
    self.arrayWithPhotoURLWithBestQuality = [[NSMutableArray alloc]init];
    self.img = [[NSMutableArray alloc]init];
}
-(void)getPhotoId:(NSMutableArray*)arrForId{
    self.arrayForPhotoId = arrForId ;
    for (int i=0; i<self.arrayForPhotoId.count; ++i) {
        [flickr photoURL:self numberOfPhoto:self.arrayForPhotoId[i]];
    }
    [self.CollectionView reloadData];
}
-(void)getPhotoURL:(NSString*)stringWithPhotoURL stringWithPhotoURLWithBestQuality:(NSString*)stringWithPhotoURLWithBestQuality{
    [self.arrayWithPhotoURL addObject:stringWithPhotoURL];
    [self.arrayWithPhotoURLWithBestQuality addObject:stringWithPhotoURLWithBestQuality];
    [flickr photo:self strWithURL:stringWithPhotoURL];
    [self.CollectionView reloadData];
}
-(void)getPhoto:(UIImage*)image{
    if (image != nil){
    [self.img addObject:image];
    [self.CollectionView reloadData];
    }
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrayWithPhotoURL.count;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ViewController *viewContr = [self.storyboard instantiateViewControllerWithIdentifier:@"View"];
    viewContr.stringFromCollectionView = self.arrayWithPhotoURLWithBestQuality[indexPath.row];
    viewContr.img = self.img[indexPath.row];
    [self.navigationController pushViewController:viewContr animated:YES];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    if(indexPath.row<self.img.count){
    cell.imageView.image = self.img[indexPath.row];
    }
    return cell;
}
@end
