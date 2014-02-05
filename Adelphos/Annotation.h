//
//  Annotation.h
//  Adelphos
//
//  Created by Alexander Cruttenden on 11/25/13.
//  Copyright (c) 2013 Alexander Cruttenden. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface Annotation : NSObject <MKAnnotation>

@property(nonatomic, assign) CLLocationCoordinate2D coordinate;
@property(nonatomic, copy) NSString * title;
@property(nonatomic, copy) NSString * subtitle;

@end
