//
//  ZFLocationManager.h
//  Launcher
//
//  Created by Ruozi on 15/6/1.
//  Copyright (c) 2015年 Pinssible. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef void (^ZFLocationManagerCallback)(CLLocation *);
typedef void (^ZFLocationManagerErrorCallback)(NSError *);

@interface ZFLocationManager : NSObject <CLLocationManagerDelegate>

@property (nonatomic, strong) ZFLocationManagerCallback locationUpdatedBlock;
@property (nonatomic, strong) ZFLocationManagerErrorCallback locationErrorBlock;

@property (nonatomic, retain) CLLocationManager *locationManager;

@property (nonatomic, retain) CLLocation *currentLocation;

- (void)findLocation;

@end
