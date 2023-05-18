//
//  Person+C.m
//  Test
//
//  Created by ME7O on 5/17/23.
//

#import "Person+C.h"
#import "ObjcExecManager.h"

@implementation Person (C)

+ (void)load {
    NSLog(@"%s", __FILE__);
    NSString *filePath = [[NSString stringWithUTF8String:__FILE__] stringByStandardizingPath];
    NSString *fileName = [filePath lastPathComponent];
    NSLog(@"%@", fileName);
    
    [[ObjcExecManager sharedManager] updateClassListForKey:fileName];
}

- (void)desc {
    NSLog(@"%s Person C desc", __FUNCTION__);
}

@end
