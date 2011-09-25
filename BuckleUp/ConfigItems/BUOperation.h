//
//  BUBaseOperation.h
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

// Define all possible operations
extern NSString* const BUOperationDefault;

extern NSString* const BUOperationFileAll;
extern NSString* const BUOperationFileChroot;
extern NSString* const BUOperationFileIoctl;
extern NSString* const BUOperationFileReadAll;
extern NSString* const BUOperationFileReadData;
extern NSString* const BUOperationFileReadMetadata;
extern NSString* const BUOperationFileReadXattr;
extern NSString* const BUOperationFileRevoke;
extern NSString* const BUOperationFileWriteAll;
extern NSString* const BUOperationFileWriteData;
extern NSString* const BUOperationFileWriteFlags;
extern NSString* const BUOperationFileWriteMode;
extern NSString* const BUOperationFileWriteMount;
extern NSString* const BUOperationFileWriteOwner;
extern NSString* const BUOperationFileWriteSetUGID;
extern NSString* const BUOperationFileWriteTimes;
extern NSString* const BUOperationFileWriteUnmount;
extern NSString* const BUOperationFileWriteXattr;

extern NSString* const BUOperationIpcAll;
extern NSString* const BUOperationIpcPosixAll;
extern NSString* const BUOperationIpcPosixSem;
extern NSString* const BUOperationIpcPosixShm;
extern NSString* const BUOperationIpcSysvAll;
extern NSString* const BUOperationIpcSysvMsg;
extern NSString* const BUOperationIpcSysvSem;
extern NSString* const BUOperationIpcSysvShm;

extern NSString* const BUOperationMachAll;
extern NSString* const BUOperationMachBootstrap;
extern NSString* const BUOperationMachLookup;
extern NSString* const BUOperationMachPrivAll;
extern NSString* const BUOperationMachPrivHostPort;
extern NSString* const BUOperationMachPrivTaskPort;
extern NSString* const BUOperationMachTaskName;

extern NSString* const BUOperationNetworkAll;
extern NSString* const BUOperationNetworkInbound;
extern NSString* const BUOperationNetworkBind;
extern NSString* const BUOperationNetworkOutbound;

extern NSString* const BUOperationProcessAll;
extern NSString* const BUOperationProcessExec;
extern NSString* const BUOperationProcessFork;

extern NSString* const BUOperationSignal;

extern NSString* const BUOperationSysctlAll;
extern NSString* const BUOperationSysctlRead;
extern NSString* const BUOperationSysctlWrite;

extern NSString* const BUOperationSystemAll;
extern NSString* const BUOperationSystemAcct;
extern NSString* const BUOperationSystemAudit;
extern NSString* const BUOperationSystemFsctl;
extern NSString* const BUOperationSystemLcid;
extern NSString* const BUOperationSystemMacLabel;
extern NSString* const BUOperationSystemNfssvc;
extern NSString* const BUOperationSystemReboot; // Doesn't seem to work!
extern NSString* const BUOperationSystemSetTime;
extern NSString* const BUOperationSystemSocket;
extern NSString* const BUOperationSystemSwap;

@interface BUOperation : NSObject<BUConfigItemProtocol>
{
@protected
    
    NSString* operation;
}

- (id) initWithOperation: (NSString*)operationType;
+ (BUOperation*) operation: (NSString*)operationType;

@end
