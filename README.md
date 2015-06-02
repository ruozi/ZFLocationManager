# ZFLocationManager
The LocationManager which is used for get user current location once and do sth.

ZFLocationManager provides a block-based asynchronous API to request the current location once. Considering the scene current location may be frequently requested, ZFLocationManager minimize power usage of each request by stopping updating when user location has been got once.

# USage

Before requesting current location. Init the ZFLocationManager by using the method:

[[ZFLocationManager alloc] init];

Then set the callback to do something when current location has been got:

[_locationManager setLocationUpdatedBlock:^(CLLocation *location) { 
  // Do something when you find the current location
}];

