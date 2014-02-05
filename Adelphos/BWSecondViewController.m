//
//  BWSecondViewController.m
//  Adelphos
//
//  Created by Alexander Cruttenden on 11/19/13.
//  Copyright (c) 2013 Alexander Cruttenden. All rights reserved.
//

#import "BWSecondViewController.h"
#import <Firebase/Firebase.h>


#define METERS_PER_MILE 1609.344



@implementation BWSecondViewController

@synthesize address;
@synthesize date;
@synthesize time;
@synthesize title;



- (void)viewWillAppear:(BOOL)animated
{
    
    // Center on this location
    CLLocationCoordinate2D zoomLocation;
    
    //Chapman University
    zoomLocation.latitude = 33.7938;
    zoomLocation.longitude= -117.8514;
    
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 2.0*METERS_PER_MILE, 2.0*METERS_PER_MILE);
    
    // 3
    [_mapView setRegion:viewRegion animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[[Firebase alloc] initWithUrl:@"https://adelphos.firebaseio.com/"] observeEventType:FEventTypeValue withBlock:^
     (FDataSnapshot *snapshot) {
        for (FDataSnapshot *child in snapshot.children) {
            //get title
            title = child.name;
            //get address, date, time
            if(child.hasChildren) {
                for (FDataSnapshot *details in child.children) {
                    if([details.name isEqualToString:@"Address"]) {
                        address = details.value;
                        
                    }
                    
                    if([details.name isEqualToString:@"Date"]) {
                        date = details.value;
                    }
                    
                    if([details.name isEqualToString:@"Time"]) {
                        time = details.value;
                    }
                }
            }
            
            NSLog(@"Title: %@", title);
            NSLog(@"Address: %@", address);
            NSLog(@"Date: %@", date);
            NSLog(@"Time: %@", time );
        }
    }];

    /*
	MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:centerCoordinate];
    [annotation setTitle:@"Walnut House"]; //set the subtitle too?
    [self.mapView addAnnotation:annotation];
    
    
    //631 W Walnut
    CLLocationCoordinate2D partyLocation;
    partyLocation.latitude = 33.795392;
    partyLocation.longitude = -117.859330;
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = partyLocation;
    point.title = @"Dec. 11th: Undie Run Pre-game";
    point.subtitle = @"631 W Walnut at 9pm";
    
    [self.mapView addAnnotation:point];
    */
    // 1401 E Adams Ave
    CLLocationCoordinate2D partyLocation2;
    partyLocation2.latitude = 33.806949;
    partyLocation2.longitude = -117.838826;
    
    MKPointAnnotation *point2 = [[MKPointAnnotation alloc] init];
    point2.coordinate = partyLocation2;
    point2.title = title; //@"Santa Clause ";
    point2.subtitle = address; //@"1401 E Adams Ave at 10pm";
    
    [self.mapView addAnnotation:point2];
    
    //bucky
    CLLocationCoordinate2D partyLocation3;
    partyLocation3.latitude = 33.608742;
    partyLocation3.longitude = 117.849792;
    MKPointAnnotation *point3 = [[MKPointAnnotation alloc] init];
    point3.coordinate = partyLocation2;
    point3.title = @"Bucky's Birthday!";
    point3.subtitle = @"1 Bodega Bay Dr Newport at 8pm";
    
    [self.mapView addAnnotation:point2];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
