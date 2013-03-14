//
//  TextViewController.m
//  D2UtilsDemo
//
//  Created by yunlian on 13-3-14.
//  Copyright (c) 2013年 d2chaofan. All rights reserved.
//

#import "TextViewController.h"

@interface TextViewController ()

@end

@implementation TextViewController
@synthesize text;
- (id)init {
    self = [super init];
    if ( self != nil ) {
        _textView = [[UITextView alloc] initWithFrame:CGRectZero];
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:_textView];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _textView.frame = self.view.bounds;
}
- (void)setText:(NSString *)txt {
    _textView.text = txt;
}
- (NSString *)text {
    return _textView.text;
}
@end
