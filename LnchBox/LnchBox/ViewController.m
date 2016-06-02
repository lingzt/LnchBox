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
NSMutableDictionary *topRestaurant;
NSMutableDictionary *bottomRestaurant;
int lastIndexChecked ;
int tappedResturantID;
NSMutableDictionary *chosenRestaurant;
UITapGestureRecognizer *tapGesture1;
UITapGestureRecognizer *tapGesture2;

//MARK: - Life Cycle Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    [self shuffleRestaurantArray];
    [self loadRestaurantToView];
    [self addTapGestureTo2imageviews];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//MARK: - Interactivity Methods
    //1. initiate RestaurantArray
-(void)initiateRestaurantArray{
    NSDictionary *restaurant1 = @{@"name":@"Taco Bell",
                                  @"image":[UIImage imageNamed:@"1.jpeg"],};
    NSDictionary *restaurant2 = @{@"name":@"Bucharest Grill",
                                  @"image":[UIImage imageNamed:@"2.jpeg"],};
    NSDictionary *restaurant3 = @{@"name":@"Sy Thai",
                                  @"image":[UIImage imageNamed:@"3.jpeg"],};
    NSDictionary *restaurant4 = @{@"name":@"HopCat",
                                  @"image":[UIImage imageNamed:@"4.jpg"],};
    restaurants = [[NSArray alloc] initWithObjects:restaurant1, restaurant2,restaurant3,restaurant4,nil];
    NSLog(@"restaurant array initiated\n\n\n");
}

    //2.Shuffle array and save it into a newRestaurantArray
-(void)shuffleRestaurantArray{
    [self initiateRestaurantArray];
    newRestaurantArray = [restaurants mutableCopy];
    
        //exchangeObjectAtIndex only works when there are 2 items in the array.
    for (NSInteger i = newRestaurantArray.count-1; i > -1; i--)
    {
        [newRestaurantArray exchangeObjectAtIndex:i withObjectAtIndex:arc4random_uniform((u_int32_t)(i+1))];
    }
    
        //test the Shuffle function and it works!
    [newRestaurantArray enumerateObjectsUsingBlock:^(id obj,
                                              NSUInteger idx,
                                              BOOL *stop) {
        NSLog(@"%ld: %@", idx, obj[@"name"]);
    }];
}

    //3.place first 2 shown restaurant, [0] to the top, [1] to the button. Set up TapGesture. lastIndexCheck iniate
-(void)loadRestaurantToView{
    topRestaurant = newRestaurantArray[0];
    self.restaurant1ImageView.image = topRestaurant[@"image"];
    self.restaurant1Label.text = topRestaurant[@"name"];
    bottomRestaurant = newRestaurantArray[1];
    self.restaurant2ImageView.image = bottomRestaurant[@"image"];
    self.restaurant2Label.text = bottomRestaurant[@"name"];
    lastIndexChecked = 1;
}

    //4, add tapGesture to both imageviews
-(void)addTapGestureTo2imageviews{
    self.restaurant1ImageView.userInteractionEnabled = YES;
    tapGesture1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(decideChosenResturant:)];
    tapGesture1.numberOfTapsRequired = 1; //点击次数
    tapGesture1.numberOfTouchesRequired = 1; //点击手指数
    [self.restaurant1ImageView addGestureRecognizer:tapGesture1];
    
    self.restaurant2ImageView.userInteractionEnabled = YES;
    tapGesture2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(decideChosenResturant:)];
    tapGesture2.numberOfTapsRequired = 1; //点击次数
    tapGesture2.numberOfTouchesRequired = 1; //点击手指数
    [self.restaurant2ImageView addGestureRecognizer:tapGesture2];
}

    //5,decide which Restaurant is chosen
-(void)decideChosenResturant:(UITapGestureRecognizer *) sender{
    if (sender == tapGesture1){
        tappedResturantID = 1;
        chosenRestaurant = topRestaurant;
        NSLog(@"1 tapped, %@ chosen\n", chosenRestaurant[@"name"]);
        [self decideIfLastRestaurantInArray];
    }
    if (sender == tapGesture2){
        tappedResturantID = 2;
        chosenRestaurant = bottomRestaurant;
        NSLog(@"2 tapped, %@ chosen\n", chosenRestaurant[@"name"]);
        [self decideIfLastRestaurantInArray];
    }

}

    //6. Decide if Last Restaurant In Array being checked
-(void)decideIfLastRestaurantInArray{
    if(lastIndexChecked >=  newRestaurantArray.count-1){
        //8. perfom Segue
        [self performSegueWithIdentifier:@"showResult" sender:self];
        
    
    }else{
        NSLog(@"We just check the restaurant # %D \n",lastIndexChecked);
        [self decideWhichImageViewToReplace];
        
    }
}


    //7. prepare for Segue chosenRestaurant send to resultViewController
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    // Make sure your segue name in storyboard is the same as this line
    if ([[segue identifier] isEqualToString:@"showResult"])
    {
        // Get reference to the destination view controller
        ResultViewController *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...

        vc.resultRestaurant = chosenRestaurant;
    }
}


    //9. decide which imageView to be replace
-(void)decideWhichImageViewToReplace{
    if (tappedResturantID ==1){
        //10, reset topRestaurant with newRestaurant
        lastIndexChecked++;
        bottomRestaurant = newRestaurantArray[lastIndexChecked];
        self.restaurant2ImageView.image = bottomRestaurant[@"image"];
        self.restaurant2Label.text = bottomRestaurant[@"name"];
        
    }
    if (tappedResturantID ==2 ){
        //11 reset bottomRestaurant with newRestaurant
        lastIndexChecked++;
        topRestaurant = newRestaurantArray[lastIndexChecked];
        self.restaurant1ImageView.image = topRestaurant[@"image"];
        self.restaurant1Label.text = topRestaurant[@"name"];
    }
}

@end
