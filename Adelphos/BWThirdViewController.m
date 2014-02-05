//
//  BWThirdViewController.m
//  Adelphos
//
//  Created by Alexander Cruttenden on 11/17/13.
//  Copyright (c) 2013 Alexander Cruttenden. All rights reserved.
//

#import "BWThirdViewController.h"

// Photos button
@interface BWThirdViewController ()

@end

@implementation BWThirdViewController

@synthesize navBar;
@synthesize photosWebview;

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURL *myNSURL = [[NSURL alloc]initWithString:@"http://www.instagram.com/chapmanadelphos"]; 
    NSURLRequest *myNSURLRequest = [[NSURLRequest alloc]initWithURL:myNSURL];
    
    
    
    [photosWebview loadRequest:myNSURLRequest];
    
}

//Button that pulls up instagram app (invisible atm)
- (IBAction)follow:(id)sender
{
    NSURL *instagramURL = [NSURL URLWithString:@"instagram://user?username=chapmanadelphos"];
    if ([[UIApplication sharedApplication] canOpenURL:instagramURL]) {
        [[UIApplication sharedApplication] openURL:instagramURL];
        
        // [photosWebview loadRequest:instagramURL];
        
    }
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
