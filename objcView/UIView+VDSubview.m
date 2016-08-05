//
//  UIView+VDSubview.m
//  objcView
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UIView+VDSubview.h"

//#import <objc/runtime.h>
#import <objcKVO/objcKVO.h>

@implementation UIView (VDSubview)

#pragma mark Constructor


#pragma mark Public Method
- (NSArray *)vd_addSubview:(UIView *)view scaleToFill:(BOOL)scaleToFill {
    if (!view
        || [self.subviews containsObject:view]) {
        return nil;
    }
    
    if (scaleToFill) {
        return [self vd_addSubviewSpreadAutoLayout:view];
    }
    else {
        [self addSubview:view];
    }
    
    return nil;
}

- (void)vd_removeAllSubviews {
    for (UIView *view in [self.subviews copy]) {
        [view removeFromSuperview];
    }
}

- (void)vd_addSubviewSpread:(UIView *)view {
    if (!view
        || [self.subviews containsObject:view]) {
        return;
    }
    
    [self addSubview:view];
    
    [self vd_kvoWithTarget:self keyPath:VDKeyPath(self, bounds) action:^(VDKVOElement *element, VDKVOChange *change) {
        if (![self.subviews containsObject:view]) {
            [element dispose];
            return;
        }
        view.frame = [[change newValue] CGRectValue];
    }];    
}

- (NSArray *)vd_addSubviewSpreadAutoLayout:(UIView *)view {
    if (!view
        || [self.subviews containsObject:view]) {
        return nil;
    }
    
    [self addSubview:view];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[vdsubview]-0-|" options:0 metrics:nil views:@{@"vdsubview" : view} ] ];
    [array addObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[vdsubview]-0-|" options:0 metrics:nil views:@{@"vdsubview" : view} ] ];
    
    NSArray *constraints = [NSArray arrayWithArray:array];
    
    [self addConstraints:constraints];
    
    return constraints;
}

#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end
