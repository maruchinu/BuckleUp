//
//  BUVersion.m
//  BuckleUp
//
//  Copyright 2011 Martin Planer
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//  
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

#import "BUVersion.h"

// Define all possible operations
NSString* const BUVersion1 = @"1";

@implementation BUVersion

- (id)init
{
    self = [super init];
    if (self) {
        version = BUVersion1;
    }
    
    return self;
}

#pragma mark -
#pragma mark BUConfigItemProtocol Methods

- (NSString*) configString
{
    return [NSString stringWithFormat:@"(version %@)", version];
}

#pragma mark -
#pragma mark Convenience Methods

+ (BUVersion *)version
{
    return [[[self alloc] init] autorelease];
}

@end
