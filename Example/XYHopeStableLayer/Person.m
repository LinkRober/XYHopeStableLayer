//
//  Person.m
//  XYHopeStableLayer_Example
//
//  Created by 夏敏 on 27/02/2018.
//  Copyright © 2018 LinkRober. All rights reserved.
//

#import "Person.h"

@implementation Person

//+ (void)fly{}

+ (BOOL)resolveClassMethod:(SEL)sel {
    return YES;
}
@end
