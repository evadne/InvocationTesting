//
//  IRDynamicPropertiesObject.m
//  InvocationTesting
//
//  Created by Evadne Wu on 2/16/11.
//  Copyright 2011 Iridia Productions. All rights reserved.
//

#import "IRDynamicPropertiesObject.h"


@implementation IRDynamicPropertiesObject

@dynamic aProperty;

- (id) init {

	self = [super init];
	
	internalStore = [[NSMutableDictionary dictionary] retain];
	
	[internalStore setObject:@"Hello" forKey:@"notAProperty"];
	[internalStore setObject:@"World" forKey:@"aProperty"];
	
	return self;

}

- (void) dealloc {

	[internalStore release];
	[super dealloc];

}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {

	NSString *anInternalKey = [NSString stringWithCString:sel_getName(aSelector) encoding:NSUTF8StringEncoding];
	
	if ([internalStore valueForKey:anInternalKey] != nil)
	return [internalStore methodSignatureForSelector:@selector(valueForKey:)];
	
	return [super methodSignatureForSelector:aSelector];

}

- (void) forwardInvocation:(NSInvocation *)anInvocation {

	if ([anInvocation target] == self) {
	
		NSString *anInternalKey = [NSString stringWithCString:sel_getName([anInvocation selector]) encoding:NSUTF8StringEncoding];
		
		if (anInternalKey != nil) {
		
			id returnedValue = [internalStore valueForKey:anInternalKey];
			[anInvocation setReturnValue:&returnedValue];
			
			return;
		
		}
	
	}
	
	[super forwardInvocation:anInvocation];

}

- (BOOL) respondsToSelector:(SEL)aSelector {

//	This is an user-facing method, will not be used by the runtime anyway
	
	NSString *anInternalKey = [NSString stringWithCString:sel_getName(aSelector) encoding:NSUTF8StringEncoding];
	
	if ([internalStore valueForKey:anInternalKey] != nil)
	return YES;

	return [super respondsToSelector:aSelector];

}

- (id) valueForKey:(NSString *)key {

	id returnedValue = nil;
	
	@try {
	
		returnedValue = [internalStore valueForKey:key];
	
	} @catch (NSException *exception) {
		
		if (![[exception name] isEqual:NSUndefinedKeyException])
		@throw exception;
		
	}
	
	if (returnedValue)
	return returnedValue;
	
	return [super valueForKey:key];

}

@end
