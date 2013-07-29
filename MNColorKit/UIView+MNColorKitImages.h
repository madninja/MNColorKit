//
//  UIView+MNColorKitImages.h
//  MNColorKit
//
//  Created by Marc Nijdam on 2/14/13.
//  Copyright (c) 2013 imadjine, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (MNColorKitImages)
+ (UIImage *)mn_imageNamed:(NSString *)name withColor:(UIColor *)color;
+ (UIImage *)mn_imageWithColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)mn_imageWithColor:(UIColor *)color;

- (UIImage *)mn_imageWithColor:(UIColor *)color;
@end

@interface UIButton (MNColorKitImages)
@property(assign,nonatomic,setter = mn_setImageColor:)UIColor *mn_imageColor;
@property(assign,nonatomic,setter = mn_setHighlightImageColor:)UIColor *mn_highlightImageColor;
- (void)mn_setImage:(UIImage *)image withColor:(UIColor *)color forState:(UIControlState)state;
@end

@interface UIImageView (MNColorKitImages)
@property(assign,nonatomic,setter = mn_setImageColor:)UIColor *mn_imageColor;
@end

@interface UIBarButtonItem (MNColorKitImages)
@property(assign,nonatomic,setter = mn_setImageColor:)UIColor *mn_imageColor;
@end
