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
#import "BUAction.h"
#import "BUOperation.h"

#import "BUExecutableLauncher.h"

#import "BUToolbarDelegate.h"

@implementation BuckleUpAppDelegate

@synthesize window;
@synthesize appIcon;
@synthesize appName;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{

    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(launchClicked:) 
                                                 name:BULaunchClickedNotification 
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(createLauncherClicked:) 
                                                 name:BUCreateLauncherClickedNotification 
                                               object:nil];
    
    [self application:NSApp openFile:@"/Applications/Calculator.app"];
}

- (void) launchClicked: (NSNotification*)notification
{
    if(appExecutable == nil) {
        NSLog(@"No executable specified yet!");
        return;
    }
    
    BUVersion* version = [BUVersion version];
    BUSandboxConfig* config = [BUSandboxConfig configWithVersion:version];
    
    BUOperation* defaultOperation = [BUOperation operation:BUOperationDefault];
    BUAction* allowAction = [BUAction action:BUActionAllow withOperation:defaultOperation];
    [config addAction:allowAction];
    
    if([fileAllCheckbox state] == NSOnState)
    {
        BUOperation* op = [BUOperation operation:BUOperationFileAll];
        BUAction* action = [BUAction action:BUActionDeny withOperation:op];
        
        [config addAction:action];
    }
    
    if([fileReadCheckbox state] == NSOnState)
    {
        BUOperation* op = [BUOperation operation:BUOperationFileReadAll];
        BUAction* action = [BUAction action:BUActionDeny withOperation:op];
        
        [config addAction:action];
    }
    
    if([fileWriteCheckbox state] == NSOnState)
    {
        BUOperation* op = [BUOperation operation:BUOperationFileWriteAll];
        BUAction* action = [BUAction action:BUActionDeny withOperation:op];
        
        [config addAction:action];
    }
    
    if([networkAllCheckbox state] == NSOnState)
    {
        BUOperation* op = [BUOperation operation:BUOperationNetworkAll];
        BUAction* action = [BUAction action:BUActionDeny withOperation:op];
        
        [config addAction:action];
    }
    
    if([networkInboundCheckbox state] == NSOnState)
    {
        BUOperation* op = [BUOperation operation:BUOperationNetworkInbound];
        BUAction* action = [BUAction action:BUActionDeny withOperation:op];
        
        [config addAction:action];
    }
    
    if([networkOutboundCheckbox state] == NSOnState)
    {
        BUOperation* op = [BUOperation operation:BUOperationNetworkOutbound];
        BUAction* action = [BUAction action:BUActionDeny withOperation:op];
        
        [config addAction:action];
    }
        
    [BUExecutableLauncher launchExecutable:appExecutable withConfig:config];
}

- (void) createLauncherClicked: (NSNotification*)notification
{
    
}

- (BOOL)application:(NSApplication *)sender openFile:(NSString *)filename
{
    NSBundle* appBundle = [NSBundle bundleWithPath:filename];
    
    if(appBundle == nil) {
        NSLog(@"Could not open %@ as bundle!\n", filename);
        return NO;
    }
    
    NSDictionary* bundleDict = [appBundle infoDictionary];
    [appName setStringValue:[bundleDict objectForKey:(NSString*)kCFBundleNameKey]];
    
    NSImage* icon = [[NSWorkspace sharedWorkspace] iconForFile:filename];
    [appIcon setImage:icon];
    
    appExecutable = [appBundle executablePath];

    return YES;
}

@end
