//
//  Student+A.m
//  Test
//
//  Created by ME7O on 5/18/23.
//

#import "Student+A.h"
#import "ObjcExecManager.h"

@implementation Student (A)

+ (void)load {
    NSLog(@"%s", __FILE__);
    NSString *filePath = [[NSString stringWithUTF8String:__FILE__] stringByStandardizingPath];
    NSString *fileName = [filePath lastPathComponent];
    NSLog(@"%@", fileName);
    
    [[ObjcExecManager sharedManager] updateClassListForKey:fileName];
}

- (void)desc {
    NSLog(@"%s Student A desc", __FUNCTION__);
}

@end
