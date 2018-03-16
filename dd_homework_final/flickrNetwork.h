//
//  flickrNetwork.h
//  dd_homework_final
//
//  Created by Влад Купряков on 01.12.2017.
//  Copyright © 2017 Влад Купряков. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol TagsDelegate <NSObject>
-(void)getTags:(NSMutableArray*)arrForTags;
@end
@protocol PhotoDelegate <NSObject>
-(void)getPhotoId:(NSMutableArray*)arrForId;
-(void)getPhotoURL:(NSString*)stringWithPhotoURL stringWithPhotoURLWithBestQuality:(NSString*)stringWithPhotoURLWithBestQuality;
-(void)getPhoto:(UIImage*)image;
@end

@interface flickrNetwork : NSObject
-(void)tags:(id <TagsDelegate>) delegate;
-(void)photoId:(id <PhotoDelegate>) delegate hashtag:(NSString*)hashtag;
-(void)photoURL:(id <PhotoDelegate>) delegate numberOfPhoto:(NSString*)numberOfPhoto;
-(void)photo:(id <PhotoDelegate>)delegate strWithURL:(NSString*)strWithURL;
@end
