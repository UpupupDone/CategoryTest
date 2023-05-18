//
//  Student+C.m
//  Test
//
//  Created by ME7O on 5/18/23.
//

#import "Student+C.h"
#import "ObjcExecManager.h"

@implementation Student (C)

+ (void)load {
    NSLog(@"%s", __FILE__);
    NSString *filePath = [[NSString stringWithUTF8String:__FILE__] stringByStandardizingPath];
    NSString *fileName = [filePath lastPathComponent];
    NSLog(@"%@", fileName);
    
    [[ObjcExecManager sharedManager] updateClassListForKey:fileName];
}

- (void)desc {
    NSLog(@"%s Student C desc", __FUNCTION__);
}

@end
