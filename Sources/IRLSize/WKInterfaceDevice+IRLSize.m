//
//  WKInterfaceDevice+IRLSize.m
//  IRLSize
//
//  Created by Jeff Kelley on 6/29/2016.
//  Copyright © 2019 Detroit Labs. All rights reserved.
//

#import "../Headers/IRLSize.h"

#import "IRLSizeMacros.h"
#import "watchOSDeviceConstants.h"

#if defined(TARGET_OS_WATCH) && TARGET_OS_WATCH

@implementation WKInterfaceDevice (IRLSizePrivate)

- (IRLRawDimensions)irl_estimatedRawPhysicalScreenSizeFromScreenPointHeight
{
    IRLRawDimensions estimatedDimensions = { 0.0f, 0.0f };
    
    NSUInteger heightPoints = round(CGRectGetHeight(self.screenBounds));
    
    switch (heightPoints) {
        IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, Watch, 38mm)
        IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, Watch, 40mm)
        IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, Watch, 42mm)
        IRL_ESTIMATED_DIMENSIONS(estimatedDimensions, Watch, 44mm)
    }
    
    return estimatedDimensions;
}

- (IRLRawDimensions)irl_rawPhysicalScreenSize
{
    IRLRawDimensions size = { 0.0f, 0.0f };
    
    switch ([WKInterfaceDevice.currentDevice orchardwatchOSDevice]) {
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardwatchOSDevice, AppleWatchSeries6_44mm)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardwatchOSDevice, AppleWatchSeries6_40mm)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardwatchOSDevice, AppleWatchSE_44mm)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardwatchOSDevice, AppleWatchSE_40mm)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardwatchOSDevice, AppleWatchSeries5_44mm)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardwatchOSDevice, AppleWatchSeries5_40mm)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardwatchOSDevice, AppleWatchSeries4_44mm)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardwatchOSDevice, AppleWatchSeries4_40mm)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardwatchOSDevice, AppleWatchSeries3_42mm)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardwatchOSDevice, AppleWatchSeries3_38mm)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardwatchOSDevice, AppleWatchSeries2_42mm)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardwatchOSDevice, AppleWatchSeries2_38mm)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardwatchOSDevice, AppleWatchSeries1_42mm)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardwatchOSDevice, AppleWatchSeries1_38mm)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardwatchOSDevice, AppleWatch_42mm)
        IRL_KNOWN_DEVICE_DIMENSIONS_MATCHING(OrchardwatchOSDevice, AppleWatch_38mm)

        default:
            size = [self irl_estimatedRawPhysicalScreenSizeFromScreenPointHeight];
    }

    return size;
}

@end

@implementation WKInterfaceDevice (IRLSize)

- (NSMeasurement<NSUnitLength *> *)irl_physicalScreenHeight
{
    return IRL_MM(self.irl_rawPhysicalScreenSize.height);
}

- (NSMeasurement<NSUnitLength *> *)irl_physicalScreenWidth
{
    return IRL_MM(self.irl_rawPhysicalScreenSize.width);
}

- (IRLRawMillimeters)irl_rawPhysicalScreenHeight
{
    return self.irl_rawPhysicalScreenSize.height;
}

- (IRLRawMillimeters)irl_rawPhysicalScreenWidth
{
    return self.irl_rawPhysicalScreenSize.width;
}

@end
#endif
