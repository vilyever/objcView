//
//  UIView+VDFrame.m
//  objcView
//
//  Created by Deng on 16/8/5.
//  Copyright © Deng. All rights reserved.
//

#import "UIView+VDFrame.h"

//#import <objc/runtime.h>


@implementation UIView (VDFrame)

@dynamic vd_frameOrigin;
@dynamic vd_frameSize;
@dynamic vd_frameX;
@dynamic vd_frameY;
@dynamic vd_frameWidth;
@dynamic vd_frameHeight;

#pragma mark Constructor


#pragma mark Public Method


#pragma mark Properties
- (void)setVd_frameOrigin:(CGPoint)vd_frameOrigin {
    [self setFrame:CGRectMake(vd_frameOrigin.x, vd_frameOrigin.y, self.frame.size.width, self.frame.size.height) ];
}

- (CGPoint)vd_frameOrigin {
    return self.frame.origin;
}

- (void)setVd_frameSize:(CGSize)vd_frameSize {
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, vd_frameSize.width, vd_frameSize.height) ];
}

- (CGSize)vd_frameSize {
    return self.frame.size;
}

- (void)setVd_frameX:(float)vd_frameX {
    [self setFrame:CGRectMake(vd_frameX, self.frame.origin.y, self.frame.size.width, self.frame.size.height) ];
}

- (float)vd_frameX {
    return self.frame.origin.x;
}

- (void)setVd_frameY:(float)vd_frameY {
    [self setFrame:CGRectMake(self.frame.origin.x, vd_frameY, self.frame.size.width, self.frame.size.height) ];
}

- (float)vd_frameY {
    return self.frame.origin.y;
}

- (void)setVd_frameWidth:(float)vd_frameWidth {
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, vd_frameWidth, self.frame.size.height) ];
}

- (float)vd_frameWidth {
    return self.frame.size.width;
}

- (void)setVd_frameHeight:(float)vd_frameHeight {
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, vd_frameHeight) ];
}

- (float)vd_frameHeight {
    return self.frame.size.height;
}

#pragma mark Protected Method


#pragma mark Private Method


@end
