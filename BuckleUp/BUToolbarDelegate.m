//
//  BUToolbarDelegate.m
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

#import "BUToolbarDelegate.h"


@implementation BUToolbarDelegate

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (NSArray *)toolbarAllowedItemIdentifiers:(NSToolbar *)toolbar
{
    return [NSArray arrayWithObjects:
            BUToolbarLaunchItemIdentifier,
            BUToolbarCreateLauncherItemIdentifier, 
            nil];
}

- (NSArray *)toolbarDefaultItemIdentifiers:(NSToolbar *)toolbar
{
    return [NSArray arrayWithObjects:
            BUToolbarLaunchItemIdentifier, 
            BUToolbarCreateLauncherItemIdentifier, 
            nil];
}

- (NSToolbarItem *)toolbar:(NSToolbar *)toolbar itemForItemIdentifier:(NSString *)itemIdentifier willBeInsertedIntoToolbar:(BOOL)flag
{
    
    if([itemIdentifier isEqualTo:BUToolbarLaunchItemIdentifier])
    {
        NSToolbarItem* launchItem = [[NSToolbarItem alloc] initWithItemIdentifier:BUToolbarLaunchItemIdentifier];
        
        [launchItem setEnabled:YES];
        [launchItem setLabel:@"Launch"];
        [launchItem setPaletteLabel:@"Launch"];
        [launchItem setToolTip:@"Launches the selected Program with the current config"];
        
        [launchItem setTarget:self];
        [launchItem setAction:@selector(launchClicked:)];
        
        return [launchItem autorelease];
    } 
    else if([itemIdentifier isEqualTo:BUToolbarCreateLauncherItemIdentifier])
    {
        NSToolbarItem* launcherItem = [[NSToolbarItem alloc] initWithItemIdentifier:BUToolbarCreateLauncherItemIdentifier];
        
        [launcherItem setEnabled:YES];
        [launcherItem setLabel:@"Create Launcher"];
        [launcherItem setPaletteLabel:@"Create Launcher"];
        [launcherItem setToolTip:@"Creates a launcher for the selected Application with the current config"];
        
        [launcherItem setTarget:self];
        [launcherItem setAction:@selector(createLauncherClicked:)];
        
        return [launcherItem autorelease];
    }
    
    // Invalid item requested - return nothing
    return nil;
}

#pragma mark -
#pragma mark Toolbar Item Actions

- (void) launchClicked: (id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:BULaunchClickedNotification object:self];
}

- (void) createLauncherClicked: (id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:BUCreateLauncherClickedNotification object:self];
}

@end
