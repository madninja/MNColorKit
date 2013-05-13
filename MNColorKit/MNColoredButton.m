//
//  SMWColoredButton.m
//  
//
//  Created by Marc Nijdam on 12/5/12.
//
//

#import "MNColoredButton.h"
#import <QuartzCore/QuartzCore.h>

@interface MNColoredButton()

@property(strong,nonatomic)UIColor *highlightBackgroundColor;
@property(strong,nonatomic)UIColor *normalBackgroundColor;
@property(strong,nonatomic)UIColor *disabledBackgroundColor;

@end

@implementation MNColoredButton

- (void)_setup
{
    self.layer.cornerRadius = 2.0;
    if (!self.titleLabel) {
        self.titleLabel.font = [UIFont boldSystemFontOfSize:12];
        self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
}

- (id)init
{
    self = [super init];
    if (!self) return nil;
    
    [self _setup];
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (!self) return nil;
    
    [self _setup];
    
    return self;
}

- (void)setTitleFont:(UIFont *)font
{
    self.titleLabel.font = font;
}

- (void)setCornerRadius:(CGFloat)radius
{
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = radius;
}

- (void)_updateBackgroundColor
{
    self.backgroundColor = self.isEnabled ? self.normalBackgroundColor : self.disabledBackgroundColor;
    if (self.isHighlighted) self.backgroundColor = self.highlightBackgroundColor;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state
{
    switch (state) {
        case UIControlStateNormal:
            self.normalBackgroundColor = backgroundColor;
            break;
        case UIControlStateDisabled:
            self.disabledBackgroundColor = backgroundColor;
            break;
        case UIControlStateHighlighted:
            self.highlightBackgroundColor = backgroundColor;
        default:
            break;
    }
    [self _updateBackgroundColor];
}

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state
{
    [super setTitleColor:color forState:state];
}

- (void)setEnabled:(BOOL)enabled
{
    [super setEnabled:enabled];
    
    [self _updateBackgroundColor];
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    
    [self _updateBackgroundColor];
}

@end
