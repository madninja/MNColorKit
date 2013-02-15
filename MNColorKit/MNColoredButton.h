//
//  Created by Marc Nijdam on 12/5/12.
//
//

#import <UIKit/UIKit.h>

@interface MNColoredButton : UIButton <UIAppearanceContainer>

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
- (void)setTitleFont:(UIFont *)font NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;
- (void)setCornerRadius:(CGFloat)radius NS_AVAILABLE_IOS(5_0) UI_APPEARANCE_SELECTOR;

@end
