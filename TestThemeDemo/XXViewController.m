//
//  XXViewController.m
//  TestThemeDemo
//
//  Created by yzj on 2020/4/27.
//  Copyright © 2020 yzj. All rights reserved.
//

#import "XXViewController.h"
#import <TestThemeDemo-Swift.h>

@interface XXViewController ()

@end

@implementation XXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view th_backgroundColor:@""];
    
    Theme.shared.type = ThemeTypeDefault;
    UILabel *label;
    
    
    __weak typeof(self) weakSelf = self;
    [Theme.shared cook:^BOOL{
        weakSelf.view.backgroundColor = [Theme.shared colorFor:@"th_textColor"];
        label.attributedText = [[NSAttributedString alloc] initWithString:@"sdd" attributes:@{NSForegroundColorAttributeName: [Theme.shared colorFor:@"th_textColor"]}];
        return weakSelf.view != nil;
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
