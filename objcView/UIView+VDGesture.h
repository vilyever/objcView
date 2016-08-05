//
//  UIView+VDGesture.h
//  objcView
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (VDGesture)

#pragma mark Constructor


#pragma mark Public Method
- (void)vd_performActionOnTap:(void (^)(void) )action;
- (void)vd_performSelectorOnTapWithTarget:(id)target selector:(SEL)selector;


#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end
