//
//  BUBaseAction.m
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

#import "BUAction.h"

// Define all allowed actions
NSString* const BUActionAllow = @"allow";
NSString* const BUActionDeny = @"deny";

@implementation BUAction

- (id)initAction:(NSString*)actionType withOperation: (BUOperation*)op;
{
    self = [super init];
    if (self) {
        action = actionType;
        operation = op;
    }
    
    return self;
}

#pragma mark -
#pragma mark BUConfigItemProtocol Methods

- (NSString *)configString
{
    return [NSString stringWithFormat:@"(%@ %@)", action, [operation configString]];
}

#pragma mark -
#pragma mark Convenience Methods

+ (BUAction *)action:(NSString *)action withOperation:(BUOperation *)op
{
    return [[[self alloc] initAction:action withOperation:op] autorelease];
}

@end
