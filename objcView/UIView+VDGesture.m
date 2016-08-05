//
//  UIView+VDGesture.m
//  objcView
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UIView+VDGesture.h"

#import <objc/runtime.h>
#import <objcObject/objcObject.h>
#import <objcWeakRef/objcWeakRef.h>


@implementation UIView (VDGesture)

#pragma mark Constructor


#pragma mark Public Method
- (void)vd_performActionOnTap:(void (^)(void))action {
    [self vd_activeGestureOnTap];
    [self setVd_tapAction:action];
}

- (void)vd_performSelectorOnTapWithTarget:(id)target selector:(SEL)selector {
    [self vd_activeGestureOnTap];
    [self setVd_tapTarget:target];
    [self setVd_TapSelector:selector];
}

#pragma mark Properties
- (id)vd_tapTarget {
    VDWeakRef *ref = objc_getAssociatedObject(self, @selector(vd_tapTarget));
    id tapTarget = ref.weakObject;
    return tapTarget;
}

- (void)setVd_tapTarget:(id)tapTarget {
    VDWeakRef *ref = [tapTarget vd_weakRef];
    objc_setAssociatedObject(self, @selector(vd_tapTarget), ref, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (SEL)vd_tapSelector {
    NSString *selectorString = objc_getAssociatedObject(self, @selector(vd_tapSelector));
    SEL tapSelector = NSSelectorFromString(selectorString);
    return tapSelector;
}

- (void)setVd_TapSelector:(SEL)selector {
    NSString *selectorString = NSStringFromSelector(selector);
    objc_setAssociatedObject(self, @selector(vd_tapSelector), selectorString, OBJC_ASSOCIATION_COPY);
}

- (void (^)(void))vd_tapAction {
    id tapAction = objc_getAssociatedObject(self, @selector(vd_tapAction));
    return tapAction;
}

- (void)setVd_tapAction:(void (^)(void))tapAction {
    objc_setAssociatedObject(self, @selector(vd_tapAction), tapAction, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)vd_isOnTapActive {
    BOOL isActive = [objc_getAssociatedObject(self, @selector(vd_isOnTapActive)) boolValue];
    return isActive;
}

- (void)setVd_isOnTapActive:(BOOL)isActive {
    objc_setAssociatedObject(self, @selector(vd_isOnTapActive), @(isActive), OBJC_ASSOCIATION_ASSIGN);
}

#pragma mark Protected Method


#pragma mark Private Method
- (void)vd_activeGestureOnTap {
    if (![self vd_isOnTapActive]) {
        self.userInteractionEnabled = YES;
        [self setVd_isOnTapActive:YES];
        UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(vd_hangdleTapAction:)];
        [self addGestureRecognizer:tapGestureRecognizer];
    }
}

- (void)vd_hangdleTapAction:(UITapGestureRecognizer *)tapGestureRecognizer {
    [[self vd_tapTarget] vd_performSelector:[self vd_tapSelector]];
    if ([self vd_tapAction]) {
        [self vd_tapAction]();
    }
}

@end
