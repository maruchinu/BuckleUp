//
//  BuckleUpAppDelegate.h
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

#import <Cocoa/Cocoa.h>

@interface BuckleUpAppDelegate : NSObject <NSApplicationDelegate> {
    NSWindow *window;
    
    NSImageView* appIcon;
    NSTextField* appName;
    
    NSString* appExecutable;
    
    IBOutlet NSButton* fileAllCheckbox;
    IBOutlet NSButton* fileReadCheckbox;
    IBOutlet NSButton* fileWriteCheckbox;
    
    IBOutlet NSButton* networkAllCheckbox;
    IBOutlet NSButton* networkInboundCheckbox;
    IBOutlet NSButton* networkOutboundCheckbox;
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, retain) IBOutlet NSImageView *appIcon;
@property (nonatomic, retain) IBOutlet NSTextField *appName;

@end
