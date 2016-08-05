//
//  UIView+VDConstraint.m
//  objcView
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UIView+VDConstraint.h"

//#import <objc/runtime.h>


@implementation UIView (VDConstraint)

#pragma mark Constructor


#pragma mark Public Method


#pragma mark Properties
- (CGFloat)vd_constraintTop {
    for (NSLayoutConstraint *constraint in [self.superview.constraints copy]) {
        if (constraint.firstItem == self
            && constraint.shouldBeArchived
            && constraint.active) {
            if (constraint.firstAttribute == NSLayoutAttributeTop) {
                return constraint.constant;
            }
        }
    }
    
    return 0.0f;
}

- (CGFloat)vd_constraintBottom {
    for (NSLayoutConstraint *constraint in [self.superview.constraints copy]) {
        if (constraint.secondItem == self
            && constraint.shouldBeArchived
            && constraint.active) {
            if (constraint.secondAttribute == NSLayoutAttributeBottom) {
                return constraint.constant;
            }
        }
    }
    
    return 0.0f;
}

- (CGFloat)vd_constraintLeading {
    for (NSLayoutConstraint *constraint in [self.superview.constraints copy]) {
        if (constraint.firstItem == self
            && constraint.shouldBeArchived
            && constraint.active) {
            if (constraint.firstAttribute == NSLayoutAttributeLeading) {
                return constraint.constant;
            }
        }
    }
    
    return 0.0f;
}

- (CGFloat)vd_constraintTrailing {
    for (NSLayoutConstraint *constraint in [self.superview.constraints copy]) {
        if (constraint.secondItem == self
            && constraint.shouldBeArchived
            && constraint.active) {
            if (constraint.secondAttribute == NSLayoutAttributeTrailing) {
                return constraint.constant;
            }
        }
    }
    
    return 0.0f;
}

- (CGFloat)vd_constraintWidth {
    for (NSLayoutConstraint *constraint in [self.constraints copy]) {
        if (constraint.firstItem == self
            && constraint.shouldBeArchived
            && constraint.active) {
            if (constraint.firstAttribute == NSLayoutAttributeWidth
                && !constraint.secondItem) {
                return constraint.constant;
            }
        }
    }
    
    if (self.vd_constraintAspectRatio != 0.0f) {
        return self.vd_constraintHeight * self.vd_constraintAspectRatio;
    }
    
    return 0.0f;
}

- (CGFloat)vd_constraintHeight {
    for (NSLayoutConstraint *constraint in [self.constraints copy]) {
        if (constraint.firstItem == self
            && constraint.shouldBeArchived
            && constraint.active) {
            if (constraint.firstAttribute == NSLayoutAttributeHeight
                && !constraint.secondItem) {
                return constraint.constant;
            }
        }
    }
    
    if (self.vd_constraintAspectRatio != 0.0f) {
        return self.vd_constraintWidth / self.vd_constraintAspectRatio;
    }
    
    return 0.0f;
}

- (CGFloat)vd_constraintAspectRatio {
    for (NSLayoutConstraint *constraint in [self.constraints copy]) {
        if (constraint.firstItem == self
            && constraint.shouldBeArchived
            && constraint.active) {
            if (constraint.secondItem == self) {
                if ( (constraint.firstAttribute == NSLayoutAttributeWidth
                      && constraint.secondAttribute == NSLayoutAttributeHeight)
                    || (constraint.firstAttribute == NSLayoutAttributeHeight
                        && constraint.secondAttribute == NSLayoutAttributeWidth) ) {
                    return constraint.multiplier;
                }
            }
        }
    }
    
    return 0.0f;
}

#pragma mark Protected Method


#pragma mark Private Method


@end
