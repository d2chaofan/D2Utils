//
//  TextViewController.h
//  D2UtilsDemo
//
//  Created by yunlian on 13-3-14.
//  Copyright (c) 2013年 d2chaofan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextViewController : UIViewController {
    UITextView *_textView;
}
@property (nonatomic, strong) NSString *text;
@end
