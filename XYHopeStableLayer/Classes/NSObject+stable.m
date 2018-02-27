//
//  NSObject+stable.m
//  XYHopeStableLayer
//
//  Created by 夏敏 on 27/02/2018.
//

#import "NSObject+stable.h"
#import "JRSwizzle.h"
#import <objc/runtime.h>


@interface XYMockTargetObject:NSObject

- (instancetype)initWithSelector:(SEL)aSelector;

@end

id mockIMP(id sender,SEL sel,...){
    return nil;
}

@implementation XYMockTargetObject

- (instancetype)initWithSelector:(SEL)aSelector {
    if(self = [super init]){
        if(class_addMethod([self class], aSelector, (IMP)mockIMP, NULL)){}
    }
    return self;
}
@end

@implementation NSObject (stable)

+ (void)load {
    NSError *error = nil;
    [NSObject jr_swizzleMethod:@selector(forwardingTargetForSelector:)
                    withMethod:@selector(xy_forwardingInstanceTargetForSelector:)
                         error:&error];
    [NSObject jr_swizzleClassMethod:@selector(forwardingTargetForSelector:)
                    withClassMethod:@selector(xy_forwardingClassTargetForSelector:)
                              error:&error];
    
}

- (id)xy_forwardingInstanceTargetForSelector:(SEL)aSelector{
    NSMethodSignature *signature = [self methodSignatureForSelector:aSelector];
    if([self respondsToSelector:aSelector] || signature){
        return [self xy_forwardingInstanceTargetForSelector:aSelector];
    }
    return [NSObject createMockForwardTargetObject:self selector:aSelector];
}

- (id)xy_forwardingClassTargetForSelector:(SEL)aSelector{
    NSMethodSignature *signature = [self methodSignatureForSelector:aSelector];
    if([self respondsToSelector:aSelector] || signature){
        return [self xy_forwardingClassTargetForSelector:aSelector];
    }
    return [NSObject createMockForwardTargetObject:self selector:aSelector];
}

+ (id)createMockForwardTargetObject:(id)aTarget selector:(SEL)aSelector {
    return [[XYMockTargetObject alloc] initWithSelector:aSelector];
}



@end
