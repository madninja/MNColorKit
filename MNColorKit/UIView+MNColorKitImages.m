//
//  UIView+MNColorKitImages.m
//  MNColorKit
//
//  Created by Marc Nijdam on 2/14/13.
//  Copyright (c) 2013 imadjine, LLC. All rights reserved.
//

#import "UIView+MNColorKitImages.h"

#import <objc/runtime.h>

@implementation UIImage (MNColorKitImages)

+ (UIImage *)mn_imageNamed:(NSString *)name withColor:(UIColor *)color
{
    // load the image
    UIImage *img = [UIImage imageNamed:name];
    
    if (!color) return img;
    
    return [img mn_imageWithColor:color];
}

+ (UIImage *)mn_imageWithColor:(UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0.0, 0.0, size.width, size.height);
    
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)mn_imageWithColor:(UIColor *)color
{
    return [self mn_imageWithColor:color size:CGSizeMake(10, 10)];
}


- (UIImage *)mn_imageWithColor:(UIColor *)color
{
    // begin a new image context, to draw our colored image onto
    UIGraphicsBeginImageContextWithOptions(self.size, NO, 0.0);
    
    CGRect rect = CGRectZero;
    rect.size = [self size];
    
    // set the fill color and fill the background
    [color set];
    UIRectFill(rect);
    
    [self drawInRect:rect blendMode:kCGBlendModeDestinationIn alpha:1.0];
    
    // generate a new UIImage from the graphics context we drew onto
    UIImage *coloredImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    //return the color image
    return coloredImg;
}


@end

#pragma mark -

static char kUIImageColorKey;
static char kUIHighlightImageColorKey;

@implementation UIButton (MNColorKitImages)

- (void)mn_setImageColor:(UIColor *)imageColor
{
    objc_setAssociatedObject(self, &kUIImageColorKey, imageColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    UIImage *image = [self imageForState:UIControlStateNormal];
    [self mn_setImage:image withColor:imageColor forState:UIControlStateNormal];
}

- (UIColor *)mn_imageColor
{
    return objc_getAssociatedObject(self, &kUIImageColorKey);
}

- (void)mn_setHighlightImageColor:(UIColor *)highlightImageColor
{
    objc_setAssociatedObject(self, &kUIHighlightImageColorKey, highlightImageColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    UIImage *image = [self imageForState:UIControlStateNormal];
    [self mn_setImage:image withColor:highlightImageColor forState:UIControlStateHighlighted];
}

- (UIColor *)mn_highlightImageColor
{
    return objc_getAssociatedObject(self, &kUIHighlightImageColorKey);
}


- (void)mn_setImage:(UIImage *)image withColor:(UIColor *)color forState:(UIControlState)state
{
    image = [image mn_imageWithColor:color];
    [self setImage:image forState:state];
}

@end

#pragma mark -

@implementation UIImageView (MNColorKitImages)

- (UIColor *)mn_imageColor
{
    return objc_getAssociatedObject(self, &kUIImageColorKey);
}

- (void)mn_setImageColor:(UIColor *)imageColor
{
    objc_setAssociatedObject(self, &kUIImageColorKey, imageColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    self.image = [self.image mn_imageWithColor:imageColor];
}

@end

#pragma mark -

@implementation UIBarButtonItem (MNColorKitImages)

- (UIColor *)mn_imageColor
{
    return objc_getAssociatedObject(self, &kUIImageColorKey);
}

- (void)mn_setImageColor:(UIColor *)imageColor
{
    objc_setAssociatedObject(self, &kUIImageColorKey, imageColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    self.image = [self.image mn_imageWithColor:imageColor];
}

@end
