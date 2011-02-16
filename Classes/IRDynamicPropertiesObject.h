//
//  IRDynamicPropertiesObject.h
//  InvocationTesting
//
//  Created by Evadne Wu on 2/16/11.
//  Copyright 2011 Iridia Productions. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <objc/objc.h>
#import <objc/runtime.h>


@interface IRDynamicPropertiesObject : NSObject {

	NSMutableDictionary *internalStore;

}

@property (nonatomic, readwrite, retain) id aProperty;

@end
