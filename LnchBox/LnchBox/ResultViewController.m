//
//  ResultViewController.m
//  LnchBox
//
//  Created by ling toby on 5/25/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@ is chosen for lunch today", _resultRestaurant[@"name"]);
    _resultRestaurantImageView.image = [_resultRestaurant valueForKey:@"image"];
    //_resultRestaurant[@"image"];
    _resultLabel.text = [NSString stringWithFormat:@"%@ is the chose restaurant", _resultRestaurant[@"name"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
