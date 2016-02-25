//
//  OperationalCloud.m
//  FigureLanguage
//
//  Created by MrLoong on 15/8/27.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

#import "OperationalCloud.h"

@implementation OperationalCloud

+(void) saveCloud:(NSString *)content over:(NSString *)pubUser over:(NSString *)pubTimestamp over:(NSString *)title over:(UIImage *) imageName over:(NSString *)type{
    AVObject *post = [AVObject objectWithClassName:@"Message"];
    
    
    NSData *imageData = UIImageJPEGRepresentation(imageName, 0.6);
    AVFile *imageFile = [AVFile fileWithName:@"image.jpg" data:imageData];
    //[imageFile saveInBackground];
    
    
    post[@"content"] = content;
    post[@"username"] = pubUser;
    post[@"time"] = pubTimestamp;
    post[@"title"] = title;
    post[@"imageName"] = imageFile;
    post[@"type"] = type;
    
    
    [post saveInBackgroundWithTarget:self
                            selector:@selector(saveCallback:error:)];
}

+ (void)saveCallback:(NSNumber *)result error:(NSError *)error {
    if (!error) {
        NSLog(@"保存成功");
        
    } else {
        // 保存 post 时出错
    }
}



+ (NSArray *) getCloud {
    
    AVQuery *query = [AVQuery queryWithClassName:@"Message"];
    [query whereKey:@"type" equalTo:@"share"];
    NSArray *postArray = [query findObjects];
    
//    for (int i = 0; i<postArray.count; i++) {
//        AVFile *imageFile = postArray[i][@"imageName"];
//    }
//    NSMutableArray *entities = @[].mutableCopy;
//
//    
//    for (int i = 0; i<postArray.count; i++) {
//        [entities addObject:[[FDFeedEntity alloc] initWithDictionary:postArray[i]]];
//    }
//    
    return postArray;
}

+(UIImage *) text:(AVFile *)imageFile {
//    AVQuery *query = [AVQuery queryWithClassName:@"Message"];
//    [query whereKey:@"type" equalTo:@"share"];
//    NSArray *postArray = [query findObjects];
//    
//    AVFile *imageFile = postArray[0][@"imageName"];
    
    NSData *imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:imageFile.url]];
    UIImage *theImage =  [[UIImage alloc] initWithData:imageData];
    
    return theImage;
    
}




@end
