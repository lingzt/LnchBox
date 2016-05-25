//
//  ViewController.m
//  LnchBox
//
//  Created by ling toby on 5/25/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "ViewController.h"
#import "Restaurant.h"

@interface ViewController ()

@end

@implementation ViewController

NSArray *restaurants;
int topRestaurant = 0;
int bottomRestaurant = 1;
int currentIndex = 1;

- (void)viewDidLoad {
    [super viewDidLoad];
    restaurants = @[@"Taco Bell",@"Bucharest Grill",@"Sy Thai",@"HopCat"];
    _restaurant1ImageView.image = restaurants[topRestaurant];
    _restaurant2ImageView.image = restaurants[bottomRestaurant];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)choice1Button:(UIButton *)sender {
    
    [self newRestaurantOption];
}

-(void)newRestaurantOption {
    
}

@end
