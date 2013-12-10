//
//  RGBX.h
//  MNColorKit
//
//  Created by Marc Nijdam on 2/14/13.
//  Copyright (c) 2013 imadjine, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

static __inline CGFloat shiftAndMaskColorComponent(NSUInteger rgb, NSUInteger mask, NSUInteger bits)
{
    return (CGFloat)(((rgb & mask) >> bits) / 255.0);
}

static __inline UIColor *RGBXA(NSUInteger rgb, CGFloat alpha)
{
    return [UIColor colorWithRed:shiftAndMaskColorComponent(rgb, 0xFF0000, 16)
                           green:shiftAndMaskColorComponent(rgb, 0xFF00, 8)
                            blue:shiftAndMaskColorComponent(rgb, 0xFF, 0)
                           alpha:alpha];
}

static __inline UIColor *RGBX(NSUInteger rgb)
{
    return RGBXA(rgb,1.0);
}
