//
//  Person+B.m
//  Test
//
//  Created by ME7O on 5/17/23.
//

#import "Person+B.h"
#import "ObjcExecManager.h"

@implementation Person (B)

+ (void)load {
    NSLog(@"%s", __FILE__);
    NSString *filePath = [[NSString stringWithUTF8String:__FILE__] stringByStandardizingPath];
    NSString *fileName = [filePath lastPathComponent];
    NSLog(@"%@", fileName);
    
    [[ObjcExecManager sharedManager] updateClassListForKey:fileName];
}

- (void)desc {
    NSLog(@"%s Person B desc", __FUNCTION__);
}
@end
