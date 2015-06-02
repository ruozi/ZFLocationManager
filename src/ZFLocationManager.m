//
//  ZFLocationManager.m
//  Launcher
//
//  Created by Ruozi on 15/6/1.
//  Copyright (c) 2015年 Pinssible. All rights reserved.
//

#import "ZFLocationManager.h"

#define kMinCurrentLocationMovementNotification 1000

@implementation ZFLocationManager

@synthesize locationUpdatedBlock;
@synthesize locationManager;
@synthesize currentLocation;

- (id)init
{
    if (self = [super init]) {
        // Setup the location manager
        locationManager = [[CLLocationManager alloc] init];
        locationManager.delegate = self;
        
        if ([locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
            [locationManager requestWhenInUseAuthorization];
        }
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
        locationManager.distanceFilter = kMinCurrentLocationMovementNotification;
    }
    
    return self;
}

- (void)findLocation
{
    [self.locationManager startUpdatingLocation];
    NSLog(@"StartUpdatingLocation");
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *location = (CLLocation *)[locations lastObject];
    
    NSLog(@"Current Location:%@",location);
    
    self.currentLocation = location;
    
    if (self.locationUpdatedBlock) {
        self.locationUpdatedBlock(location);
    }
    
    // Minimize power usage by stopping the location manager started by today widget item
    [self.locationManager stopUpdatingLocation];
    NSLog(@"StopUpdatingLocation");

}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    
    // Call the location error block
    if (self.locationErrorBlock) {
        self.locationErrorBlock(error);
    }
}

@end
