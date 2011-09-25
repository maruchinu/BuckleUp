//
//  BUBaseAction.h
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

#import <Foundation/Foundation.h>

#import "BUConfigItem.h"
#import "BUAction.h"
#import "BUOperation.h"

// Define all allowed actions
extern NSString* const BUActionAllow;
extern NSString* const BUActionDeny;

@interface BUAction : NSObject<BUConfigItemProtocol>
{
    
@protected 
    
    NSString* action;
    BUOperation* operation;
}

- (id)initAction:(NSString*)actionType withOperation: (BUOperation*)op;

+ (BUAction*) action:(NSString*)action withOperation: (BUOperation*)op;

@end
