//
//  ViewController.m
//  D2UtilsDemo
//
//  Created by yunlian on 13-3-14.
//  Copyright (c) 2013年 d2chaofan. All rights reserved.
//

#import "ViewController.h"
#import "TextViewController.h"
#import "D2Base.h"
#import "NSArray+D2Helper.h"
#import "NSDate+D2Helper.h"

@interface ViewController (Private)
- (NSString *)baseText;
- (NSString *)helperText;
@end

@implementation ViewController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"D2UtilsDemo";
        // Custom initialization
        _titles = [NSArray arrayWithObjects:@"Base", @"Helper", nil];
    }
    return self;
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if ( cell == nil ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.text = [_titles objectAtIndex:indexPath.row];
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TextViewController *textViewController = [[TextViewController alloc] init];
    textViewController.title = [_titles objectAtIdx:indexPath.row];
    if ( indexPath.row == 0 ) {
        textViewController.text = [self baseText];
    } else if ( indexPath.row == 1 ) {
        textViewController.text = [self helperText];
    }
    [self.navigationController pushViewController:textViewController animated:YES];
}

#pragma mark - Private
- (NSString *)baseText {
    NSMutableString *str = [[NSMutableString alloc] init];
    [str appendFormat:@"D2LStr(@\"Hello\"), D2LStrEx(@\"World\", @\"InfoPlistEx\") = '%@ %@'\n\n", D2LStr(@"Hello"), D2LStrEx(@"World", @"InfoPlistEx")];
    [str appendFormat:@"isIPhone5 ? @\"True\" : @\"False\" = %@", (isIPhone5 ? @"True" : @"False")];
    return str;
}
- (NSString *)helperText {
    NSMutableString *str = [[NSMutableString alloc] init];
    // array helper
    NSArray *arr = [NSArray arrayWithObjects:@"0", @"1", nil];
    [str appendString:@"arr{0,1}\n"];
    [str appendFormat:@"[arr objectAtIdx:0] = %@\n", [arr objectAtIdx:0]];
    [str appendFormat:@"[arr objectAtIdx:-1] = %@\n\n", [arr objectAtIdx:-1]];
    // date helper
    NSDate *date = [NSDate date];
    [str appendFormat:@"date = %@\n", date];
    [str appendFormat:@"[date onlyDate] = %@\n", [date onlyDate]];
    [str appendFormat:@"[date onlyTime] = %@\n", [date onlyTime]];
    [str appendFormat:@"[date notSecond] = %@\n", [date notSecond]];
    [str appendFormat:@"[date startOfWeek] = %@\n", [date startOfWeek]];
    [str appendFormat:@"[date startOfMonth] = %@\n", [date startOfMonth]];
    [str appendFormat:@"[date startOfYear] = %@\n", [date startOfYear]];
    [str appendFormat:@"[date numberOfDaysInMonth] = %d\n", [date numberOfDaysInMonth]];
    [str appendFormat:@"[date weekday] = %d\n", [date weekday]];
    [str appendFormat:@"[date stringWithFormat:@\"YY-MM-dd\"] = %@\n", [date stringWithFormat:@"YY-MM-dd"]];
    [str appendFormat:@"[date dateByAddingDays:1] = %@\n", [date dateByAddingDays:1]];
    [str appendFormat:@"[date dateByAddingMonths:-1] = %@\n", [date dateByAddingMonths:-1]];
    [str appendFormat:@"[date dateByAddingYears:-1] = %@\n", [date dateByAddingYears:-1]];
    [str appendFormat:@"[date dateByAddingYears:1 months:2 days:3] = %@\n", [date dateByAddingYears:1 months:2 days:3]];
    return str;
}
@end
