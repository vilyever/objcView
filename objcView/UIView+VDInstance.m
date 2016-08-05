//
//  UIView+VDInstance.m
//  objcView
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UIView+VDInstance.h"

//#import <objc/runtime.h>


@implementation UIView (VDInstance)

#pragma mark Constructor
+ (instancetype)vd_viewFromNib {
    return [self vd_viewFromNibWithNibName:NSStringFromClass( [self class] ) ];
}

+ (instancetype)vd_viewFromNibWithNibName:(NSString *)nibName {
    UIView *instance = [[[self class] alloc] init];
    NSArray *nibViews = [ [NSBundle mainBundle] loadNibNamed:nibName owner:instance options:nil];
    instance = nibViews[0];
    return instance;
}

#pragma mark Public Method


#pragma mark Properties


#pragma mark Protected Method


#pragma mark Private Method


@end
