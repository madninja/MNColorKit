//
//  RGBX.h
//  MNColorKit
//
//  Created by Marc Nijdam on 2/14/13.
//  Copyright (c) 2013 imadjine, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

static __inline UIColor *RGBXA(NSUInteger rgb, CGFloat alpha)
{
    return [UIColor colorWithRed:((float)((rgb & 0xFF0000) >> 16))/255.0
                           green:((float)((rgb & 0xFF00) >> 8))/255.0
                            blue:((float)(rgb & 0xFF))/255.0
                           alpha:alpha];
}

static __inline UIColor *RGBX(NSUInteger rgb)
{
    return RGBXA(rgb,1.0);
}
