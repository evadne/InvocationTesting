Tries out a way that, when an object holds an internal NSDictionary, it hosts Objective-C properties that are specified as @dynamic, and those properties will be resolved at run time.

The fun part is in `IRDynamicPropertiesObject`, and is coded against http://stackoverflow.com/questions/4574465/objective-c-respondstoselector-question .

The code is actually under the New BSD license, e.g. do whatever you would like to do with it, as it is wished to be useful.
