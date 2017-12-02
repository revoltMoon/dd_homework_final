//
//  flickrNetwork.m
//  dd_homework_final
//
//  Created by Влад Купряков on 01.12.2017.
//  Copyright © 2017 Влад Купряков. All rights reserved.
//

#import "flickrNetwork.h"

@implementation flickrNetwork
-(void)tags:(id<TagsDelegate>)delegate{
    
    id path = @"https://api.flickr.com/services/rest/?method=flickr.tags.getHotList&api_key=fb1a10aa4d898f985f525c7f5a29ce8b&period=week&count=15&format=json&nojsoncallback=1";
    NSURL *url = [NSURL URLWithString:path];
    NSURLSession * session = [NSURLSession sharedSession];
    NSURLSessionDownloadTask * task = [session downloadTaskWithURL:url
                                                 completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                     if (!error) {
                                                         NSData *data = [NSData dataWithContentsOfURL:url];
                                                         NSError *error;
                                                         NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                                             NSArray* array = [[NSArray alloc]init];
                                                             array = [[json valueForKey:@"hottags"] valueForKey:@"tag"];
                                                             NSMutableArray* arrForTags = [[NSMutableArray alloc]init];
                                                             for (int i=0; i<array.count; ++i) {
                                                                 NSDictionary* dictio = [array objectAtIndex:i];
                                                                 [arrForTags addObject:[dictio objectForKey:@"_content"]];
                                                             }
                                                         dispatch_async(dispatch_get_main_queue(), ^{
                                                             [delegate getTags:arrForTags];
                                                             NSLog(@"%@", arrForTags);
                                                         });
                                                     }
                                                 }];
    [task resume];
}


-(void)photoId:(id <PhotoDelegate>) delegate startOfString:(NSString*)startOfString secondParam: (NSString*)secondParam thirdParam: (NSString*)thirdParam fouthParam: (NSString*)fouthParam fifthParam: (NSString*)fifthParam sixthParam: (NSString*)sixthParam{
    NSMutableString* path = [[NSMutableString alloc] initWithString:startOfString];
    [path insertString:secondParam atIndex:path.length];
    [path insertString:thirdParam atIndex:path.length];
    NSURL *url = [NSURL URLWithString:path];
    NSURLSession * session = [NSURLSession sharedSession];
    NSURLSessionDownloadTask * task = [session downloadTaskWithURL:url
                                                 completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                     if (!error) {
                                                         NSData *data = [NSData dataWithContentsOfURL:url];
                                                         NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                                         if ([sixthParam isEqualToString:@"id"])
                                                         {
                                                             NSArray* arrayForPhotosId = [[NSArray alloc]init];
                                                             arrayForPhotosId = [[json valueForKey:fouthParam] valueForKey:fifthParam];
                                                             NSMutableArray *arrayForPhotoId = [[NSMutableArray alloc]init];
                                                             [arrayForPhotoId removeAllObjects];
                                                             for (int i=0; i<arrayForPhotosId.count; ++i) {
                                                                 NSDictionary* dictio = [arrayForPhotosId objectAtIndex:i];
                                                                 [arrayForPhotoId addObject:[dictio objectForKey:sixthParam]];
                                                             }
                                                         dispatch_async(dispatch_get_main_queue(), ^{
                                                             [delegate getPhotoId:arrayForPhotoId];
//                                                             NSLog(@"%@", arrayForPhotoId);
                                                         });
                                                         
                                                         }
                                                     }
                                                 }];
    [task resume];
}
-(void)photoURL:(id <PhotoDelegate>) delegate numberOfPhoto:(NSString*)numberOfPhoto {
    NSMutableString* path = [[NSMutableString alloc] initWithString:@"https://api.flickr.com/services/rest/?method=flickr.photos.getSizes&api_key=fb1a10aa4d898f985f525c7f5a29ce8b&photo_id="];
    [path insertString:numberOfPhoto atIndex:path.length];
    [path insertString:@"&format=json&nojsoncallback=1" atIndex:path.length];
    NSURL *url = [NSURL URLWithString:path];
    NSURLSession * session = [NSURLSession sharedSession];
    NSURLSessionDownloadTask * task = [session downloadTaskWithURL:url
                                                 completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                     if (!error) {
                                                         NSData *data = [NSData dataWithContentsOfURL:url];
                                                         NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
                                                         NSArray* arrayForPhotoSizes = [[NSArray alloc]init];
                                                         arrayForPhotoSizes = [[json valueForKey:@"sizes"] valueForKey:@"size"];
                                                         NSMutableArray *arrayForPhotoSource = [[NSMutableArray alloc]init];
                                                         for (int i=0; i<arrayForPhotoSizes.count; ++i) {
                                                             NSDictionary* dictio = [arrayForPhotoSizes objectAtIndex:i];
                                                             [arrayForPhotoSource addObject:[dictio objectForKey:@"source"]];
                                                         }
                                                              dispatch_async(dispatch_get_main_queue(), ^{
                                                                  [delegate getPhotoURL:arrayForPhotoSource[1] stringWithPhotoURLWithBestQuality:arrayForPhotoSource[arrayForPhotoSource.count-3]];
//                                                                  NSLog(@"%@", arrayForPhotoSource);
                                                              });
                                                         
                                                     }
                                                 }];
    [task resume];
}
-(void)photo:(id <PhotoDelegate>)delegate strWithURL:(NSString*)strWithURL{
    NSURLSession * session = [NSURLSession sharedSession];
    
    NSURL *url = [NSURL URLWithString:strWithURL];
    NSURLSessionDownloadTask * task = [session downloadTaskWithURL:url
                                                 completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                     if (!error) {
                                                         NSData *data = [NSData dataWithContentsOfURL:url];
                                                         UIImage* img = [UIImage imageWithData:data];
                                                         dispatch_async(dispatch_get_main_queue(), ^{
                                                             [delegate getPhoto:img];
                                                         });
                                                     }
                                                 }];
    [task resume];
}
@end
