//
//  BWSecondViewController.m
//  Adelphos
//
//  Created by Alexander Cruttenden on 11/19/13.
//  Copyright (c) 2013 Alexander Cruttenden. All rights reserved.
//

#import "BWSecondViewController.h"
#import <Firebase/Firebase.h>
#import <CoreLocation/CoreLocation.h>


#define METERS_PER_MILE 1609.344

//@interface BWSecondViewController ()

//@end

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
            
            
            // forward geocoder
        
            NSString *location = address;
            CLGeocoder *geocoder = [[CLGeocoder alloc] init];
            [geocoder geocodeAddressString:location completionHandler:^(NSArray* placemarks, NSError* error)
            {
                     if (placemarks && placemarks.count > 0)
                     {
                         CLPlacemark *topResult = [placemarks objectAtIndex:0];
                          MKPlacemark *placemark = [[MKPlacemark alloc] initWithPlacemark:topResult];
                         
                         
                        // [self.mapView addAnnotation:placemark];
                         
                         //can't set title on MKPlacemark, so must make MKPointAnnotation
                         MKPointAnnotation *point2 = [[MKPointAnnotation alloc] init];
                         
                         point2.coordinate = placemark.coordinate;
                         
                         
                        // NSString *titleAndAddress = [NSString stringWithFormat:@"%@, %@",title, address];
                        // point2.title = titleAndAddress;
                         
                        point2.title = title;
                         
                       //  point2.subtitle = address;
                         
                        // NSString *dateAndTime = [NSString stringWithFormat:@"%@, %@",date, time];
                         
                         NSString *addressDateAndTime = [NSString stringWithFormat:@"%@, %@, %@", address, date, time];
                         point2.subtitle = addressDateAndTime;
                         // add button that gives directions to address
                         //then add date and time to .subtitle line
                         
                         [self.mapView addAnnotation:point2];
                         
                         //automatically pops up
                         [self.mapView selectAnnotation:point2 animated:YES];
                     }
             }
             ];
           
        // 1401 E Adams Ave
        // CLLocationCoordinate2D partyLocation2;
        // partyLocation2.latitude = 33.806949;
        // partyLocation2.longitude = -117.838826;
            
           
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
   
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}



@end
