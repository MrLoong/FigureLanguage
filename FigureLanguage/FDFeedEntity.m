//
//  FDFeedEntity.m
//  FigureLanguage
//
//  Created by MrLoong on 15/8/22.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

#import "FDFeedEntity.h"

@implementation FDFeedEntity

- (FDFeedEntity *)initWithDictionary:(AVObject *)dictionary
{
    AVFile *imageFile = dictionary[@"imageName"];
    NSLog(@"==============%@",imageFile.url);
    self = super.init;
    //if (self) {
        self.title = dictionary[@"title"];
        self.content = dictionary[@"content"];
        self.username = dictionary[@"username"];
        self.time = dictionary[@"time"];
       // NSLog(@"%@",dictionary[@"imageName"]);
        self.imageName = dictionary[@"imageName"];
   // }
    return self;
}

@end
