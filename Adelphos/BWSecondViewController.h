//
//  BWSecondViewController.h
//  Adelphos
//
//  Created by Alexander Cruttenden on 11/19/13.
//  Copyright (c) 2013 Alexander Cruttenden. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/Mapkit.h>



@interface BWSecondViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property NSString *address;
@property NSString *date;
@property NSString *time;
@property NSString *title;

@end
