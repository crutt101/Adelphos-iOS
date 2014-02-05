//
//  BWFirstViewController.m
//  Adelphos
//
//  Created by Alexander Cruttenden on 11/19/13.
//  Copyright (c) 2013 Alexander Cruttenden. All rights reserved.
//

#import "BWFirstViewController.h"

// Rush button
@interface BWFirstViewController ()

@end

@implementation BWFirstViewController
@synthesize navBar;
@synthesize rushWebview;

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURL *myNSURL = [[NSURL alloc]initWithString:@"http://www.chapmanadelphos.com/rushapp.html"];
    NSURLRequest *myNSURLRequest = [[NSURLRequest alloc]initWithURL:myNSURL];

    [rushWebview loadRequest:myNSURLRequest];
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
