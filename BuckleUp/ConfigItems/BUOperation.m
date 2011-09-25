//
//  BUBaseOperation.m
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

#import "BUOperation.h"

// Define all possible operations
NSString* const BUOperationDefault = @"default";

NSString* const BUOperationFileAll = @"file*";
NSString* const BUOperationFileChroot = @"file-chroot";
NSString* const BUOperationFileIoctl = @"file-ioctl";
NSString* const BUOperationFileReadAll = @"file-read*";
NSString* const BUOperationFileReadData = @"file-read-data";
NSString* const BUOperationFileReadMetadata = @"file-read-metadata";
NSString* const BUOperationFileReadXattr = @"file-read-xattr";
NSString* const BUOperationFileRevoke = @"file-revoke";
NSString* const BUOperationFileWriteAll = @"file-write*";
NSString* const BUOperationFileWriteData = @"file-write-data";
NSString* const BUOperationFileWriteFlags = @"file-write-flags";
NSString* const BUOperationFileWriteMode = @"file-write-mode";
NSString* const BUOperationFileWriteMount = @"file-write-mount";
NSString* const BUOperationFileWriteOwner = @"file-write-owner";
NSString* const BUOperationFileWriteSetUGID = @"file-write-setugid";
NSString* const BUOperationFileWriteTimes = @"file-write-times";
NSString* const BUOperationFileWriteUnmount = @"file-write-unmount";
NSString* const BUOperationFileWriteXattr = @"file-write-xattr";

NSString* const BUOperationIpcAll = @"ipc*";
NSString* const BUOperationIpcPosixAll = @"ipc-posix*";
NSString* const BUOperationIpcPosixSem = @"ipc-posix-sem";
NSString* const BUOperationIpcPosixShm = @"ipc-posix-shm";
NSString* const BUOperationIpcSysvAll = @"ipc-sysv*";
NSString* const BUOperationIpcSysvMsg = @"ipc-sysv-msg";
NSString* const BUOperationIpcSysvSem = @"ipc-sysv-sem";
NSString* const BUOperationIpcSysvShm = @"ipc-sysv-shm";

NSString* const BUOperationMachAll = @"mach*";
NSString* const BUOperationMachBootstrap = @"mach-bootstrap";
NSString* const BUOperationMachLookup = @"mach-lookup";
NSString* const BUOperationMachPrivAll = @"mach-priv*";
NSString* const BUOperationMachPrivHostPort = @"mach-priv-host-port";
NSString* const BUOperationMachPrivTaskPort = @"mach-priv-task-port";
NSString* const BUOperationMachTaskName = @"mach-task-name";

NSString* const BUOperationNetworkAll = @"network*";
NSString* const BUOperationNetworkInbound = @"network-inbound";
NSString* const BUOperationNetworkBind = @"network-bind";
NSString* const BUOperationNetworkOutbound = @"network-outbound";

NSString* const BUOperationProcessAll = @"process*";
NSString* const BUOperationProcessExec = @"process-exec";
NSString* const BUOperationProcessFork = @"process-fork";

NSString* const BUOperationSignal = @"signal";

NSString* const BUOperationSysctlAll = @"sysctl*";
NSString* const BUOperationSysctlRead = @"sysctl-read";
NSString* const BUOperationSysctlWrite = @"sysctl-write";

NSString* const BUOperationSystemAll = @"system*";
NSString* const BUOperationSystemAcct = @"system-acct";
NSString* const BUOperationSystemAudit = @"system-audit";
NSString* const BUOperationSystemFsctl = @"system-fsctl";
NSString* const BUOperationSystemLcid = @"system-lcid";
NSString* const BUOperationSystemMacLabel = @"system-mac-label";
NSString* const BUOperationSystemNfssvc = @"system-nfssvc";
NSString* const BUOperationSystemReboot = @"system-reboot"; // Doesn't seem to work!
NSString* const BUOperationSystemSetTime = @"system-set-time";
NSString* const BUOperationSystemSocket = @"sytem-socket";
NSString* const BUOperationSystemSwap = @"system-swap";

@implementation BUOperation

- (id)initWithOperation:(NSString*)operationType
{
    self = [super init];
    if (self) {
        operation = operationType;
    }
    
    return self;
}

#pragma mark -
#pragma mark BUConfigItemProtocol Methods

- (NSString *)configString
{
    return [NSString stringWithFormat:@"%@", operation];
}

#pragma mark -
#pragma mark Convenience Methods

+ (BUOperation*) operation: (NSString*)operationType;
{
    return [[[self alloc] initWithOperation:operationType] autorelease];
}

@end
