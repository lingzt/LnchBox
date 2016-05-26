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


//MARK: - Properties
NSArray *restaurants;
NSMutableArray *newRestaurantArray;
int topRestaurant = 0;
int bottomRestaurant = 1;
int currentIndex = 1;


//MARK: - Life Cycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self shovelRestaurantArray];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//MARK: - Interactivity Methods
    //1. initiate RestaurantArray
-(void)initiateRestaurantArray{
    restaurants = @[@"Taco Bell",@"Bucharest Grill",@"Sy Thai",@"HopCat"];
}

    //2.shovel array and save it into a newRestaurantArray
-(void)shovelRestaurantArray{
    [self initiateRestaurantArray];
    //exchangeObjectAtIndex only works when there are 2 items in the array.
    for (NSInteger i = newRestaurantArray.count-1; i > -1; i--)
    {
        [newRestaurantArray exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform((u_int32_t)(i+1))];
    }
    
    //test the shovel function and it works!
    [newRestaurantArray enumerateObjectsUsingBlock:^(id obj,
                                              NSUInteger idx,
                                              BOOL *stop) {
        NSLog(@"%ld: %@", idx, obj);
    }];
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
