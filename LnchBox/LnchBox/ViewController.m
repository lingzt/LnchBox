//
//  ViewController.m
//  LnchBox
//
//  Created by ling toby on 5/25/16.
//  Copyright © 2016 Detroit Labs. All rights reserved.
//

#import "ViewController.h"
#import "Restaurant.h"
#import "ResultViewController.h"

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

    
    //[self performSegueWithIdentifier:@"showResult" sender:self];


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"showResult"])
    {
        // Get reference to the destination view controller
        ResultViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...

        vc.resultRestuarantName = @"ajfhajkhk";
    }

}

@end
