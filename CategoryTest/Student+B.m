//
//  Student+B.m
//  Test
//
//  Created by ME7O on 5/18/23.
//

#import "Student+B.h"
#import "ObjcExecManager.h"

@implementation Student (B)

+ (void)load {
    NSLog(@"%s", __FILE__);
    NSString *filePath = [[NSString stringWithUTF8String:__FILE__] stringByStandardizingPath];
    NSString *fileName = [filePath lastPathComponent];
    NSLog(@"%@", fileName);
    
    [[ObjcExecManager sharedManager] updateClassListForKey:fileName];
}

- (void)desc {
    NSLog(@"%s Student B desc", __FUNCTION__);
}

@end
