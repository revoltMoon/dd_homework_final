//
//  CollectionViewController.m
//  dd_homework_final
//
//  Created by Влад Купряков on 23.11.2017.
//  Copyright © 2017 Влад Купряков. All rights reserved.
//

#import "CollectionViewController.h"
#import "CollectionViewCell.h"
@interface CollectionViewController ()
@end
//key fb1a10aa4d898f985f525c7f5a29ce8b
//secret ab3671331496f389
@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self takeJson:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=013b067090a28369bb3bb907d41b07e9&tags=" secondParam:self.stringFromTableView thirdParam:@"&per_page=15&page=15&format=json&nojsoncallback=1" fouthParam:@"photos" fifthParam:@"photo" sixthParam:@"id"];
    
    NSLog(@"%@", self.stringFromTableView);
    
    [self takeJson:@"https://api.flickr.com/services/rest/?method=flickr.photos.getSizes&api_key=013b067090a28369bb3bb907d41b07e9&photo_id=" secondParam:@"somestring" thirdParam:@"&format=json&nojsoncallback=1" fouthParam:@"sizes" fifthParam:@"size" sixthParam:@"source"];
//    NSMutableString* path = [[NSMutableString alloc] initWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=15d0e5a14c22ab06ab29dd73b3610df3&tags=whitenight&per_page=10&page=1&format=json&nojsoncallback=1"];
//    NSURL *url = [NSURL URLWithString:path];
//    NSError *error;
//    NSData *data = [NSData dataWithContentsOfURL:url];
//    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//    if (error){
//        NSLog(@"%@",error.localizedDescription);
//    } else {
//        NSArray *arrayForPhotosJsonContent = [[NSArray alloc]init];
//        arrayForPhotosJsonContent = [[json valueForKey:@"photos"] valueForKey:@"photo"];
//        self.arrayForPhotoId = [[NSMutableArray alloc]init];
//        for (int i=0; i<arrayForPhotosJsonContent.count; ++i) {
//            NSDictionary* dictio = [arrayForPhotosJsonContent objectAtIndex:i];
//            [self.arrayForPhotoId addObject:[dictio objectForKey:@"id"]];
//        }
////        path = @"https://api.flickr.com/services/rest/?method=flickr.photos.getSizes&api_key=15d0e5a14c22ab06ab29dd73b3610df3&photo_id=24507692228&format=json&nojsoncallback=1";
//        self.arrayWithPhotoURL = [[NSMutableArray alloc]init];
//        self.ar2 = [[NSMutableArray alloc]init];
//        for (int i=0;i<self.arrayForPhotoId.count;i++){
//        [path deleteCharactersInRange:NSMakeRange(0, path.length)];
//        [path insertString:@"https://api.flickr.com/services/rest/?method=flickr.photos.getSizes&api_key=15d0e5a14c22ab06ab29dd73b3610df3&photo_id=" atIndex:path.length];
//            [path insertString:self.arrayForPhotoId[i] atIndex:path.length];
//            [path insertString:@"&format=json&nojsoncallback=1" atIndex:path.length];
//
//        url = [NSURL URLWithString:path];
//        data = [NSData dataWithContentsOfURL:url];
//        json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
//        NSArray* arrayForPhotosSizes = [[NSArray alloc]init];
//        arrayForPhotosSizes = [[json valueForKey:@"sizes"] valueForKey:@"size"];
//        for (int g=0; g<arrayForPhotosSizes.count; ++g)
//        {
//            NSDictionary* dictio2 = [arrayForPhotosSizes objectAtIndex:g];
//            [self.ar2 addObject:[dictio2 objectForKey:@"source"]];
//        }
//        [self.arrayWithPhotoURL addObject:self.ar2[1]];
//        [self.ar2 removeAllObjects];
//    }
//    }
}
-(void)takeJson:(NSString*)startOfString secondParam: (NSString*)secondParam thirdParam: (NSString*)thirdParam fouthParam: (NSString*)fouthParam fifthParam: (NSString*)fifthParam sixthParam: (NSString*)sixthParam {
    
    NSMutableString* path = [[NSMutableString alloc] initWithString:startOfString];
    [path insertString:secondParam atIndex:path.length];
    [path insertString:thirdParam atIndex:path.length];
    
    NSURL *url = [NSURL URLWithString:path];
    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if ([sixthParam isEqualToString:@"id"])
    {
    NSArray* arrayForPhotosId = [[NSArray alloc]init];
    arrayForPhotosId = [[json valueForKey:fouthParam] valueForKey:fifthParam];
    self.arrayForPhotoId = [[NSMutableArray alloc]init];
        [self.arrayForPhotoId removeAllObjects];
    for (int i=0; i<arrayForPhotosId.count; ++i) {
        NSDictionary* dictio = [arrayForPhotosId objectAtIndex:i];
        [self.arrayForPhotoId addObject:[dictio objectForKey:sixthParam]];
    }
    } else if([sixthParam isEqualToString:@"source"]){
        NSArray* arrayForPhotosSizes = [[NSArray alloc]init];
        arrayForPhotosSizes = [[json valueForKey:fouthParam] valueForKey:fifthParam];
        NSMutableArray* ar2 = [[NSMutableArray alloc]init];
        for (int i=0; i<arrayForPhotosSizes.count; ++i) {
            NSDictionary* dictio = [arrayForPhotosSizes objectAtIndex:i];
            [ar2 addObject:[dictio objectForKey:sixthParam]];
        }
        self.arrayWithPhotoURL = [[NSMutableArray alloc]init];
        self.arrayWithPhotoURLWithBestQuality = [[NSMutableArray alloc]init];
        for (int i=0;i<self.arrayForPhotoId.count;i++){
            [path deleteCharactersInRange:NSMakeRange(0, path.length)];
            [path insertString:startOfString atIndex:path.length];
            [path insertString:self.arrayForPhotoId[i] atIndex:path.length];
            [path insertString:thirdParam atIndex:path.length];
            
            url = [NSURL URLWithString:path];
            data = [NSData dataWithContentsOfURL:url];
            json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
            NSArray* arrayForPhotosSizes = [[NSArray alloc]init];
            arrayForPhotosSizes = [[json valueForKey:fouthParam] valueForKey:fifthParam];
            for (int g=0; g<arrayForPhotosSizes.count; ++g)
            {
                NSDictionary* dictio2 = [arrayForPhotosSizes objectAtIndex:g];
                [ar2 addObject:[dictio2 objectForKey:sixthParam]];
            }
            [self.arrayWithPhotoURL addObject:ar2[1]];
            [self.arrayWithPhotoURLWithBestQuality addObject:ar2[ar2.count-3]];
            [ar2 removeAllObjects];
        }
    }
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrayWithPhotoURL.count;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    ViewController *viewContr = [self.storyboard instantiateViewControllerWithIdentifier:@"View"];
    viewContr.stringFromCollectionView = self.arrayWithPhotoURLWithBestQuality[indexPath.row];
    [self.navigationController pushViewController:viewContr animated:YES];
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    UIImage* img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.arrayWithPhotoURL[indexPath.row]]]];
        cell.imageView.image = img;
    return cell;
}
@end
