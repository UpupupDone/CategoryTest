//
//  ObjcExecManager.m
//  Test
//
//  Created by ME7O on 5/18/23.
//

#import "ObjcExecManager.h"
#import <objc/runtime.h>

@interface ObjcExecManager ()

@property (nonatomic, strong, readwrite) NSMutableDictionary *loadLevelMap;

@end

@implementation ObjcExecManager

+ (instancetype)sharedManager {
    static ObjcExecManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[self alloc] init];
    });
    return manager;
}

- (void)updateClassListForKey:(NSString *)key {
    
    NSString *cls = [self classNameForKey:key];
    if (!cls) {
        return;
    }
    
    NSMutableArray *list = [self.loadLevelMap objectForKey:cls];
    if (!list) {
        list = [NSMutableArray array];
    }
    [list insertObject:key atIndex:0];
    [self.loadLevelMap setObject:list forKey:cls];
}

- (NSArray *)classListForKey:(NSString *)cls {
    if (!cls) {
        return nil;
    }
    return [self.loadLevelMap objectForKey:cls];
}

- (NSInteger)categoryLoadIdxForName:(NSString *)categoryName {
    
    NSString *cls = [self classNameForKey:categoryName];
    if (!cls) {
        return -1;
    }

    NSMutableArray *list = [self.loadLevelMap objectForKey:cls];
    if (!list) {
        return -1;
    }
    
    return [list indexOfObject:categoryName];
}

- (NSMutableDictionary *)loadLevelMap {
    if (!_loadLevelMap) {
        _loadLevelMap = [[NSMutableDictionary alloc] init];
    }
    return _loadLevelMap;
}

- (NSString *)classNameForKey:(NSString *)key {
    
    if (!key) {
        return nil;
    }
    
    if (![key containsString:@"+"]) {
        return nil;
    }
    
    NSArray *arr = [key componentsSeparatedByString:@"+"];
    if (!arr.count) {
        return nil;
    }
    
    NSString *cls = [arr objectAtIndex:0];
    return cls;
}

- (void)execCategoryClass:(NSString *)categoryClsName sel:(NSString *)selName {
    
    NSInteger loadIndex = [self categoryLoadIdxForName:categoryClsName];
    NSString *clsName = [self classNameForKey:categoryClsName];

    if (loadIndex == -1 || !clsName) {
        return;
    }
    
    u_int count;
    Method *methods = class_copyMethodList(NSClassFromString(clsName), &count);
    NSInteger index = -1;
        
    for (int i = 0; i < count; i++) {
        SEL name = method_getName(methods[i]);
        NSString *strName = [NSString stringWithCString:sel_getName(name) encoding:NSUTF8StringEncoding];

        if ([strName isEqualToString:selName]) {
            index += 1;
            if (index == loadIndex) {
                index = i;
                break;
            }
        }
    }
    
    if (index == -1) {
        free(methods);
        return;
    }
    
    NSObject *obj = [[NSClassFromString(clsName) alloc] init];
    SEL sel = method_getName(methods[index]);
    IMP imp = method_getImplementation(methods[index]);
    ((void (*)(id, SEL))imp)(obj, sel);
    
    free(methods);
}

@end
