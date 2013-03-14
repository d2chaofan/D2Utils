//
//  TextViewController.h
//  D2UtilsDemo
//
//  Created by Deng Chaofan on 13-3-14.
//  Copyright (c) 2013 Deng Chaofan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextViewController : UIViewController {
    UITextView *_textView;
}
@property (nonatomic, strong) NSString *text;
@end
