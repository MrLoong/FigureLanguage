//
//  FDFeedViewController.h
//  FigureLanguage
//
//  Created by MrLoong on 15/8/22.
//  Copyright (c) 2015年 MrLoong. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface FDFeedViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGesture;
@property NSString *titleOfOtherPages;

@end
