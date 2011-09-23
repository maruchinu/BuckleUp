//
//  BuckleUpAppDelegate.m
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

#import "BuckleUpAppDelegate.h"

#import "BUSandboxConfig.h"
#import "BUConfigItems.h"

@implementation BuckleUpAppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Test code below...
    
    BUVersion* version = [[BUVersion alloc] init];
    
    BUSandboxConfig* config = [[BUSandboxConfig alloc] initWithVersion:version];
    
    BUDefaultOperation* defaultOperation = [[BUDefaultOperation alloc] init];
    
    BUAllowAction* allowAction = [[BUAllowAction alloc] initWithOperation:defaultOperation];
    
    [config addAction:allowAction];
    
    NSLog(@"\n\n%@\n", [config configString]);
    
    // Quit the application
    [NSApp performSelector:@selector(terminate:) withObject:nil afterDelay:0.0];
}

@end
