//
//  InvocationTestingAppDelegate.m
//  InvocationTesting
//
//  Created by Evadne Wu on 2/16/11.
//  Copyright 2011 Iridia Productions. All rights reserved.
//

#import "InvocationTestingAppDelegate.h"

@implementation InvocationTestingAppDelegate

@synthesize window;

- (BOOL) application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	[self.window makeKeyAndVisible];
    
	IRDynamicPropertiesObject *testObject = [[[IRDynamicPropertiesObject alloc] init] autorelease];
    
	NSLog(@"%@", [testObject valueForKey:@"notAProperty"]);
	NSLog(@"%@", testObject.aProperty);

	return YES;

}

- (void) dealloc {

	[window release];
	[super dealloc];

}

@end
